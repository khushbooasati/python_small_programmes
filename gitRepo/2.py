# # oops concept questions
# class Dog:
#     # class attribute
#     attr1 = "mammal"
#     # instance attribute
#     def __init__(self):
#         print("init is called")
#     def speak(self,voice):
    
#         print(f"my name is {voice}")

# obj1 = Dog()


# # accessing class methods
# obj1.speak("bark")
#operator overloading
class A:
    def __init__(self,a):
        self.a = A
        # adding two objects

    def __add__(self,o):
        return self.a + o.a

ob1 = A(1)
ob2 = A(2)
ob3 = A("geeks")
ob4 =   A("For")
print(ob1+ob2)
print(ob3+ob4)







