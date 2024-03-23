from fastapi import APIRouter, Depends, Request
from sqlalchemy.orm import Session
from database.connection import get_db
from app.logic.tasks import create_new_task
from app.models.models import Task, User
import datetime
import requests
import os
from pathlib import Path
import dotenv

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
async def getSentRecsForUser(username: str, db: Session = Depends(get_db)):
    try:        
        requestingUser = db.query(User).filter(User.username==username).first()
        assert requestingUser is not None
        tasksForUser = [task.__dict__ for task in db.query(Task).filter(Task.user == username).all()]
        return tasksForUser
    except Exception as e:
        print(e)
        return {"message": "Failed to get recs"}
    

@router.get("/getSteps")
async def getSteps():
    header = {'Authorization': 'Bearer {}'.format(os.environ["ACCESS_TOKEN"])}
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    response = requests.get(f"https://api.fitbit.com/1/user/-/activities/date/{date}.json", headers=header).json()
    return response["summary"]["steps"]


