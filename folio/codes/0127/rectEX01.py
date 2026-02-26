class Rectangle:
    def __init__(self, base, height):
        self.base = base
        self.height = height
        
    def __add__(self, other):
        return Rectangle(self.base+other.base, self.height+other.height)
    
    def __str__(self):
        return f"{self.base}, {self.height}"
    
    def __eq__(self,other):
        return self.base*self.height == other.base*other.height
    
r1 = Rectangle(4,5)
r2 = Rectangle(2,4)
if r1 == r2:
    print("면적이 같다")
else:
    print('면적이 다르다')
r3 = r1+r2

print(r1,r2,r3)