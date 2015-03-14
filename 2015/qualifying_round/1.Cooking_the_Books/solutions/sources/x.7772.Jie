
        
        
        

def getLarge(num):
    ilist = [ int(item) for item in num ]
    m = max(ilist)
    n = ilist[0]
    i = 0
    while i<len(ilist):
        if ilist[i]!=0 and ilist[i]<n:
            n = ilist[i]
        i +=1
    if m == 0:
        return [0,0]
    max_indices = [i for i in range(len(ilist)) if ilist[i] == m]
    min_indices = [i for i in range(len(ilist)) if ilist[i] == n]
    maxNum = [ 0 for i in range(len(ilist))]
    minNum = [ 9 for i in range(len(ilist))]
    for idx in max_indices:
        if idx == 0:
            list2 = ilist
        else:
            list2 = [ilist[idx]] + ilist[1:idx] + [ilist[0]] + ilist[idx+1:]
        if lessThan(maxNum,list2):
            maxNum = list2
    mNum = "".join([str(item) for item in maxNum])
    for idx in min_indices:
        if idx == 0:
            list3 = ilist
        else:
            list3 = [ilist[idx]] + ilist[1:idx] + [ilist[0]] + ilist[idx+1:]
        if lessThan(list3,minNum):
            minNum = list3
    nNum = "".join([str(item) for item in minNum])
    
        
    return [nNum,mNum]
def lessThan(list1,list2):
    #return True if list1<list2:
        for i in range(len(list1)):
            if list1[i]<list2[i]:
                return True
            elif list1[i]>list2[i]:
                return False
        return False
with open("cooking_the_books.txt",'r') as f:
    x = f.readline()
    N = int(x)
    with open('output.txt','w') as ff:
        for i in range(N):
            num = f.readline().strip()
            rslt = getLarge(num)
            print rslt
            ff.write('Case #{0}: {1} {2}\n'.format(i+1,rslt[0],rslt[1]))
