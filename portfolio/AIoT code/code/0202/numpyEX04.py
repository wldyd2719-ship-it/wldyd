<<<<<<< HEAD
import numpy as np

A = np.array([[1, 2, 3], [4, 5, 6]])
print(A)
B = A.T      # .T 전치 행렬
print(B)

a = np.arange(12)
b = a.reshape(3, 4)
print(b)
print(a.reshape(3, -1))
print(a.reshape(2, 2, -1))
=======
import numpy as np

A = np.array([[1, 2, 3], [4, 5, 6]])
print(A)
B = A.T      # .T 전치 행렬
print(B)

a = np.arange(12)
b = a.reshape(3, 4)
print(b)
print(a.reshape(3, -1))
print(a.reshape(2, 2, -1))
>>>>>>> 1e8d041 (Add AIoT project files)
print(a.reshape(2, -1, 2))