<<<<<<< HEAD
infile = open("anthuman.png", "rb")
outfile = open("ant2.png", "wb")

while True:
    copy_buffer = infile.read(1024)
    if not copy_buffer:
        break
    outfile.write(copy_buffer)

infile.close()
outfile.close()
=======
infile = open("anthuman.png", "rb")
outfile = open("ant2.png", "wb")

while True:
    copy_buffer = infile.read(1024)
    if not copy_buffer:
        break
    outfile.write(copy_buffer)

infile.close()
outfile.close()
>>>>>>> 1e8d041 (Add AIoT project files)
print(f"{infile}을/를 {outfile}로 복사하였습니다.")