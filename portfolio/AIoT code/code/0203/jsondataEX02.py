<<<<<<< HEAD
import pandas as pd
import requests

url = 'https://jsonplaceholder.typicode.com/posts'
response = requests.get(url)

data = pd.json_normalize(response.json())
=======
import pandas as pd
import requests

url = 'https://jsonplaceholder.typicode.com/posts'
response = requests.get(url)

data = pd.json_normalize(response.json())
>>>>>>> 1e8d041 (Add AIoT project files)
print(data.head())