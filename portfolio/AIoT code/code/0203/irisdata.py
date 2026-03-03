from sklearn.datasets import load_iris

iris = load_iris()

for i in range(0,len(iris.data)):
        print(f"{i+1:3} {iris.data[i]} {iris.target[i]}")