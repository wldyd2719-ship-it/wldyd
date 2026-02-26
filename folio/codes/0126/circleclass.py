class Circle:
    def __init__(self, radius):
        self.radius = radius
        
    def getArea(self):
        return 3.14*self.radius**2
    
    def getParameter(self):
        return 2*3.14*self.radius
    
    def prtCircleInfo(self):
        print(f"반지름이 {self.radius}인 원의 면적은 {self.getArea()}, 둘레는 {self.getParameter()}")
        
    
c1 = Circle(6)
c1.prtCircleInfo()

c2 = Circle(10)
c2.prtCircleInfo()