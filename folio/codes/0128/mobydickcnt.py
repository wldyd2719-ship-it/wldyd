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
print(counter)