class Employee:
    def __init__(self, name, salary):
        self.salary = salary
        self.name = name
        
    def getsalary(self):
        return self.salary
    
    def display(self):
        return f"{self.name}, {self.salary}"

class Maneger(Employee):
    def __init__(self, name, salary, bonus):
        super().__init__(name, salary)
        self.bonus = bonus
        
    def getsalaryM(self):
        return super().getsalary() + self.bonus
    
    def displayM(self):
        return f"{self.name}, {self.salary}, {self.bonus}"
    

emp1 = Employee("kim", 500)
emp2 = Maneger("Lee", 500, 50)
print(f"emp1: {emp1.getsalary()}")
print(f"emp2: {emp2.getsalaryM()}")