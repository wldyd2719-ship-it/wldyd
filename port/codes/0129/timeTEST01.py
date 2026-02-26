from datetime import datetime

time1 = datetime.now()
time2 = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
time3 = datetime.now().strftime("%H:%M:%S")
time4 = datetime.now().strftime("%Y년 %m월 %d일 %H시 %M분 %S초")
print(f"1. {time1}")
print(f"2. {time2}")
print(f"3. {time3}")
print(f"4. {time4}")