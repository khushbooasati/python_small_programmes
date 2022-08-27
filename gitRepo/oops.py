# from unicodedata import name


# class Person(object):
#     def __init__(self,name,idnumber):
#         self.name = name
#         self.idnumber = idnumber

#     def display(self):
#         print(self.name)
#         print(self.idnumber)

#     def details(self):
#         print("my name is {}".format(self.name))
#         print("idnumber:{}".format(self.idnumber))

# class Employee(Person):
#     def __init__(self,name,idnumber,salary,post):
#         self.salary = salary
#         self.post  = post
        #Person.__init__(self,name,idnumber)# why ?
#     def details(self):
#         print("my name is {}".format(self.name))
#         print("my idnumber is{}".format(self.idnumber))
#         print("post:{}".format(self.post))

# a = Employee("khush",987,6000,"intern")
# a.display()
# a.details()
# 
#             
# polymorphism 
# class Bird:
#     def intro(self):
#         print("there are many types of birds")
#     def flight(self):
#         print("most of the birds can fly but some not")

# class Sparrow(Bird):
#     def flight(self):
#         print("aparrow can fly")

# class Ostrich(Bird):
#     def flight(self):
#         print("ostrich canot fly")
# obj1 = Bird()
# obj2 = Sparrow()
# obj3 = Ostrich()

# obj1.intro()
# obj1.flight()
# obj2.intro()
# obj2.flight()
# obj3.intro()

#encapsulation in python
class Base:
    def __init__(self):
        self.a = "geeks for geeks"
        self.__c = "geeksforgeeks"

class Derived(Base):
    def __init(self):
        #calling constructor of base class
        Base.__init__(self):
        print("calling private member of base class")
        print(self.__c) 

obj1 = Base()
print(obj1.a)               















                


