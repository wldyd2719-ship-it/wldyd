import random

class Dice:
    def __init__(self, value, x, y, size):
        self.value =value
        self.x = x
        self.y = y
        self.size = size
        
    def rollDice(self):
        self.value = random.randint(1,6)
        return self.value
    
    def printDice(self):
        print(f"{self.value}")
        
    def __add__(self, other):
        return self.value + other.value
        
        
d1 = Dice(1,10,20,30)
d2 = Dice(1,10,20,30)

d1.rollDice()
d2.rollDice()
d3 = d1+ d2
d1.printDice()
d2.printDice()
print(d3)