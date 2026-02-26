import pyautogui

print(pyautogui.__version__)
screenshot = pyautogui.screenshot()
screenshot.save("screenshot.png")
print("캡처 완료")
