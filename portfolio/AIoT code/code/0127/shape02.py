class Shape:
    def __init__(self, name):
        self.name = name
        
    def getArea(self):
        raise NotImplementedError("이것은 추상메소드입니다. ")
    
class Circle(Shape):
    def __init__(self, name, radius):
        super().__init__(name)
        self.radius = radius
        
    def getArea(self):
        return 3.141592*self.radius**2

class Rectangle(Shape):
    def __init__(self, name, width, height):
        super().__init__(name)
        self.width = width
        self.height = height
        
    def getArea(self):
        return self.width*self.height
    
c1 = Circle("원1",10)
r2 = Rectangle("사각형1", 10,20)
objlist = [c1, r2]
for i in objlist:
    print(f"면적: {i.getArea()}")