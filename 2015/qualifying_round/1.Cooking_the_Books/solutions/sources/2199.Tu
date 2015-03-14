from copy import deepcopy
#lines = open("cooking_the_books_example_input.txt").read().splitlines()

lines = open("cooking_the_books.txt").read().splitlines()
f_out = open('output_submit.txt', 'w') #Open output file for appending result
N = int(lines[0])

def cook(line_num):
    num = lines[line_num]
    digits_list = list(num)
    digits = map(int, digits_list)
    #Sort 
    descending = sorted(digits, reverse=True)
    ascending = sorted(digits)
    length = len(digits)
    if ascending[0] == 0: #leading digits are zero, search for first non-zero digit
        if length >1:
            z = 1
            while ascending[z] == 0 and z<length:
                z = z+1
            ascending[0], ascending[z] = ascending[z], ascending[0] 
        else:
            return "Case #"+str(line_num)+": 0 0\n"
    def compare_swap(alist):
        result = deepcopy(digits_list)
        for i in range(length):
            swap = alist[i]
            if digits[i] != swap:
                result[i], result[num.rfind(str(alist[i]))] =  result[num.rfind(str(alist[i]))], result[i]
                break
        return "".join(result)
    smallest = compare_swap(ascending)
    largest = compare_swap(descending)
    return "Case #"+str(line_num)+": "+smallest + " " + largest+"\n"
for line_num in range(1, int(N)+1):    
    message = cook(line_num)
    f_out.write(message)    
f_out.close()
