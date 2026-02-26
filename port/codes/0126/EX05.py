class Student:
    def __init__(self, name, age):
        self.__name = name
        self.__age = age
        
    def getname(self):
        return self.__name
    def getage(self):
        return self.__age
        
st1 = Student("홍길동",17)
st2 = Student("김철수",54)

print(f"{st1.getname()}의 나이는 {st1.getage()}입니다.")
print(f"{st2.getname()}의 나이는 {st2.getage()}입니다.")