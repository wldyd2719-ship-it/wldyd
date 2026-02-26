from sklearn.datasets import load_iris

iris = load_iris()
print(iris.keys())
print(iris["data"])
print(iris["DESCR"])
print(iris.DESCR)
print(iris.feature_names)
print(iris.target_names)