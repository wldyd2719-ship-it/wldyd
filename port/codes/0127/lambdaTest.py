data = [(3, 100), (3, 500), (1, 100), (7, 300), (6, 400), (1, 200), (6, 300)]
print(sorted(data, key=lambda item: (item[1], -item[0])))