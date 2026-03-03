import pandas as pd

dataS = ['Kim', 'Park', 'Lee', 'Choi']
ser = pd.Series(dataS)
print(ser)

dataDF = {'Name':['Kim', 'Park', 'Lee', 'Choi'],'Age':[20, 23, 21, 26]}
df = pd.DataFrame(dataDF)
print(df)

df.to_excel('Data Frame.xlsx', sheet_name='Students',index = False)

df2 = pd.DataFrame(dataDF, index=["학번 1", "학번 2", "학번 3", "학번 4"])
print(df2)