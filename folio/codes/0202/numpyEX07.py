import numpy as np

# 실수로 이루어진 5x6 행렬 생성
data = np.arange(1,31).reshape(5, 6)

print("데이터 행렬:\n", data)
print()

# 전체의 최댓값
print("1. 전체의 최댓값:")
print(np.max(data))
print()

# 각 행의 합
print("2. 각 행의 합:")
print(np.sum(data, axis=1))
print()

# 각 행의 최댓값
print("3. 각 행의 최댓값:")
print(np.max(data, axis=1))
print()

# 각 열의 평균
print("4. 각 열의 평균:")
print(np.mean(data, axis=0))
print()

# 각 열의 최솟값
print("5. 각 열의 최솟값:")
print(np.min(data, axis=0))