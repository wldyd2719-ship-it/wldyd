from google.genai import Client
import os
from dotenv import load_dotenv

load_dotenv()

client = Client(api_key=os.getenv("GEMINI_API_KEY"))

response = client.models.generate_content(
    model="gemini-2.5-flash",
    contents="Hello Gemini"
)

print(response.text)