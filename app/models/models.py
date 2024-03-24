from sqlalchemy import Boolean, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from database.connection import Base

class User(Base):
    __tablename__ = "users"
    
    username = Column(String(50), primary_key=True, index=True)
    firstName = Column(String(50))
    lastName = Column(String(50))
    email = Column(String(50))

    tasks_assigned = relationship("Task", back_populates="assignee")

class Task(Base):
    __tablename__ = "tasks"
    
    id = Column(Integer, primary_key=True, index=True)
    user = Column(String(50), ForeignKey("users.username"))
    title = Column(String(50))
    gameTitle = Column(String(50), nullable=False)
    status = Column(String(50), nullable=False)
    dateCompleted = Column(Date, nullable=True)
    expirationDate = Column(Date)
    category = Column(String(50), nullable=False)
    quantity = Column(Integer, nullable=True)
    metric = Column(String(50), nullable=True)
    taskDescription = Column(String(100), nullable=False)
    rewardDescription = Column(String(100), nullable=False)

    assignee = relationship("User", back_populates="tasks_assigned")
