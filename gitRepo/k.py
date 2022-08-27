string = "my name is khushboo and i m a girl"
dict1 = {} 
for i in string.split():
    if i not in dict1:
 \       dict1[i] = len(i)

print(dict1)
