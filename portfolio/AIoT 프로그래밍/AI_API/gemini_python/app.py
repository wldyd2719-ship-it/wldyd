import streamlit as st
from google import genai
import os
from dotenv import load_dotenv

load_dotenv()

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))

st.title("AI API 실습")

question = st.text_input("AI에게 질문하세요")

if st.button("질문 보내기"):
    response = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=question
    )
    st.write("### AI 응답")
    st.write(response.text)