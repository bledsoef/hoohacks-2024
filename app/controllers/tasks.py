from fastapi import APIRouter, Depends, Request
from sqlalchemy.orm import Session
from database.connection import get_db
from app.logic.tasks import create_new_task
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
        return "tasks go here"
    except Exception as e:
        print(e)
        return {"message": "Failed to get recs"}