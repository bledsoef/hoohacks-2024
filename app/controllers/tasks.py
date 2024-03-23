from fastapi import APIRouter, Depends, Request
from sqlalchemy.orm import Session
from database.connection import get_db
from app.logic.tasks import create_new_task
from app.models.models import Task, User
from sqlalchemy.inspection import inspect
from typing import Union
router = APIRouter()

@router.post("/createTask")
async def createTask(request: Request, db: Session = Depends(get_db)):
    request_data = await request.json()
    try:
        create_new_task(db, request_data)
        return {"message": "Task created"}
    except Exception as e:
        print(e)
        return {"message": "Failed to create task"}
    

@router.get("/getTasksForUser")
async def getSentRecsForUser(username: str = None, db: Session = Depends(get_db)):
    try:        
        requestingUser = db.query(User).filter(User.username==username).first()
        assert requestingUser is not None
        tasksForUser = [task.__dict__ for task in db.query(Task).filter(Task.user == username).all()]
        return tasksForUser
    except Exception as e:
        print(e)
        return {"message": "Failed to get recs"}


@router.post("/updateTask")

async def updateTask(task_id: Union[int, str], status: str = None, dateCompleted: str = None, taskDescription: str = None, rewardDescription: str = None, db: Session = Depends(get_db)):
    # updateableTaskAttributes = ['status', 'dateCompleted', 'taskDescription', 'rewardDescription']
    try:
        task_id = int(task_id)
        taskToUpdate = db.query(Task).filter(Task.id == task_id).first()
        assert taskToUpdate is not None
        # Update the values that we've submitted
        taskToUpdate.status = status or taskToUpdate.status
        taskToUpdate.dateCompleted = dateCompleted or taskToUpdate.dateCompleted
        taskToUpdate.taskDescription = taskDescription or taskToUpdate.taskDescription
        taskToUpdate.rewardDescription = rewardDescription or taskToUpdate.rewardDescription
        db.commit()
        return "Task updated successfully"
    except Exception as e:
        print(e)
        return {"message": "Failed to update task"}
