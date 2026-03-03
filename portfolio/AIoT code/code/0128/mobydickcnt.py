<<<<<<< HEAD
counter = [0]*26
infile = open("mobydick.txt", "r", encoding="utf-8")
ch = infile.read(1)
while ch != "" :
    ch = ch.upper()
    if ch >= "A" and ch <= "Z" :
        i = ord(ch) - ord("A")
        counter[i] += 1
    ch = infile.read(1)
    
infile.close()
=======
counter = [0]*26
infile = open("mobydick.txt", "r", encoding="utf-8")
ch = infile.read(1)
while ch != "" :
    ch = ch.upper()
    if ch >= "A" and ch <= "Z" :
        i = ord(ch) - ord("A")
        counter[i] += 1
    ch = infile.read(1)
    
infile.close()
>>>>>>> 1e8d041 (Add AIoT project files)
print(counter)