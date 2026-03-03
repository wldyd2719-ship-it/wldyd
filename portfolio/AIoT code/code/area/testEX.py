n = int(input("아주 크지 않은 정수 입력 : "))
fact = 1
for i in range(n, 0, -1):
    fact = fact*i
    
print(f"{n}! = {fact}")
