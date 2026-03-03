<<<<<<< HEAD
class MyCounter(object):
    def __init__(self, low, high):
        self.current = low
        self.high = high
        
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.current > self.high:
            raise StopIteration
        else:
            self.current += 1
            return self.current - 1
        
c = MyCounter(1, 10)
for i in c:
=======
class MyCounter(object):
    def __init__(self, low, high):
        self.current = low
        self.high = high
        
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.current > self.high:
            raise StopIteration
        else:
            self.current += 1
            return self.current - 1
        
c = MyCounter(1, 10)
for i in c:
>>>>>>> 1e8d041 (Add AIoT project files)
    print(i, end=' ')