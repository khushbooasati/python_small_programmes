class Car:
    def __init__(self,model_name,model_id):
        self.model_name = model_name
        self.model_id  = model_id
    def display(self):
        print(self.mode_name,self.model_id) 

        c1 = Car("toyota",6)
        c1.display()



