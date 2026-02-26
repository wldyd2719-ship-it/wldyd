
name = input("파일명 입력 : ")
search = input("찾을 내용 입력 : ")

found_file = False
found_text = False

# 현재 폴더의 파일 목록 확인
for f in os.listdir():
    if os.path.isfile(f) and f.endswith(".txt"):
        if f == name:
            found_file = True
            with open(f, "r", encoding="utf-8") as infile:
                for line in infile:
                    line = line.rstrip()
                    if search in line:
                        print(f"{f} : {line}")
                        found_text = True

# 파일 자체가 없을 때
if not found_file:
    print(f"{name}파일이 없습니다.")
# 파일은 있는데 내용이 없을 때
elif not found_text:
    print(f"{search}이 없습니다.")
