import requests

url = "https://jsonplaceholder.typicode.com/todos"

data = requests.get(url).json()

for item in data[:5]:
    print(item["id"], item["title"])