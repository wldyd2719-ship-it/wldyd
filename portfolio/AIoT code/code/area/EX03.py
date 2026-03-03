price = int(input("물건의 값 입력 : "))

#a1000 = int(input("1000원의 갯수 입력 : "))
#a500 = int(input("500원의 갯수 입력 : "))
#a100 = int(input("100원의 갯수 입력 : "))
#a50 = int(input("50원의 갯수 입력 : "))
#a10 = int(input("10원의 갯수 입력 : "))
#change= a1000*1000+a500*500+a100*100+a50*50+a10*10-price

pay = int(input("지불한 금액 : "))
change = pay-price

achange = change

n1000 = change//1000
change %= 1000 
n500 = change//500
change %= 500
n100 = change//100
change %= 100
n50 = change//50
change %= 50
n10 = change//10
change %= 10

print(f"거스름돈은 {achange}, 1000원 {n1000}장, 500원 {n500}개, 100원 {n100}개, 50원 {n50}개, 10원 {n10}개")