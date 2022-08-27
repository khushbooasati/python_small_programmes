from logging import RootLogger


class Employee:
    no_of_leaves = 8
    def __init__(self,name,salary,arole):
        self.name = name
        self.salary = salary
        self.role = RootLogger
    def print_details(self) :
        print(f"the name is{self.name}.salary is{self.salary}and role is{self.role}")

    # classs methods
    def change_leaves(cls,newleaves):# why we did not pass self
        cls.no_of_leaves = newleaves # why

    def __add__(self,other): 
        return self.salary + other.salary  
emp1 = Employee("Harry",345,"prograammer")
emp2 = Employee("Neetu",123,"specialist")
print(emp1 + emp2 )               

