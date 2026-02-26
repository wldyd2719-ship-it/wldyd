class Person:
    def __init__(self, name, socialnum):
        self.name = name
        self.socialnum = socialnum
        
class Student(Person):
    UNDERGRADUATE = 0
    POSTGRADUATE = 1
    
    def __init__(self, name, socialnum, stType):
        super().__init__(name, socialnum)
        self.stType = stType
        self.gpa=0
        self.classes = []
        
    def enrollCourse(self, course):
        self.classes.append(course)
        
    def __str__(self):
        return "\n이름=" + self.name + "\n주민번호=" + self.socialnum + "\n수강과목=" + str(self.classes) + "\n평점=" + str(self.gpa)
    
class Teacher(Person):
    def __init__(self, name, socialnum):
        super().__init__(name, socialnum)
        self.courses = []
        self.salary=3000000
        
    def assignTeaching(self, course):
        self.courses.append(course)
        
    def __str__(self):
        return "\n이름=" + self.name + "\n주민번호=" + self.socialnum + "\n강의과목="+str(self.courses) + "\n월급=" + str(self.salary)

s1 =Student("홍길동", "123456", Student.UNDERGRADUATE)
s1.enrollCourse("Pyhon Program")
print(s1)

t1 = Teacher("김철수", "987456")
t1.assignTeaching("Python")
t1.assignTeaching("Math")
print(t1)