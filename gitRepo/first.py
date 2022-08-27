import mailbox


class Employee:
    def __init__(self,first,last,salary):
        self.first = first
        self.last = last
        self.salary = salary
        self.mail = first + last + "@company.com"
    def full_name(self):
        return"{} {}".format(self.first+self.last)
    def salary_raise(self):
        self.salary = int(self.salary*1.02)

emp1 = Employee('john','Doe',1000)
emp2 = Employee('joe','Biden',10000)
print(emp1.salary)#before increment
             