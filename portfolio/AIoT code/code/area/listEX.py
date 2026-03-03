# mylist = [1, 2, 3, 4, 5]
# print(mylist[0])
# print(mylist[-1])

sum = 0
count = 0

for i in range(1, 101):
    if i%3 == 0:
        sum += i
        count += 1
    
print(f"1부터 100까지 3의 배수들의 갯수: {count}, 합: {sum}")
