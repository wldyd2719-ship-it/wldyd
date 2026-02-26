filename = input("파일 이름: ")
target = input("문자열: ")

try:
    found = False

    with open(filename, "r", encoding="utf-8") as f:
        for line in f:
            if target in line:
                print(f"{filename}: {line.strip()}")
                found = True

    if not found:
        print("해당 문자열 없음")

except FileNotFoundError:
    print("파일이 없습니다.")
