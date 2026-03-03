# 엑셀 파일에 있는 내용을 읽어서 화면에 출력하는 파이썬 코드를 작성해줘

import pandas as pd
# pip install openpyxl

print(pd.read_excel("around.xlsx"))

df = pd.read_excel("around.xlsx")
print(df.iloc[[4]])
print(df.iloc[4])

df_short = pd.read_excel('around.xlsx', nrows=6)
i = df_short.tail(2)
print(df_short.tail(1))