<<<<<<< HEAD
def factorial(n):
    if n == 1 :
        return(1)
    else:
        return n * factorial(n-1)
n = eval(input("정수를 입력하시오:"))
=======
def factorial(n):
    if n == 1 :
        return(1)
    else:
        return n * factorial(n-1)
n = eval(input("정수를 입력하시오:"))
>>>>>>> 1e8d041 (Add AIoT project files)
print(n, "!= ", factorial(n))