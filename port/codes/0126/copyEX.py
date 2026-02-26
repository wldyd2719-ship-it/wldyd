list1 =[1,7,3,5,6,10,8,2,9,4]
print(list1)

list2 = list1
print(list2)

list1[0]=100
print(list1)
print(list2)

list3=list(list1)
print(list3)
list1[1]=200
print(list1)
print(list2)
print(list3)