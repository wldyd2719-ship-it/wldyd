temps = [28,31,33,35,27,26,25]
for i in temps:
    print(f"{i}")
    
for i in range(7):
    print(f"{temps[i]}")
    
questions =['name','quest','color']
answers =['Kim','파이썬','blue']
for q, a in zip(questions, answers):
    print(f"What is your {q}? It is {a}")