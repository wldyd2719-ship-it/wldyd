# 두개의 주사위 합

import random

class Dice:
    def __init__(self, x, y):
        self.__value = 1
        self.x = x
        self.y = y
        self.size = 30
        
    def rollDice(self):
        self.__value = random.randint(1,6)
    
    def getDice(self):
        return self.__value
    
    def __add__(self, other):
        return self.__value + other.__value
    
    def printDice(self):
        print(f"{self.__value}")
        
d1 = Dice(100,100)
d2 = Dice(120,30)
d1.rollDice()
d2.rollDice()

d3 = d1+d2
d1.printDice()
d2.printDice()
print(d1.getDice() + d2.getDice())
print(d3)