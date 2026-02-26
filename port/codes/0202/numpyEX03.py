import numpy as np

numpyarray = np.array([[10,20,30,40],
                       [50,60,70,80]])
print(numpyarray)

m = np.array([[0,1,2,3,4],
              [5,6,7,8,9],
              [10,11,12,13,14]])
print(m[1,2])
print(m[2,4])
print(m[1,1:3])
print(m[1:3, 2])
print(m[0:2, 3:5])

l1 = list(range(1,21))
x = np.array(l1)
print(x[x%3 == 0])
print(x[x%4 == 1])
print(x[(x%3 == 0) & (x%4 == 1)])

a = np.zeros(5)
print(a)