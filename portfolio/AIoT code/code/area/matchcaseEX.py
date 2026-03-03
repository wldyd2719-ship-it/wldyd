score = int(input("점수 입력 : "))

match score//10:
    case 10:
        print("학점 A")
        
    case 9:
        print("학점 A")
        
    case 8:
        print("학점 B")
        
    case 7:
        print("학점 C")
        
    case 6:
        print("학점 D")
        
    case _:
        print("학점 F")