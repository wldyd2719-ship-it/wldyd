addsum = 0
evensum = 0

for i in range(101):
    
    if i%2 == 0:
        evensum += i
    else:
        addsum += i
        
print(f"1~100까지 홀수의 합: {addsum}")
print(f"1~100까지 짝수의 합: {evensum}")