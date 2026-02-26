from datetime import datetime
from gtts import gTTS
import os

#from pydub import AudioSegment

import speech_recognition as sr



# 경기 결과 입력 받는 곳
place=input("경기가 열린 곳은? ")
time=input("경기가 열린 시간은? ")
opponent=input("상대 팀은? ")
goals=input("손흥민은 몇 골을 넣었나요? ")
aids=input("도움은 몇 개인가요? ")
score_me=input("손흥민 팀이 넣은 골 수는? ")
score_you=input("상대 팀이 넣은 골 수는? ")

# 기사 작성하는 곳
news="[프리미어 리그 속보("+str(datetime.now())+")]\n"
news=news+"손흥민 선수는 "+place+"에서 "+time+"에 열린 경기에 출전하였습니다.\n"
news=news+"상대 팀은 "+opponent+"입니다. "

if score_me>score_you:
    news=news+"손흥민 선수의 팀이 "+score_me+"골을 넣어 "+score_you+"골을 넣은 상대 팀을 이겼습니다. \n"
elif score_me<score_you:
    news=news+"손흥민 선수의 팀이 "+score_me+"골을 넣어 "+score_you+"골을 넣은 상대 팀에게 졌습니다. \n"
else:
    news=news+"두 팀은 "+score_me+"대"+score_you+"로 비겼습니다. \n"
    
if int(goals)>0 and int(aids)>0:
    news=news+"손흥민 선수는 "+goals+"골에 도움 "+aids+"개로 승리를 크게 이끌었습니다. \n"
elif int(goals)>0 and int(aids)==0:
    news=news+"손흥민 선수는 "+goals+"골로 승리를 이끌었습니다. \n"
elif int(goals)==0 and int(aids)>0:
    news=news+"손흥민 선수는 골은 없지만 도움 "+aids+"개로 승리하는 데 공헌하였습니다. \n"
else:
    news=news+"아쉽게도 이번 경기에서 손홍민의 발끝은 침묵을 지켰습니다. \n"
print(news)


tts = gTTS(text=news, lang='ko')
print("TTS 시작")
tts.save("news_Son.mp3")
print("TTS 종료")
print("파일 생성 완료:", os.path.exists("news_Son.mp3"))
print("파일 크기:", os.path.getsize("news_Son.mp3"), "bytes")
os.system("start news_Son.mp3")

#sound = AudioSegment.from_mp3("news_Son.mp3")
#sound.export("tts.wav", format="wav")

#print("[CONVERT] mp3 → wav 변환 완료")

r = sr.Recognizer()

with sr.AudioFile("news_Son.mp3") as source:
    audio = r.record(source)

stt_text = r.recognize_google(audio, language="ko-KR")

print("[STT RESULT]")
print(stt_text)