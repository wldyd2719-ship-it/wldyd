# 다운로드 폴더에 있는 실행파일을 지정된 디렉토리로 이동하는 파이썬 코드 작성해줘

import os
import shutil

source_dir = r"C:\Users\SAMSUNG\Downloads"
dest_dir = r"C:\Users\SAMSUNG\list"

for file_name in os.listdir(source_dir):
    if file_name.endswith(".exe"):
        shutil.move(os.path.join(source_dir, file_name), dest_dir)