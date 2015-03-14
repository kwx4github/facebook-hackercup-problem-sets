#! /usr/bin/env python
#################################################################################
#     File Name           :     2 New Year's Resolution.py
#     Created By          :     xiaodi
#     Creation Date       :     [2015-01-10 10:36]
#     Last Modified       :     [2015-01-10 10:36]
#     Description         :      
#################################################################################

from itertools import combinations

T = input()

for t in xrange(T):
	g = raw_input()
	G = map(int, g.split())
	N = input()
	l = []
	for n in xrange(N):
		e = raw_input()
		E = map(int, e.split())
		l.append(E)
	flag = False;
	for e in xrange(1, len(l)+1):
		if flag:
			break
		for C in combinations(l, e):
			temp = [0, 0, 0]
			if flag:
				break
			for c in C:
				temp[0] = temp[0] + c[0]
				temp[1] = temp[1] + c[1]
				temp[2] = temp[2] + c[2]
				if temp[0] > G[0] or temp[1] > G[1] or temp[2] > G[2]:
					break
				if temp[0] == G[0] and temp[1] == G[1] and temp[2] == G[2]:
					flag = True
					break
	if flag:
		print "Case #%d: yes" % (t+1)
	else:
		print "Case #%d: no" % (t+1)