def swapFunc(x, y):
    temp = x
    x = y
    y = temp
    return x, y
    
num1 = 1
num2 = 2
print(f"num1 = {num1}, num2 = {num2}")
num1,num2 = swapFunc(num1, num2)
print(f"num1 = {num1}, num2 = {num2}")
num1,num2 = swapFunc(5, 6)
print(f"num1 = {num1}, num2 = {num2}")

x = 1
y = 2
print(f"x = {x}, y = {y}")
x, y = y, x
print(f"x = {x}, y = {y}")