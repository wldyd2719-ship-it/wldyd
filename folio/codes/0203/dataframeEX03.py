import pandas as pd

countries = pd.read_csv('countries.csv')
print(countries)

df = pd.DataFrame({"code":["CA"], "country":["Canada"],"area":[9984670], "capital":["Ottawa"],"population":[34300000]})
countries = pd.concat([countries,df], ignore_index = True)

countries["density"] = countries["population"]/countries["area"]
print(countries)