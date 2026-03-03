n = int(input("층 입력 : "))

for y in range(n):
    for x in range(y+1):
        print("*", end="")
    print("")
    
for y in range(1,n+1):
    print(" "* (n-y) + "*"*(2*y-1))
for y in range(n-1,0,-1):
    print(" "* (n-y) + "*"*(2*y-1))
