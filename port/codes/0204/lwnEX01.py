from sklearn import datasets
import matplotlib.pyplot as plt

lfw=datasets.fetch_lfw_people(min_faces_per_person=70,resize=0.4) # 데이터셋 읽기
plt.figure(figsize=(20,5))
for i in range(8): # 처음 8명을 디스플레이
    plt.subplot(1,8,i+1)
    plt.imshow(lfw.images[i],cmap=plt.cm.bone)
    plt.title(lfw.target_names[lfw.target[i]])
    
plt.show()
news=datasets.fetch_20newsgroups(subset='train') # 데이터셋 읽기
print("*****\n",news.data[0],"\n*****") # 0번 샘플 출력
print("이 문서의 부류는 <",news.target_names[news.target[0]],"> 입니다.")