from sqlalchemy.orm import Session, aliased
from app.models.models import User, Task
from datetime import datetime
def create_new_task(db: Session, request_data):
    try:
        new_task = Task(user=request_data["username"],
                        title=request_data["title"], # need for completed and assigned
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
    completed_query = db.query(Task).filter(Task.user==username, Task.status=="Completed").all()
    completed_tasks = [task.__dict__ for task in completed_query]
    assigned_query = db.query(Task).filter(Task.user==username, Task.status=="Assigned")
    assigned_tasks = [task.__dict__ for task in assigned_query]
    expired_query = db.query(Task).filter(Task.user==username, Task.status=="Assigned", Task.expirationDate and Task.expirationDate < datetime.now())
    expired_tasks = [task.__dict__ for task in expired_query]
    return completed_tasks, expired_tasks, assigned_tasks
