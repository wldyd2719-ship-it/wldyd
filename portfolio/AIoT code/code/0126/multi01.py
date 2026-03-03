def sum(numbers):
    total = 0
    for i in range(len(numbers)):
        for j in range(len(numbers[0])):
            total = total + numbers[i][j]
    return total


s = [
     [1,2,3,4,5],
     [6,7,8,9,10],
     [11,12,13,14,15]]

rows =  len(s)
cols = len(s[0])
print(rows)
print(cols)

for r in range(rows):
    for c in range(cols):
        print(s[r][c], end= ",")
    print()
    
    
print(sum(s))