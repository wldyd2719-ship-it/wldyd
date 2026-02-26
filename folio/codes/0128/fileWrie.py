outfile = open("output.txt", "w")
for i in range(1, 11):
    outfile.write(str(i)+"\n")

outfile.close()   
    
infile = open("output.txt", "r", encoding="utf-8")
line = infile.readline()
while line !=  "":
    print(line, end="")
    line = infile.readline()
infile.close()