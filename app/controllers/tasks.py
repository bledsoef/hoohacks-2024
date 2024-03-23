from fastapi import APIRouter, Depends, Request
from sqlalchemy.orm import Session
from database.connection import get_db
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
        return "tasks go here"
    except Exception as e:
        print(e)
        return {"message": "Failed to get recs"}