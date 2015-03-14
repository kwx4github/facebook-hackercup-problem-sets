__author__ = 'Dylan Thiemann'
__date__ = '01/08/15'
#Facebook Hacker Cup 2015

#Problem 1

def findMinMaxNum(num):
    x = []
    stringNum = str(num)
    if (len(stringNum) == 1):
        return num, num
    x.append(num)
    for i in range(0, len(stringNum)-1):
        for j in range(i+1, len(stringNum)):
            if (i == 0) and (stringNum[j] == '0'):
                continue
            else:
                tempString = list(stringNum)
                tempString[i] = stringNum[j]
                tempString[j] = stringNum[i]
                tempString2 = ""
                for h in tempString:
                    tempString2 += h
                x.append(int(tempString2))
    return min(x), max(x)

def main():
    my_file = open("cooking_the_books.txt","r")
    output_file = open("output1.txt", "w")
    line1 = int(my_file.readline())
    inputNums = []
    i = 0
    while i < line1:
        num = my_file.readline()
        min, max = findMinMaxNum(int(num))
        output_file.write("Case #" + str(i+1) + ": " + str(min) + " " + str(max))
        output_file.write("\n")
        i += 1

    my_file.close()
    output_file.close()

main()
