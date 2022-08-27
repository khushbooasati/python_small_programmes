def table(num):
    result = []
    for i in range(1,11):
      result.append (num*i) 
    return result
    
result = table(6)
print(result)
/////////////////////////////////////////
# ASSIGNMENT #(!)length of string
def table(num):
    result = []
    for i in range(1,11):
      result.append (num*i) 
    return result
    
result = table(6)
print(result)
//////////////////////////////////////////////

def char_frequency(str1):
    dict = {}
    for i in str1:
        if i in dict:
            dict[i] += 1
        else:
            dict[i] = 1

    return dict
print(char_frequency("sanviismad")) 
//////////////////////////////////////////////
def str_both_end(str):
    if len(str)<2:
        return ''

    return str[0:2] + str[-2:]    
       
print(str_both_end("w3resource"))
print(str_both_end("w3"))
print(str_both_end("w"))
/////////////////////////////////////////////////////
def char_replace_str(str):
    char = str[0] 
    str  = str.replace(char,'$')
    str  =  char + str[1:]
    return str

print(char_replace_str("reverse"))       
//////////////////////
def char_mix_str(a,b):
    str1 = b[:2]  + a[2:]
    str2 = a[:2]  + b[2:]
    str3 = str1 + ' ' + str2
    return str3


print(char_mix_str('xyz','abc'))   
////////////////////////////////////////////
def add_string(str):
    str1 = len(str)
    if str1 > 2:
        if str[-3:] == 'ing':
            str = str + 'ly'
        else:
            str = str + 'ing'

    return(str)

print(add_string('ab'))
print(add_string('abc'))                
print(add_string('string'))  
/////////////////////////////////////////////////
def odd_str_length(str):
    result = ''
    for i in  range(len(str)):
        if i % 2 == 0:
            result = result + str[i]
    return result

print(odd_str_length("khushboo"))   
//////////////////////////////////////////
def char_frequency(str):
    dict = {}
    str1 = str.split()

    for i in str1:
        if i in dict:
            dict[i] += 1
        else:
            dict[i] = 1

    return dict
print(char_frequency("this is is a dog  dog +this"))  
/////////////////////////////////////////////////////
user_input = input("what is your favourate language?")
print(user_input.upper())
print(user_input.lower())
# ///////////////////////////////////////////////
def insert_string_middle(str,word):
    return str[:2] + word + str[2:]


print(insert_string_middle('[[]]',"python"))
print(insert_string_middle('(())',"ruby"))
print(insert_string_middle('{{}}',"hello"))

/////////////////////////////////////////////////////////////////
def repeat_list(list1):
    result = []
    for item  in list1:

        if item  not in result:
            result.append(item)
    
        
    return result    

print(repeat_list(['black','green','green','yellow','yellow']))  
///////////////////////////////////////////////////////////////////
def insert_str(str):
    sub_string = str[-2:]
    return sub_string * 4
   
print(insert_str("khushboo"))   
/////////////////////////////////////////////////////////////
def first_three(str):
	return str[:3] if len(str) > 3 else str

print(first_three('ipy'))
print(first_three('python'))
print(first_three('py'))
///////////////////////////////////////////////////////////

def first_three(str):
    return str[:3] if len(str) > 3 else str
    ///////////////////////////////////////////
    def check_str(n1,n2):
    if n1 == '':
     n1 = '0'
    if n2 == '':
     n2 = '0'
    if n1.isdigit() and n2.isdigit():
        return (str(int(n1)+int(n2)))
    else: 
        return "error in  input"        
print(check_str('980','678'))
print(check_str('khush','hina'))
///////////////////////////////////////////////
str = 'python javascript'
str1 = str.replace('j','J')
print(str1)
//////////////////////////////////////////////////////
def colour_code(r,g,b):
    return ('{:02x}'*3).format(r,g,b)
print(colour_code(255,165,1))
print(colour_code(0,0,0))
//////////////////////////////////////////
def number_check(str1):
    result = [int(str1) for str1 in str1.split() if str1.isdigit()]
    return result
print(number_check("red 12 black 45"))
print(number_check("red 54 black 56"))
/////////////////////////////////
def duplicate_words(str):
    list = []
    for words in str:
        if words not in list:
            list.append(words)

    return list
print(duplicate_words("chakachak"))
///////////////////////////////////
def common_str(str1,str2):
    result =''
    for ch in str2:
        if ch in str1 and not ch in result:
            result = result + ch
    return result

print(common_str("jyl",'jhgy'))            
/////////////////////////////////
def occurence_str(str,char):
    result = str.replace(char,'')
    return result

print(occurence_str("delete all specified character in a string",'a'))
////////////////////////////////////////////

def deco(f): #2: f=print_hello()
    def inner():#4
        #5
        """ do what ever you want to do before function "f or print_hello is called"""
        print("she is brilliant")
        
        return f() #6 - returning f or print_hello function
    
    return inner #3 calling inner


@deco #1
def print_hello():
    
    print("i am printing hello....")
    
print_hello()
/////////////////////////////////
# def decor_result(function):
#     def distinction(marks):
#         for m in marks:
#             if m >= 75:
#                 print("distinction")

#         function(marks)
#     return distinction()       

# @ decor_result()
# def result(marks):
#     for m in marks:
#         if m >33:
#             pass
#         else:
#             print("fail")
#             break
#     else:
#         print("pass")
# result([34,45,67])            


def decor(function):
    def inner(name):
        if name == 'durga':
            print("helo! dear this is my exhausing day")
        else:
            function(name)








    return inner
            
@decor
def wish(name):
    print("hello ",name,"gm")

wish("durga")
wish("Ravi")
wish("sunny")
//////////////////////////////////////////////////

def deco(f): #2: f=print_hello()
    def inner():#4
        #5
        """ do what ever you want to do before function "f or print_hello is called"""
        print("she is brilliant")
        
        return f() #6 - returning f or print_hello function
    
    return inner #3 calling inner
    


@deco #1
def print_hello():
    
    print("i am printing hello....")
    
print_hello()
////////////////////////////////////////
def function(a):
    return a*a
x = map(function,(1,2,3,4))
print(x)
print(set(x))    
//////////////////////////////////////
def newfunc(a):
    return a * a

x = map(newfunc , (1,2,3,4))
print(x)
print(set(x))
///////////////////////////////////
tup = (5,55,34,2,3)
newtuple = tuple(map(lambda x: x * 3,tup))
print(newtuple)
///////////////////////////
tup = (1,4,5,6,7)
y = filter(lambda x:(x>3),tup)
print(list(y))
////////////////////////////////
c = map(lambda x: x+x , filter(lambda x:(x>4),(2,6,8,9,6,7)))
print(list(c))
#first run filter(6,7,8,9) then map run(based on the filter output map will execute)

////////////////////////////

d = reduce(lambda x ,y: x + y,map(lambda : x + x ,filter(lambda x: x(x>3),(5,4,5,5,55))))
print(d)
//////////////////////////////////////
# list comprehension
matrix = [[j for j in range(5)]for i  in range(3)]
print(matrix)
/////////////////////////////////////////////////
#numbers = list(map(lambda x : x * 10,[x for x in range(1,6)]))
#print(numbers)
numbers = list(map(lambda x: x + 40,[x for x in range(1,8)]))
print(numbers)
//////////////////////////////////////////////////////////////////////
def longest_list(list1):
    max = 0
    max_word = []
    for i in list1:
        if len(i) > max:
             max = len(i)
             max_word= i

    return max_word

          
print(longest_list(["ghu","kmj","mu"]))
/////////////////////////////////////////
def swap_case_string(str1):
    result_str = ''
    for item in str1:
        if item.isupper():
                result_str += item.lower()
        else:
            
            result_str += item.upper() 
    return result_str

print(swap_case_string("exerCIse")
///////////////////////////////////////////////////
def swap_case_string(str1):
    result_str = ''
    for item in str1:
        if item.isupper():
                result_str += item.lower()
        else:
            
            result_str += item.upper() 
    return result_str

print(swap_case_string("exerCIse")) 
///////////////////////////////////////////
string = "mama"
half = int(len(string) / 2)


if len(string) % 2 == 0: #even
   first_str = string[:half]
   second_str = string[half:]

else:
    first_str = string[:half]
    second_str = string[half+1:]   


#symmetric
if first_str == second_str:
   print(string, 'string is symmetrical')

else:
   print(string, 'string is not symmetrical')


# palindrome
if first_str == second_str[::-1]:
    print(string, "pallindrome")

else:
    print(string,"not pallindrome")
    /////////////////////////////////////////////////


string = "geeks quiz practice code"
#to reverse words 
s = string.split()[::-1]
l =[]
for i in s:
    #appending words to l
    l.append(i)
print(" ".join(l))

//////////////////////////////////////////////////////////
(use string and its method not list)
string = "my name is khushboo and i m a girl"
l = ""
str1 = string.split()[::-1]
for i in str1:
    l = l + i + " "

print(l)
//////////////////////////////////////////////////////////

#Write a Python program to convert the date to datetime (midnight of the date) in Python.
from datetime import date
from datetime import datetime
dt = date.today()
print(datetime.combine(dt,datetime.min.time()))
///////////////////////////////////////////////////////////

Write a Python program to print next 5 days starting from today 

from datetime import datetime

base = datetime.datetime.today()

for x in range(0, 5):
    print(base + datetime.timedelta(days = x))

///////////////////////////////////////////////////////////////////                   





        

                                                                             
        
    













    






         







 









       




