from openai import OpenAI
from pathlib import Path
import dotenv
import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage
import datetime

env_path = Path('.') / '.env'
dotenv.load_dotenv()
cred = credentials.Certificate('service_account.json')
firebase_admin.initialize_app(cred)
def moderate_task(fileLocation, taskDescription):
    bucket = storage.bucket("hoohacks2024-62aa0.appspot.com")
    file_ref = bucket.blob(fileLocation)
    download_url = file_ref.generate_signed_url(expiration=datetime.timedelta(seconds=3600))
    print(download_url)
    client = OpenAI()
    response = client.chat.completions.create(
    model="gpt-4-vision-preview",
    messages=[
        {
        "role": "user",
        "content": [
            {"type": "text", "text": f"""You are an assistant that will help with the moderation of task completion on a task management app. Given the following task and image, return one of three answers and ONLY one of those answers.
            Return YES if you are confident that the image provided is proof that the individual who submitted the picture completed the task. Return NO if it is not adequate proof of them completing the task. Return UNSURE if you cannot 
            confidently determine if it is adequate proof. Only return YES, NO, or UNSURE, no other text.
            
            Task: {taskDescription}.
            """
            },
            {
            "type": "image_url",
            "image_url": {
                "url": download_url,
            },
            },
        ],
        }
    ],
    max_tokens=300,
    )
    print(response.choices[0].message.content)
    return response.choices[0].message.content