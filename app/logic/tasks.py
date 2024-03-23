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