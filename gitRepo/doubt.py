def unwanted_char(str1,uwc):
    for i in uwc:
        str1 = str1.replace(i,'')
    return str1

uwc = ["%","@","*","!"]

print(unwanted_char("inspir"))
# all doubts in oops make oops programmes 
# make app projects
# sql revise
# __add__(is it same like constrictor but somehow we made this as method)
#super.__init__

