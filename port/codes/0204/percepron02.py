from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.linear_model import Perceptron
import numpy as np

# 1) 데이터셋 읽고 훈련/테스트로 분할
digit = datasets.load_digits()
x_train, x_test, y_train, y_test = train_test_split(
    digit.data, digit.target, train_size=0.6, random_state=42
)

# 2) Perceptron 모델 생성 및 학습
p = Perceptron(max_iter=100, eta0=0.001, verbose=0)
p.fit(x_train, y_train)

# 3) 테스트 집합으로 예측
res = p.predict(x_test)

# 4) 혼동 행렬 생성
conf = np.zeros((10, 10))
for i in range(len(res)):
    conf[res[i]][y_test[i]] += 1

print(conf)

# 5) 정확도 계산
no_correct = 0
for i in range(10):
    no_correct += conf[i][i]

accuracy = no_correct / len(res)
print("테스트 집합에 대한 정확률은 ", accuracy * 100, "%입니다.")