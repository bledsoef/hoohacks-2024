from database.connection import Base, engine
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
from app.models.models import Task, User
Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine)

with Session(engine) as session:
    finn = User(username="bledsoef", firstName="finn", lastName="bledsoe", email="bledsoef@berea.edu")
    lawrence = User(username="hoerstl", firstName="lawrence", lastName="hoerst", email="hoerstl@berea.edu")

    test_task1 = Task(user="bledsoef", title="World Traveler", gameTitle="Dragon Hunt", status="Completed", dateCompleted=datetime.now(), expirationDate=datetime.now() + timedelta(hours=1), quantity=10000, metric="steps", category="health", taskDescription="Submit a picture of an Apple.", rewardDescription="10 coins.")
    test_task3 = Task(user="bledsoef", title="Across the country", gameTitle="Dragon Hunt", status="Completed", dateCompleted=datetime.now(), expirationDate=datetime.now(), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")
    test_task4 = Task(user="bledsoef", title="Across the country", gameTitle="Dragon Hunt", status="Assigned", dateCompleted=datetime.now(), expirationDate=datetime.now() - timedelta(days=1), quantity=5000, metric="steps", category="health", taskDescription="Walk 5000 steps!", rewardDescription="5 coins.")

    cod1 = Task(user="bledsoef", title="Marathon mania", gameTitle="Call of Duty", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=50, metric="miles", category="health", taskDescription="Run 50 miles.", rewardDescription="50 experience points.", networkImage="https://bnetcmsus-a.akamaihd.net/cms/blog_header/ti/TI4WAD6CJ4Y51691017340326.jpg")
    cod2 = Task(user="bledsoef", title="Move your body", gameTitle="Call of Duty", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=30, metric="minutes of exercise", category="health", taskDescription="Exercise for 30 minutes.", rewardDescription="20 experience points.", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXE7LUfmU4s3ooIuFUCjw0nlGBkOw61DNqnFZJJqys9g&s")
    cod3 = Task(user="bledsoef", title="Reader's time", gameTitle="Call of Duty", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 27), quantity=10, metric="pages read", category="education", taskDescription="Read 10 pages of Pride and Prejudice.", rewardDescription="The Nerd skin.", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbtDASBjQ4F7BJp-5k19S_-Ht8eWLZ0acAmQ&s")
    cod4 = Task(user="bledsoef", title="Touch grass", gameTitle="Call of Duty", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 26), quantity=1, metric="people talked to", category="social", taskDescription="Speak to one person in person", rewardDescription="A 'friend' pet.", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTNWmjaNQddELp8jXIIaLINh4Icl_97gqbM7AalSPB9Q&s")
    cod5 = Task(user="bledsoef", title="Chess master", gameTitle="Call of Duty", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=20, metric="minutes of chess played", category="skill", taskDescription="Play chess for 20mins", rewardDescription="Chess piece profile icon.", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFaVV4sOseOiCMxSt1gu1NrxQiZaPyUKGKISFEMu8mLg&s")
    
    smash1 = Task(user="bledsoef", title="Training to win", gameTitle="Super Smash Bros Ultimate", status="Assigned", dateCompleted=None, expirationDate=None, quantity=50, metric="miles", category="health", taskDescription="Travel 50 miles on foot.", rewardDescription="New colorway for Meta Knight.", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLcj4f1oumTIvOx62PstU0Hn1z9Hg5-fFZMg&s")
    smash2 = Task(user="bledsoef", title="Move your body", gameTitle="Super Smash Bros Ultimate", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=30, metric="minutes of exercise", category="health", taskDescription="Exercise for 30 minutes.", rewardDescription="500 experience points.", networkImage="https://media.gq.com/photos/5b201cd1525bfc1dee1a65ee/4:3/w_960,h_720,c_limit/Every-super-smash-bros-character-is-in-the-new-game-gq.jpg")
    smash3 = Task(user="bledsoef", title="Reader's time", gameTitle="Super Smash Bros Ultimate", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 27), quantity=10, metric="pages read", category="education", taskDescription="Read 10 pages of Pride and Prejudice.", rewardDescription="New colorway for Captain Falcon.", networkImage="https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2018/12/03/37b49435-79a0-4646-bc3e-f034bdb7a6d7/super-smash-bros-ultimate-promo")
    smash4 = Task(user="bledsoef", title="Chess master", gameTitle="Super Smash Bros Ultimate", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=20, metric="minutes of chess played", category="skill", taskDescription="Play chess for 20mins", rewardDescription="Chess piece profile icon.", networkImage="https://www.dexerto.com/cdn-cgi/image/width=3840,quality=60,format=auto/https://editors.dexerto.com/wp-content/uploads/2023/05/04/smash-bros-movie-concent-poster.jpg")

    dota1 = Task(user="bledsoef", title="Training to win", gameTitle="Dota 2", status="Assigned", dateCompleted=None, expirationDate=None, quantity=50, metric="miles", category="health", taskDescription="Travel 50 miles on foot.", rewardDescription="50 credit points.", networkImage="https://bnetcmsus-a.akamaihd.net/cms/blog_header/ti/TI4WAD6CJ4Y51691017340326.jpg")
    dota2 = Task(user="bledsoef", title="Move your body", gameTitle="Dota 2", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=30, metric="minutes of exercise", category="health", taskDescription="Exercise for 30 minutes.", rewardDescription="50 credit points", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXE7LUfmU4s3ooIuFUCjw0nlGBkOw61DNqnFZJJqys9g&s")
    dota3 = Task(user="bledsoef", title="Reader's time", gameTitle="Dota 2", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 27), quantity=10, metric="pages read", category="education", taskDescription="Read 10 pages of Pride and Prejudice.", rewardDescription="50 credit points", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbtDASBjQ4F7BJp-5k19S_-Ht8eWLZ0acAmQ&s")
    dota4 = Task(user="bledsoef", title="Chess master", gameTitle="Dota 2", status="Assigned", dateCompleted=None, expirationDate=datetime(2024, 3, 25), quantity=20, metric="minutes of chess played", category="skill", taskDescription="Play chess for 20mins", rewardDescription="50 credit points", networkImage="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTNWmjaNQddELp8jXIIaLINh4Icl_97gqbM7AalSPB9Q&s")

    session.add_all([finn, lawrence])
    session.add_all([test_task1, test_task3, test_task4])
    session.add_all([cod1, cod2, cod3, cod4, cod5])
    session.add_all([smash1, smash2, smash3, smash4])
    session.add_all([dota1, dota2, dota3, dota4])

    session.commit()
