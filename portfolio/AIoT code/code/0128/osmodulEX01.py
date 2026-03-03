<<<<<<< HEAD
import os

cwd = os.getcwd()
print(cwd)
files = os.listdir()
for name in files :
    if os.path.isfile(name) :
        if name.endswith(".txt") :
=======
import os

cwd = os.getcwd()
print(cwd)
files = os.listdir()
for name in files :
    if os.path.isfile(name) :
        if name.endswith(".txt") :
>>>>>>> 1e8d041 (Add AIoT project files)
            print(name)