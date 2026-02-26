import tensorflow as tf
import numpy as np
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

model = Sequential()

model.add(Dense(units=2, activation='sigmoid', input_dim=2))
model.add(Dense(units=1, activation='sigmoid'))
sgd = tf.keras.optimizers.SGD(learning_rate=0.1)
model.compile(loss='mean_squared_error', optimizer=sgd)

X = np.array([[0, 0],[0, 1],[1, 0],[1, 1]])
y = np.array([[0], [1], [1], [0]])
model.fit(X, y, batch_size=1, epochs=5000)

print( model.predict(X) )