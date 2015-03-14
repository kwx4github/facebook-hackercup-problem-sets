#!/usr/bin/python
__author__ = 'mo'
import fileinput
from itertools import combinations


def main():
    lines = [x.strip('\n') for x in fileinput.input()]
    num_cases = int(lines[0])
    output = open('output.txt', 'w')

    ptr = 1
    for c in range(num_cases):
        case = {}

        case['desired'] = [int(g) for g in lines[ptr].split(" ")]
        ptr += 1

        case['num_foods'] = int(lines[ptr])
        ptr += 1

        case['foods'] = []
        for nf in range(case['num_foods']):
            case['foods'].append([int(g) for g in lines[ptr].split(" ")])
            ptr += 1

        decision = process(case)

        print("Case #%d: %s" % (c+1, 'yes' if decision else 'no'))
        output.write("Case #%d: %s\n" % (c+1, 'yes' if decision else 'no'))
    output.close()


def process(case):
    decision = False

    # get all possible combinations
    combs = all_combinations(case['foods'])

    # get sums of all combinations and compare it with desired if it matches break and set decision to true
    for comb in combs:
        P = C = F = 0
        for food in comb:
            P += food[0]
            C += food[1]
            F += food[2]

        if case['desired'][0] == P and case['desired'][1] == C and case['desired'][2] == F:
            decision = True
            break

    return decision


def all_combinations(ss):
    all_combs = []
    for L in range(1, len(ss)+1):
        for subset in combinations(ss, L):
            all_combs.append(subset)
    return list(all_combs)


# usage: python new_years_resolution.py input_file_name
if __name__ == "__main__":
    main()
