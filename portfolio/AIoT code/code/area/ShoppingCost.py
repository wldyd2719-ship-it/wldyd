price = int(input("물건의 값 입력 : "))

if price>=40000:
    shoppingcost = 0
    
else:
    shoppingcost = 3000
    
print(f"배송비: {shoppingcost}원")