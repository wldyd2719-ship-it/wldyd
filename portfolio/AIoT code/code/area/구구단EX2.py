# 단을 입력 받아 해당 단을 출력하는 프로그램 작성
# 0을 입력하기 전까지 실행

# n = int(input("단 입력 : "))
# i = 9

# for dan in range(n, 0, -1):
    # while i > 0:
    #    print(f"{dan} X {i} = {dan*i}")
        # i-=1
        
        
while True:
    dan = int(input("단 입력(0 입력 시 종료) : "))
    
    if dan == 0:
        print("종료")
        break
    
    for i in range(1,10):
        print(f"{dan} X {i} = {dan*i}")
    
    print()