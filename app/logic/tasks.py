from sqlalchemy.orm import Session, aliased
from app.models.models import User, Task
from datetime import datetime
def create_new_task(db: Session, request_data):
    try:
        new_task = Task(user=request_data["username"], status=request_data["status"], dateCompleted=None, quantity=request_data["quantity"], metric=request_data["metric"], category=request_data["category"], taskDescription=request_data["taskDescription"], rewardDescription=request_data["rewardDescription"])
        db.add(new_task)
        db.commit()
    except Exception as e:
        print(e)