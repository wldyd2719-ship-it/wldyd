<<<<<<< HEAD
from sklearn.datasets import load_iris

iris = load_iris()

for i in range(0,len(iris.data)):
=======
from sklearn.datasets import load_iris

iris = load_iris()

for i in range(0,len(iris.data)):
>>>>>>> 1e8d041 (Add AIoT project files)
        print(f"{i+1:3} {iris.data[i]} {iris.target[i]}")