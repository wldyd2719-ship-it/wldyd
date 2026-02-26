while True:   
    try:
        numerator = int(input("분자 입력 : "))
        denominator = int(input("분모 입력 : "))
        
        if (numerator == 00) or (denominator == 00):
            print("프로그램 종료")
        break
        
    except ValueError:
        print("정수만 입력")
    
    try:
        division = numerator // denominator
        modulo = numerator % denominator
        
    except ZeroDivisionError:
            print("분모에 0이 아닌 정수 입력")
            
    print(f"{numerator}/{denominator} = {division}")
    print(f"{numerator}%{denominator} = {modulo}")