# 파이썬을 이용해 5초 간격으로 총 1분 동안 12장의 스크린샷을 찍고, 지정된 폴더에
# 파일을 저장하고 싶어. 코드를 만들어줘

import pyautogui
import os
import time

folder_path = "스크린샷"
os.makedirs(folder_path, exist_ok=True)

for i in range(12):
    file_name = f'screenshot_{i+1}.png'
    file_path = os.path.join(folder_path, file_name)
    screenshot = pyautogui.screenshot()
    screenshot.save(file_path)
    print(f"스크린 샷 저장 : {file_path}")
    time.sleep(5)
    
print('스크린샷이 성공적으로 완료되었습니다.')