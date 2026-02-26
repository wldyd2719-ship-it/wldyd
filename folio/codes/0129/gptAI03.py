# 첫 번째 엑셀 파일의 이름은 around.xlsx이고, 두 번째 엑셀 파일의 이름은 cafe.xlsx 야.
# 이 두 파일에는 각각 '순번'과 '보이는 것'이 적혀 있어.
# 순번에는 1번부터 번호가 적혀 있고, 보이는 것에는 사물들이 적혀 있어.
# 이 두 파일에 있는 사물들을 합친 다음, 순번을 1번부터 다시 정리하고 싶어.
# 알맞은 파이썬 코드를 작성해줘

import pandas as pd

around = pd.read_excel("around.xlsx")
cafe = pd.read_excel("cafe.xlsx")

combined = pd.concat([around, cafe])

combined['순번'] = range(1, len(combined)+1)
combined.to_excel("combined.xlsx", index=False)