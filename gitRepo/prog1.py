def largest (arr, n):
    max = arr[0]
    for i in range(1, n):
        if arr[i]> max:
            max = arr[i]
            return max

arr = [10,30,40,50,60]
n = len(arr)
Ans = largest(arr,n)
print("largest in given array", Ans)
            





        

        