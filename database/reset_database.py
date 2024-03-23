from database.connection import Base, engine
from sqlalchemy.orm import Session
from datetime import datetime
Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine)