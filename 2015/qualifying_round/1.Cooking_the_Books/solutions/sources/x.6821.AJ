#!/usr/bin/python

import sys
import time

def parse(line):
  return list(line.strip())

def process(n, line_num):
  first_digit = n[0]
  min_digit = max_digit = (first_digit, 0)
  for i, digit in enumerate(n):
    if digit == "0":
      continue

    if digit > max_digit[0]:
      max_digit = (digit, i)
    elif digit < min_digit[0]:
      min_digit = (digit, i)

  print "Case #%d:" % line_num,

  n[0] = min_digit[0]
  n[min_digit[1]] = first_digit
  print "".join(n),
  n[min_digit[1]] = min_digit[0]

  n[0] = max_digit[0]
  n[max_digit[1]] = first_digit
  print "".join(n),

  print

def main():
  lines = int(sys.stdin.readline().strip())
  for line_num in xrange(lines):
    line = sys.stdin.readline()
    process(parse(line), line_num + 1)

if __name__ == "__main__":
  main()
