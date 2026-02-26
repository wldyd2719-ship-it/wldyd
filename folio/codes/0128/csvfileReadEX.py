import csv

f = open("weather.csv", "r", encoding="utf-8")

data = csv.reader(f)
header = next(data)
temp = 1000
for row in data:
    if temp > float(row[3]):
        temp = float(row[3])
        day = str(row[0])
        
print(f"가장 추웠던 날은 {day}입니다")
print(f"가장 추웠던 날의 최저 온도는 {temp}(℃ )입니다")
f.close()