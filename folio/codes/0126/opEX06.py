class Bank:
    def __init__(self, balance):
        self.__balance = balance
        
    def withdraw(self,amount):
        if self.__balance < amount:
            print("잔액이 부족합니다.")
        else:
            self.__balance -= amount
            print(f"{amount}원이 출금되었습니다.")
        
    def deposit(self,amount):
        self.__balance += amount
        print(f"{amount}원이 입금되었습니다.")
        
    def showbalance(self):
        print(f"현재 잔액은 {self.__balance}입니다.")
        
account1 = Bank(100000)
account1.showbalance()
account1.deposit(10000)
account1.withdraw(5000)
account1.showbalance()