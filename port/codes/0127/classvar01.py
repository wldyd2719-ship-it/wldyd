class Television:
    serialNumber = 0   # 클래스 변수
    
    def __init__(self, channel, volume, on):
        self.channel = channel
        self.volume = volume
        self.on = on
        Television.serialNumber += 1
        
        self.number = Television.serialNumber
        
    def show(self):
        print(self.channel, self.volume, self.on, self.number)
    
tv1 = Television(12, 15, True);
tv1.show()

tv2 = Television(24, 14, True);
tv2.show()

tv3 = Television(28, 24, False);
tv3.show()