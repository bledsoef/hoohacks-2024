from sqlalchemy.orm import Session, aliased
from sqlalchemy import or_, and_, func
from app.models.models import User, Task
from datetime import datetime
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
    gameTitles = set()
    all_tasks = db.query(Task).filter(Task.user==username).all()
    for task in all_tasks:
        gameTitles.add(task.gameTitle)
    grouped_tasks = {}
    for gameTitle in list(gameTitles):
        completed_query = db.query(Task).filter(Task.user==username, Task.gameTitle==gameTitle, Task.status=="Completed").all()
        completed_tasks = [task.__dict__ for task in completed_query]
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
        expired_query = db.query(Task).filter(Task.user==username, Task.gameTitle==gameTitle, Task.status=="Assigned", Task.expirationDate and Task.expirationDate < datetime.now())
        expired_tasks = [task.__dict__ for task in expired_query]
        grouped_tasks[gameTitle] = {"completed": completed_tasks, "assigned": assigned_tasks, "expired": expired_tasks}
    return grouped_tasks
