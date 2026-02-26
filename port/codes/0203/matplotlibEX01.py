import matplotlib.pyplot as plt
import pandas as pd

df = pd.DataFrame({'name':['Kim','Lee','Park','Choi','Hong','Chung','Jang'],
                   'age':[22,26,78,17,46,32,21],
                   'city':['Seoul','Busan','Seoul','Busan','Seoul','Daejun','Daejun'],
                   'children':[2,3,0,1,3,4,3],
                   'pets':[0,1,0,2,2,0,3]})

#df.plot(kind='line', x='name', y='pets', color='red')

ax = plt.gca()
df.plot(kind='line',x='name',y='children',ax=ax)
df.plot(kind='line',x='name',y='pets', color='red', ax=ax)

plt.show()