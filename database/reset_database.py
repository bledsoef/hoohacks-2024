from database.connection import Base, engine
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
from app.models.models import Task, User
Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine)

with Session(engine) as session:
    finn = User(username="bledsoef", firstName="finn", lastName="bledsoe", email="bledsoef@berea.edu")
    lawrence = User(username="hoerstl", firstName="lawrence", lastName="hoerst", email="hoerstl@berea.edu")

    test_task1 = Task(user="bledsoef", title="World Traveler", status="Completed", dateCompleted=datetime.now(), expirationDate=datetime.now() + timedelta(hours=1), quantity=10000, metric="steps", category="health", taskDescription="Submit a picture of an Apple.", rewardDescription="10 coins.")
    test_task2 = Task(user="bledsoef", title="Across the country", status="Assigned", dateCompleted=None, expirationDate=datetime.now() + timedelta(days=1), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")
    test_task3 = Task(user="bledsoef", title="Across the country", status="Completed", dateCompleted=datetime.now(), expirationDate=datetime.now(), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")
    test_task4 = Task(user="bledsoef", title="Across the country", status="Assigned", dateCompleted=datetime.now(), expirationDate=datetime.now() - timedelta(days=1), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")
    test_task5 = Task(user="bledsoef", title="Across the country", status="Assigned", dateCompleted=None, expirationDate=None, quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")
    test_task6 = Task(user="bledsoef", title="Across the country", status="Assigned", dateCompleted=datetime.now(), expirationDate=datetime.now(), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")

    session.add_all([finn, lawrence])
    session.add_all([test_task1, test_task2, test_task3, test_task4, test_task5, test_task6])
    session.commit()
