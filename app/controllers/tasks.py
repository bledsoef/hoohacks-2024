from fastapi import APIRouter, Depends, Request
from sqlalchemy.orm import Session
from database.connection import get_db
from app.models.models import Task, User
router = APIRouter()

@router.post("/createTask")
async def createTask(request: Request, db: Session = Depends(get_db)):
    request_data = await request.json()
    try:
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