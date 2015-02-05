[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-1-solutions/1047761065239794)

##### Homework

If we precompute the primacity of each number, then answering test cases just takes a sweep over the precomputed results.

To compute the primacity, one option is to used a modified Sieve of Eratosthenes (http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes). In the normal sieve we iterate upwards and whenever we find a prime number we cross off all multiples of it from our list of primes. Rather than crossing off a multiple, we can add 1 to a counter that keeps track of its primacity.

For example, 2 is prime, so we add 1 to the primacity of 4, 6, 8, 10, 12, etc. 3 is the next prime, so we add 1 to the primacity of 3, 6, 9, 12, 15, etc.

The time complexity is the same as the standard sieve, O(N log log N) for the integers 1 to N.

Input: http://pastebin.com/tUftWCVR

Output: http://pastebin.com/60yhTXsR

