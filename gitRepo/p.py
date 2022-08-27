test_str = "shanvi is 3 years old and next 7 year will 1 2 4 "
print("original string is: " +test_str)
# frequency of no in string 
res = 0
for i in test_str:
    if(i.isdigit()):
        res += 1

print("count of numbers in string: "+ str(res))


