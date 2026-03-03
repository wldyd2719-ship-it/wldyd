<<<<<<< HEAD
infile =open("sales.txt", "r", encoding="utf-8")
outfile = open("sales.txt", "a", encoding="utf-8")

sum = 0
count = 0

line = infile.readline()
while line != "":
    value = int(line)
    sum += value
    count += 1
    line = infile.readline()
  
outfile.write(f"총매출 = {sum}\n")
outfile.write(f"평균 일매출 = {sum/count}")

infile.close()
=======
infile =open("sales.txt", "r", encoding="utf-8")
outfile = open("sales.txt", "a", encoding="utf-8")

sum = 0
count = 0

line = infile.readline()
while line != "":
    value = int(line)
    sum += value
    count += 1
    line = infile.readline()
  
outfile.write(f"총매출 = {sum}\n")
outfile.write(f"평균 일매출 = {sum/count}")

infile.close()
>>>>>>> 1e8d041 (Add AIoT project files)
outfile.close() 