
"""
Author: Parth Pankaj Tiwary
Complexity: Big-Oh(n**2)
Where n is the size of the number entered as a string.
Example: 1234 has a size of 4
"""
def minimize(n):
    min = int(n)
    number = [x for x in n]
    for x in xrange(len(n)):
        for y in xrange(len(n)):
            newNumber = swap(x, y, number)
            swappedNumber = int("".join(newNumber))
            if swappedNumber < min and len(str(swappedNumber)) == len(number):
                min = swappedNumber
            number = swap(x, y, number)
    return min

def maximize(n):
    max = int(n)
    number = [x for x in n]
    for x in xrange(len(n)):
        for y in xrange(len(n)):
            newNumber = swap(x, y, number)
            swappedNumber = int("".join(newNumber))
            if swappedNumber > max:
                max = swappedNumber
            number = swap(x, y, number)
    return max
    #index = (len(number) - 1) - number[::-1].index(maximum)


def swap(m, n, array):
    array[m], array[n] = array[n], array[m]
    return array


t = input()
numbers = []
for x in xrange(t):
    number = raw_input()
    numbers.append(number)
case = 1
for x in numbers:
    print("Case #%s: " + str(minimize(x)) + " " + str(maximize(x)))%case
    case += 1
