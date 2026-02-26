import matplotlib.pylab as plt
from sklearn import linear_model

reg = linear_model.LinearRegression()

X = [[174], [152], [138], [128], [186]] # 학습 예제
y = [71, 55, 46, 38, 88] # 정답
reg.fit(X, y) 

print(reg.coef_)
print(reg.intercept_)
print(reg.score(X, y))

print(reg.predict([[178]]))

plt.scatter(X, y, color='black')
y_pred = reg.predict(X)
plt.plot(X, y_pred, color='blue', linewidth=3)
plt.show()