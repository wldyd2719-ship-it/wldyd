import pandas as pd

titanic = pd.read_csv("titanic.csv")
print(titanic)
print(titanic["Age"])
print(titanic["Age"].max())
#print(titanic[titanic["Age"].isna()])
#print(titanic.loc[titanic["Age"].isna(), ["Name", "Sex", "Age"]])
#print(titanic["Age"].isna().sum())

ages = titanic["Age"]
print(ages.head())

print(titanic[["Name", "Sex", "Age"]])

below_20 = titanic[titanic["Age"]<=20]
print(below_20.head())

print(titanic[titanic["Pclass"].isin([1,2])])

print(titanic.loc[titanic["Age"]<20,["Name","Age","Sex"]])

print(titanic.iloc[20:23, 5:7])

print(titanic.sort_values(by="Age").head())

print(titanic.sort_values(by=['Pclass', 'Age'], ascending=False).head())