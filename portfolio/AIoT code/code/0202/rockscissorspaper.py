import random
from tkinter import *
from PIL import Image, ImageTk

window = Tk()

Label(window, text="선택하세요", font=("Helvetica", "16")).pack()
frame = Frame(window)
# 이미지를 d 드라이브로 복사하여 주세요!

R = Image.open("rock.png")
rsize =  R.resize((50, 50))
rock_image = ImageTk.PhotoImage(rsize)

P = Image.open("paper.png")
psize =  P.resize((50, 50))
paper_image = ImageTk.PhotoImage(psize)

S = Image.open("scissor.png")
ssize =  S.resize((50, 50))
scissors_image = ImageTk.PhotoImage(ssize)
# 교재 오타!!

def pass_s():
    decide("가위")
def pass_r():
    decide("바위")
def pass_p():
    decide("보")
    
rock = Button(frame, image=rock_image, command=pass_r)
rock.pack(side="left")
paper = Button(frame, image=paper_image, command=pass_p)
paper.pack(side="left")
scissors = Button(frame, image=scissors_image, command=pass_s)
scissors.pack(side="left")
frame.pack()

Label(window, text="컴퓨터는 다음을 선택하였습니다.", font=("Helvetica", "16")).pack()
computer_image = Label(window, image=rock_image)
computer_image.pack()
output = Label(window, text="", font=("Helvetica", "16"))
output.pack()

def decide(human):
    computer = random.choice(["가위", "바위", "보"])
    if computer == "바위":
        computer_image["image"] = rock_image
    elif computer == "보":
        computer_image["image"] = paper_image
    else:
        computer_image["image"] = scissors_image
    if (computer == "바위" and human == "보") or (computer == "보" and human == "가위") or (computer == "가위" and human == "바위"):
        result = "인간 승리!"
    elif computer == human:
        result = "비겼습니다."
    else:
        result = "컴퓨터 승리!"
    output.config(text="인간: " + human + " 컴퓨터:" + computer + " " + result)
window.mainloop()