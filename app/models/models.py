from sqlalchemy import Boolean, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from database.connection import Base

class User(Base):
    __tablename__ = "users"
    
    username = Column(String(50), primary_key=True, index=True)
    firstName = Column(String(50))
    lastName = Column(String(50))
    email = Column(String(50))

class Task(Base):
    __tablename__ = "tasks"
    
    id = Column(Integer, primary_key=True, index=True)
    user = Column(String(50), ForeignKey("users.username"))
    status = Column(String(50), nullable=False)
    dateCompleted = Column(Date, nullable=True)
    taskDescription = Column(String(100), nullable=False)
    rewardDescription = Column(String(100), nullable=False)
