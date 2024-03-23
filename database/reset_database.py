from database.connection import Base, engine
from sqlalchemy.orm import Session
from datetime import datetime
from app.models.models import Task, User
Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine)

with Session(engine) as session:
    finn = User(username="bledsoef", firstName="finn", lastName="bledsoe", email="bledsoef@berea.edu")
    lawrence = User(username="hoerstl", firstName="lawrence", lastName="hoerst", email="hoerstl@berea.edu")

    test_task1 = Task(user="bledsoef", status="Completed", dateCompleted=datetime.now(), taskDescription="Walk 10000 steps!", rewardDescription="10 coins.")
    test_task2 = Task(user="bledsoef", status="Pending", dateCompleted=datetime.now(), taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")

    session.add_all([finn, lawrence])
    session.add_all([test_task1, test_task2])
    session.commit()
