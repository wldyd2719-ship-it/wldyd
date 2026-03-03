class Person:
    def __init__(self, name, phone, addr, age):
        self.name = name
        self.phone = phone
        self.addr = addr
        self.age = age
        
    def __str__(self):
        return f"{self.name}, {self.phone}, {self.addr}, {self.age}"
        
p1 = Person("홍길동", "123456", "우산국", 25)
p2 = Person("김길동", "897456", "동신국", 36)
p3 = Person("최길동", "564231", "미산국", 52)

personlist = [p1,p2,p3]
for i in personlist:
    print(i)

sorted_list = sorted(personlist, key=lambda p:p.name)

for p in sorted_list:
    print(p)