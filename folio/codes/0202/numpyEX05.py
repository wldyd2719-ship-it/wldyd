import numpy as np

a = np.zeros((3, 3), dtype = "i")
b = np.ones((3, 2), dtype = "i")
c = np.hstack([a, b])
d = np.arange(10, 151, 10).reshape(3, 5)
e = np.vstack([c, d])

print(np.tile(e, (2, 1)))