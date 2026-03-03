base=int(input("밑변 입력 : "))
height= int(input("높이 입력 : "))
area = base*height
print(f"밑변 {base}, 높이 {height}인 사각형의 넓이는 {area}입니다.")
print("밑변",base, " 높이" ,height ,"인 사각형의 넓이는" ,area ,"입니다.")
print("밑변 {0}, 높이 {1}인 사각형의 넓이는 {2}입니다.".format(base, height, area))
print("밑변 %d, 높이 %d인 사각형의 넓이는 %d입니다." %(base, height, area))