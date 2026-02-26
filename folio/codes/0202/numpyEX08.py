import numpy as np

a = np.array([[4, 3, 5, 7],
              [1, 12, 11, 9],
              [2, 15, 1, 14]])
print(a)

print(np.sort(a)) # axis=-1 또는 axis=1 과 동일
print(np.sort(a, axis=0))

a = np.array([42, 38, 12, 25])
j = np.argsort(a)
print(j)