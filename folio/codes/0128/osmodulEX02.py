import os

filelist = os.listdir()

for f in filelist:
    infile = open(f, "r", encoding="utf-8")
    for line in infile:
        e = line.rstrip()
        if "open" in e:
            print(f, ":", e)
    infile.close()