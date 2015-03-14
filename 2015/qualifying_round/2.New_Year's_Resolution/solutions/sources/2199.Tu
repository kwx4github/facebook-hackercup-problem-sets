#import numpy
lines = open("new_years_resolution.txt").read().splitlines()
f_out = open('output_submission.txt', 'w') #Open output file for appending result

line_num = -1
def read_line():
    global line_num
    ret = list()
    line_num += 1
    ret_list = lines[line_num].split(" ")
    for item in ret_list:
        ret.append(int(item))
    return ret

def subset_sum_index(index, target, partial=[]):
    global solution    
    numbers = [key_index[i] for i in index]
    x = [key_index[i] for i in partial]
    s = sum(x)
    if s == target:         
        solution += [partial]        #Save the index rather than element
    for i in range(len(index)):                
        n = index[i]
        remaining = index[i+1:]        
        subset_sum_index(remaining, target, partial + [n])        
    return solution
def list_to_dict(array):
    key_index = {}
    index = 0
    for item in array:                
        key_index[index] = item
        index += 1
    return key_index
    
T = read_line()
answer = {True:"yes", False:"no"}
if __name__ == "__main__":
    global solution
    for case_id in range(1,(T[0]+1)):
        solution = []        
        total = read_line()#GP, GC, GF        
        N = read_line()[0] #Number of food
        matrix = [[0 for x in range(3)] for y in range(N)] #Initialize matrix to zero
        #Initialize matrix as read from file
        for i in range(N):        
            matrix[:][i][:] = read_line()            
        result = False
        col_0, col_1, col_2 = [row[0] for row in matrix],[row[1] for row in matrix],[row[2] for row in matrix]
        key_index = list_to_dict(col_0)
        #find the index solutions
        print "Start"
        solutions = subset_sum_index(range(N),total[0])
        print "Finish"
        if solutions: #has some values
            for sol in solutions:
                sum1 = sum(col_1[i] for i in sol)
                if sum1 == total[1]:
                    sum2 = sum(col_2[i] for i in sol)
                    if sum2 == total[2]:
                        result = True                    
        message = "Case #"+str(case_id)+ ": " + answer[result] +"\n"
        print message
        f_out.write(message)
f_out.close()
