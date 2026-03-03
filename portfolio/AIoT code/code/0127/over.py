class Shape:
    def __init__(self):
        pass
    
    def draw(self):
        print("Shape")
        
    def getArea(self):
        return 0
    
class Circle(Shape):
    def __init__(self, radius = 0):
        super().__init__()
        self.radius = radius
     
    def draw(self):
        print("Circle")
          
    def getArea(self):
        return 3.14*self.radius**2
    
c1 = Circle(10)
c1.draw()
print(c1.getArea())