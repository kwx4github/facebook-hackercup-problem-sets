#!/usr/bin/python
__author__ = 'mo'
import fileinput


def main():
    num_cases = 0
    numbers = []
    for line in fileinput.input():
        if fileinput.isfirstline():
            num_cases = int(line)
        else:
            numbers.append(str(int(line)))

    for i in range(num_cases):
        smallest, largest = process(numbers[i])
        print "Case #%d: %s %s" % (i+1, smallest, largest)


def process(number):
    smallest = largest = number
    l = len(number)

    if l != 1:  # if only one digit number return it without processing

        nums = []
        for i in range(len(number)):
            nums.append((number[i], i))
        smallest = list(nums)
        largest = list(nums)
        nums_asc = sorted(nums, key=lambda tu: (tu[0], tu[1]))
        nums_asc_0 = list(nums_asc)
        nums_desc = nums_asc[::-1]

        # making the smallest, by swapping smallest number (not zero) with most left one
        # if the most left one is already the smallest, we go step to right
        for i in range(l):

            if i == 0:  # special case: if on first element we can't replace with 0 so we construct asc array without zeros
                for z in range(len(nums_asc_0)):
                    if nums_asc_0[0][0] == '0':
                        nums_asc_0.pop(0)
                if smallest[0][0] == nums_asc_0[0][0]:
                    continue
                swap(smallest, smallest[0], nums_asc_0[0])
                break

            else:

                if smallest[i][0] == nums_asc[i][0] or (nums_asc[i][0] > smallest[i][0]):
                    continue
                swap(smallest, smallest[i], nums_asc[i])
                break

        # making the largest, by swapping largest number with most left one
        # if the most left one is already the largest, we go step to right
        for i in range(l):
            if largest[i][0] == nums_desc[i][0]:
                continue
            swap(largest, largest[i], nums_desc[i])
            break

        largest = "".join([t[0] for t in largest])
        smallest = "".join([t[0] for t in smallest])

    return smallest, largest


def swap(l, t1, t2):
    temp = t1
    l[t1[1]] = t2
    l[t2[1]] = temp

if __name__ == "__main__":
    main()
