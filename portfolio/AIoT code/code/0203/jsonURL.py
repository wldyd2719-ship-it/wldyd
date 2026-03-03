<<<<<<< HEAD
import requests

url = "https://jsonplaceholder.typicode.com/todos"

data = requests.get(url).json()

for item in data[:5]:
=======
import requests

url = "https://jsonplaceholder.typicode.com/todos"

data = requests.get(url).json()

for item in data[:5]:
>>>>>>> 1e8d041 (Add AIoT project files)
    print(item["id"], item["title"])