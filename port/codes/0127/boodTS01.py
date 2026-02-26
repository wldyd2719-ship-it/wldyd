class Book:
    def __init__(self, title, pages):
        self.title = title
        self.pages = pages
        
    def __str__(self):
        return f"제목: {self.title}, 페이지 수: {self.pages}"
    
    def __add__(self,other):
        return f"{self.title}, {other.title}의 총 페이지 수는 {self.pages + other.pages}"

    def __gt__(self, other):
        return self.pages > other.pages
    
b1 = Book("어린왕자", 600)
b2 = Book("1994", 632)

print(b1)
print(b2)
print(b1+b2)