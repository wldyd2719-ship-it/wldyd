import random
from tkinter import *
from PIL import Image, ImageTk, ImageSequence

window = Tk()
window.title("두 개 주사위 굴리기 (1초 애니메이션)")

def load_gif(path):
    img = Image.open(path)
    frames = [ImageTk.PhotoImage(frame.copy().convert("RGBA")) for frame in ImageSequence.Iterator(img)]
    return frames

dice_frames = [load_gif(f"dice{i}.gif") for i in range(1, 7)]

dice_label1 = Label(window)
dice_label1.pack(side="left", padx=10)

dice_label2 = Label(window)
dice_label2.pack(side="left", padx=10)

result_label = Label(window, text="주사위를 굴려보세요!", font=("Helvetica", 16))
result_label.pack(pady=10)

anim_id1 = None
anim_id2 = None

def animate(label, frames, idx=0, anim_id_name=None):
    global anim_id1, anim_id2

    label.config(image=frames[idx])
    next_id = window.after(100, animate, label, frames, (idx + 1) % len(frames), anim_id_name)

    if anim_id_name == "a1":
        anim_id1 = next_id
    elif anim_id_name == "a2":
        anim_id2 = next_id

def roll_dice():
    global anim_id1, anim_id2
    
    # 이전 애니메이션 취소
    if anim_id1:
        window.after_cancel(anim_id1)
        anim_id1 = None
    if anim_id2:
        window.after_cancel(anim_id2)
        anim_id2 = None

    # 최종 결과 랜덤 선택
    d1 = random.randint(1, 6)
    d2 = random.randint(1, 6)

    # 애니메이션 시작 (5초 동안)
    animate(dice_label1, dice_frames[d1 - 1], anim_id_name="a1")
    animate(dice_label2, dice_frames[d2 - 1], anim_id_name="a2")

    # 5초 후 애니메이션 정지하고 최종 이미지 고정
    window.after(5000, stop_animation, d1, d2)
    
    result_label.config(text=f"주사위 1: {d1}  주사위 2: {d2}  합계: {d1 + d2}")

def stop_animation(d1, d2):
    global anim_id1, anim_id2

    if anim_id1:
        window.after_cancel(anim_id1)
        anim_id1 = None
    if anim_id2:
        window.after_cancel(anim_id2)
        anim_id2 = None

    # 최종 결과 이미지로 고정
    dice_label1.config(image=dice_frames[d1 - 1])
    dice_label2.config(image=dice_frames[d2 - 1])

roll_button = Button(window, text="굴리기", command=roll_dice)
roll_button.pack(pady=10)

window.mainloop()
