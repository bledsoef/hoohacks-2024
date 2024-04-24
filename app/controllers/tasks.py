from fastapi import APIRouter, Depends, Request, HTTPException
from sqlalchemy.orm import Session
from database.connection import get_db
from app.logic.tasks import create_new_task, get_tasks_for_user, get_fitbit_information
from app.logic.vision import moderate_task
from app.models.models import Task, User
import datetime
from typing import Union
import requests
import os
from pathlib import Path
import dotenv
import time

env_path = Path('.') / '.env'
dotenv.load_dotenv()
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
async def getTasksForUser(username: str = None, db: Session = Depends(get_db)):
    try:
        requestingUser = db.query(User).filter(User.username==username).first()
        assert requestingUser is not None
        
        grouped_tasks = get_tasks_for_user(db, username)
        return grouped_tasks
    except Exception as e:
        print(e)
        raise HTTPException(status_code=400, detail="Invalid username")

@router.get("/getDailyFitbitInformation")
async def getSteps():
    return get_fitbit_information()

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
        return {"message": "Task updated successfully"}
    except Exception as e:
        print(e)
        return {"message": "Failed to update task"}
    

@router.post("/redeemTask")
async def redeemTask(task_id: Union[int, str], db: Session = Depends(get_db)):
    """
    A convenience route which sets a task's status from completed to redeemed or returns an error message
    """
    try:
        task_id = int(task_id)
        taskToRedeem = db.query(Task).filter(Task.id == task_id).first()
        assert taskToRedeem is not None
        assert taskToRedeem.status.lower() in {"complete", "completed"}
        taskToRedeem.status = "Redeemed"
        db.commit()
        return {"message": "Task redeemed successfully"}

    except Exception as e:
        print(e)
        return {"message": "Failed to redeem task"}

@router.post("/validateTask")
async def validateTask(request: Request, db: Session = Depends(get_db)):
    data = await request.json()
    taskToVerify = db.query(Task).filter(Task.id == data["task_id"]).first()
    if not taskToVerify:
        return "Invalid task"
    print(taskToVerify.taskDescription)
    verificationStatus = moderate_task("apple.png", taskToVerify.taskDescription)
    if verificationStatus == "YES":
        taskToVerify.status = "Completed"
    elif verificationStatus == "NO":
        taskToVerify.status = "Assigned"
    else:
        taskToVerify.status = "Needs Manual Verification"
    db.commit()
    return ""

@router.get("/fitbit")
async def verify():
    return