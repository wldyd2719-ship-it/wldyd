from sklearn import svm
from sklearn.datasets import load_iris

iris = load_iris()

s = svm.SVC(gamma = 0.1, C = 10)
s.fit(iris.data, iris.target)

new_d = [[6.4,3.2,6.0,2.5], [7.1,3.1,4.7,1.35]]

res = s.predict(new_d)
print(res)

for i in res:
    if i == 0:
        print("품종은: Setoca")
        
    elif i == 1:
        print("품종은: versicolor")
        
    elif i == 2:
        print("품종은: virginica")
    
    else:
        print("품종은: Unknown")