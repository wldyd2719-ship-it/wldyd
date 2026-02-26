def cicleArea(radius):
    area = 3.14*radius**2
    return area

def rectangleArea(base, height):
    area = base*height
    return area

def triangleArea(base, heght):
    area = 0.5*base*heght
    return area

while True:
    choice = int(input("1. 원의 면적\n2. 삼각형의 면적\n3. 사각형의 면적\n0. 종료\n선택 (1, 2, 3, 0) :"))
    if choice == 1:
        radius = int(input("원의 반지름 입력 :"))
        area = cicleArea(radius)
        print(f"반지름이 {radius}인 원의 면적은 {area}입니다.")
    
    elif choice == 2:
        base = int(input("삼각형의 맡변 입력 :"))
        heght = int(input("삼각형의 높이 입력 :"))
        area = triangleArea(base, heght)
        print(f"밑변이 {base}, 높이가 {heght}인 삼각형의 면적은 {area}입니다.")
        
    elif choice == 3:
        base = int(input("사각형의 가로 입력 :"))
        heght = int(input("사각형의 세로 입력 :"))
        area = rectangleArea(base, heght)
        print(f"가로 {base}, 세로가 {heght}인 사각형의 면적은 {area}입니다.")
        
    elif choice == 0:
        print(f"종료니다.")
        break
    else:
        print("(0, 1, 2, 3) 중 하나 입력하세요.")