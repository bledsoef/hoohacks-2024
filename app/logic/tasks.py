from sqlalchemy.orm import Session, aliased
from sqlalchemy import or_, and_, func
from app.models.models import User, Task
from datetime import datetime
import requests
import os
from pathlib import Path
import dotenv

env_path = Path('.') / '.env'
dotenv.load_dotenv()
def create_new_task(db: Session, request_data):
    try:
        new_task = Task(user=request_data["username"],
                        title=request_data["title"], # need for completed and assigned
                        gameTitle=request_data["gameTitle"],
                        expirationDate=datetime.strptime(request_data["expirationDate"], "%Y/%m/%d"), # need for completed and assigned
                        status=request_data["status"], 
                        dateCompleted=None, # need for completed
                        quantity=request_data["quantity"], # need for completed and assigned
                        metric=request_data["metric"], # need for completed and assigned
                        category=request_data["category"], # need for completed and assigned
                        taskDescription=request_data["taskDescription"], # need for completed and assigned
                        rewardDescription=request_data["rewardDescription"]) # need for completed and assigned
        db.add(new_task)
        db.commit()
    except Exception as e:
        print(e)

def get_tasks_for_user(db: Session, username):
    fitbit_information = get_fitbit_information()
    gameTitles = set()
    all_tasks = db.query(Task).filter(Task.user==username).all()
    for task in all_tasks:
        gameTitles.add(task.gameTitle)
    grouped_tasks = {}
    gameTitlesList = list(gameTitles)
    gameTitlesList.append("Past Tasks")
    for gameTitle in gameTitlesList:
        assigned_query = db.query(Task).filter(
            Task.user == username,
            Task.gameTitle==gameTitle,
            Task.status == "Assigned",
            or_(
                Task.expirationDate.is_(None),
                and_(
                    Task.expirationDate != None,
                    Task.expirationDate >= func.now()
                )
            )
        )
        assigned_tasks = [task.__dict__ for task in assigned_query]
        for i in range(len(assigned_tasks)):
            if assigned_tasks[i]["metric"] == "steps":
                assigned_tasks[i]["progress"] = fitbit_information["steps"]
            elif assigned_tasks[i]["metric"] == "miles":
                assigned_tasks[i]["progress"] = fitbit_information["kilometers"]
            elif assigned_tasks[i]["metric"] == "minutes of exercise":
                assigned_tasks[i]["progress"] = fitbit_information["minutesExercising"]

            if "progress" in assigned_tasks[i] and assigned_tasks[i]["progress"] >= assigned_tasks[i]["quantity"]:
                assigned_tasks[i]["status"] = "Completed"
                finished_task = db.query(Task).filter(Task.id == assigned_tasks[i]["id"]).first()
                finished_task.status = "Completed"
                db.commit()
 
        grouped_tasks[gameTitle] = {"assigned": assigned_tasks}
    
    expired_query = db.query(Task).filter(Task.user==username, Task.status=="Assigned", Task.expirationDate and Task.expirationDate < datetime.now())
    expired_tasks = [task.__dict__ for task in expired_query]
    completed_query = db.query(Task).filter(Task.user==username, Task.status=="Completed").all()
    completed_tasks = [task.__dict__ for task in completed_query]
    grouped_tasks["Past Tasks"] = {"assigned":expired_tasks + completed_tasks}
    return grouped_tasks

def get_fitbit_information():
    header = {'Authorization': 'Bearer {}'.format(os.environ["ACCESS_TOKEN"])}
    date = datetime.now().strftime("%Y-%m-%d")
    activity_response = requests.get(f"https://api.fitbit.com/1/user/-/activities/date/{date}.json", headers=header).json()
    sleep_response = requests.get(f"https://api.fitbit.com/1.2/user/-/sleep/date/{date}.json", headers=header).json()
    summary = activity_response.get("summary", None)
    steps = 0
    kilometers = 0
    minutesExercising = 0
    if summary:
        steps = summary.get("steps", 0)
        distances = summary.get("distances", [])
        if distances:
            total = distances[0]
            kilometers = total.get("distance", 0)
        fairlyActiveMinutes = summary.get("fairlyActiveMinutes", 0)
        veryActiveMinutes = summary.get("veryActiveMinutes", 0)
        minutesExercising = fairlyActiveMinutes + veryActiveMinutes
    sleep = sleep_response.get("sleep", [])
    efficiency = 0
    if sleep:
        sleep_info = sleep[0]
        efficiency = sleep_info.get("efficiency", 0)
    sleep_summary = sleep_response.get("summary", None)
    hoursAsleep = 0
    if sleep_summary:
        hoursAsleep = sleep_summary.get("totalMinutesAsleep", 0) / 60
    return {
        "steps": steps, 
        "kilometers": kilometers, 
        "minutesExercising": minutesExercising,
        "sleepEfficiency": efficiency,
        "hoursAsleep": hoursAsleep
        }