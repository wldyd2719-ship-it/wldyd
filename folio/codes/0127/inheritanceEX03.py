class Car:
    def __init__(self, make, model, color, price):
        self.make = make
        self.model = model
        self.color = color
        self.price = price
    
    def setMake(self, make):
        self.make = make
        
    def getMake(self):
        return self.make
    
    def displayCar(self):
        return f"차량 = {self.make}, {self.model}, {self.color}, {self.price}"

class EletronicCar(Car):
    def __init__(self, make, model, color, price, batterySize):
        super().__init__(make, model, color, price)
        self.batterySize=batterySize
        
    def setBatterySize(self, batterySize):
        self.batterySize=batterySize
        
    def getBatterySize(self):
        return self.batterySize
    
    def displayECar(self):
        print(super().displayCar() + " "+ str(self.batterySize))



car1=Car("Hyndae", "Model H", "gray", 6000)
ecar1=EletronicCar("Deawoo", "D model", "White", 7000, 240)
print(car1.displayCar())
ecar1.displayECar()