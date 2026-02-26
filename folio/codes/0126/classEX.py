class Television:
    def __init__(self, channel, volume, on):
        self.channel = channel
        self.volume = volume
        self.on = on
    def show(self):
        print(self.channel, self.volume, self.on)
    def setChannel(self, channel):
        self.channel = channel
    def getChannel(self):
        return self.channel
    def setVolume(self, volume):
        self.volume = volume
    def getVolume(self):
        return self.volume
    def setOn(self, on):
        self.on = on
    def getOn(self):
        return self.on
    
tv1 = Television(9, 10, True)
tv2 = Television(6, 15, False)

print("tv1:")
tv1.show()         
tv1.setChannel(10)
print(tv1.getChannel())
tv1.setVolume(30)
print(tv1.getVolume())
tv1.setOn(False)
print(tv1.getOn())
tv1.show()
print("")

print("tv2:")
tv2.show()