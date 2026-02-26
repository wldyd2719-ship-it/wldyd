class Vector2D:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        
    def __add__(self, other):
        return Vector2D(self.x + other.x, self.y + other.y)
    
    def __sub__(self, other):
        return Vector2D(self.x - other.x, self.y - other.y)
    
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
    
    def __str__(self):
        return f"x={self.x}, y={self.y}"
    
v1= Vector2D(1,2)
v2= Vector2D(4,5)
v3= v1+v2

print(1+2)
print(v1)
print(v2)
print(v3)