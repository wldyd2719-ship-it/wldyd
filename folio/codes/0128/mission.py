# 파일 이름과 문자열을 입력 받고 파일이 있으면 그 파일 안에 문자열이 있는지 판별하라.
# 파일 이름과 해당 문자열을 가진 라인을 출력하는 프로그램을 작성
#---------------------------------
#파일 이름: input.txt 
#문자열: 홍길동
# input: 홍길동
#-------------------------------
#파일 이름: input.txt 
#문자열: 장길동
# input: 해당 문자열 없음
#--------------------------------
#파일 이름: inoutput.txt 
#문자열: 홍길동
# inoutput: 파일이 없습니다.
#---------------------------------

import os

name = input("파일명 입력 : "+".txt")
search = input("찾을 내용 입력 : ")
filelist = os.listdir()

for f in filelist:
    if os.path.isfile(f) :
        if f.endswith(".txt"):
            if f == name:
                infile = open(f, "r", encoding="utf-8")
                for n in infile:
                    e = n.rstrip()
                    if search in e:
                        print(f"{f} : {e}")
                        infile.close()

                    else:
                        print(f"{search}가 없습니다.")
                        break
          
    print(f"{name}파일이 없습니다.")