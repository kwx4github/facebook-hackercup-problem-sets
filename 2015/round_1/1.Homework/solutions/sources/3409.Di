#! /usr/bin/env python
#################################################################################
#     File Name           :     1 Homework.py
#     Created By          :     xiaodi
#     Creation Date       :     [2015-01-18 10:29]
#     Last Modified       :     [2015-01-18 10:29]
#     Description         :      
#################################################################################

# find primes smaller than B => prime list L
# use L to increment primacity, between A and B

# [math - Sieve of Eratosthenes - Finding Primes Python - Stack Overflow](http://stackoverflow.com/questions/3939660/sieve-of-eratosthenes-finding-primes-python)
def primes_sieve(limit):
    a = [True] * limit                          # Initialize the primality list
    a[0] = a[1] = False

    for (i, isprime) in enumerate(a):
        if isprime:
            yield i
            for n in xrange(i*i, limit, i):     # Mark factors non-prime
                a[n] = False

def solve(A, B, K):
	ans = 0
	L = primes_sieve(B)
	a = [0] * (B - A + 1)
	for l in L:
		if A % l == 0:
			begin = A / l * l
		else:
			begin = A / l * l + l
		for n in xrange(begin, B+1, l):
			a[n-A] = a[n-A] + 1
	for (i, n) in enumerate(a):
		if n == K:
			ans = ans + 1
			# yield i + A
	return ans
	
T = input()

for t in xrange(T):
	g = raw_input()
	G = map(int, g.split())
	A = G[0]
	B = G[1]
	K = G[2]
	ans = solve(A, B, K)
	print "Case #{0}: {1}".format((t+1), ans)
