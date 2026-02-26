class Counter:
    def _init_(self):
        self.cnt = 0            # constructor = 생성자
    def increment(self):
        self.cnt += 1
        
c1 = Counter()
c2 = Counter()
c1.cnt = 8
print(f"c1 객체의 cnt 변수의 값은 {c1.cnt}입니다.")
c1.increment()
print(f"c1 객체의 메소드인 increment()를 호출한 후, c1 객체의 cnt 변수의 값은 {c1.cnt}입니다.")

c2.cnt = 100
print(f"c2 객체의 cnt 변수의 값은 {c2.cnt}입니다.")
c2.increment()
print(f"c2 객체의 메소드인 increment()를 호출한 후, c2 객체의 cnt 변수의 값은 {c2.cnt}입니다.")