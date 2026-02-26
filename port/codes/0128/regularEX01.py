import re

pattern = r"^01[0123456789]-\d{3,4}-\d{4}$"

phone = [
    "010-2345-8564",
    "010-12345-9875",
    "010-1265-45687",
    "110-2584-6542",
    "01025698456",
    "010-256-6523"
]

for p in phone:
    if re.match(pattern, p):
        print(p, "올바른 형식")
        
    else:
        print(p,"잘못된 형식")