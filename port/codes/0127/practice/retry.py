class Person:
    def __init__(self, name, socialnum):
        self.name = name
        self.socialnum = socialnum
        
class Student(Person):
    UNDER = 0
    OVER = 1
    
    def __init__(self, name, socialnum, type):
        super().__init__(name,socialnum)
        self.type = type
        self.gpa = 0
        self.classes = []
        
    def engcourse(self, course):
        self.classes.append(course)
        
    def __str__(self):
        return f"이름: {self.name}\n주민번호: {self.socialnum}\n평점: {self.gpa}\n수강과목: {self.classes}"
    
class Teacher(Person):
    def __init__(self, name, socialnum):
        super().__init__(name, socialnum)
        self.salary = 3000000
        self.courses = []
        
    def assigtCourse(self, course):
        self.courses.append(course)
        
    def __str__(self):
        return f"이름: {self.name}"+ f"\n주민번호: {self.socialnum}" + f"\n월급: {self.salary}" + f"\n교육과목: {self.courses}"
    
s1 = Student("홍길동", "123456", Student.UNDER)
s1.engcourse("Python")
print(s1)

t1 = Teacher("김철수", "987456")
t1.assigtCourse("Python")
print(t1)