import plotly.express as px

# Iris 데이터 로드
df = px.data.iris()

# petal_length 제외 → 3차원 공간
fig = px.scatter_3d(
    df,
    x="sepal_length",
    y='sepal_width',
    z='petal_width',
    color='species',
    title='Iris Dataset (3D Visualization)'
)

# 브라우저로 출력
fig.show(renderer="browser")