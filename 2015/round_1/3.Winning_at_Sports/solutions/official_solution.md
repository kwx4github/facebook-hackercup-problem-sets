[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-1-solutions/1047761065239794)

##### Winning at Sports

This problem has a fairly standard dynamic programming formulation:

Let f(u, t, U, T) be the number of ways to achieve a stress-free victory when we currently have u points, the opponent has t points, and the final score will be U-T. The answer we're looking for is then f(0, 0, U, T). We can define f recursively as follows, assuming u < U and t < T:
- f(U, T, U, T) = 1 (we're done!)
- f(u, T, U, T) = 1 if u > T (all that's left is for us to finish scoring)
- f(u, T, U, T) = 0 otherwise (this victory is not stress-free)
- f(U, t, U, T) = 1 (all that's left is for them to finish scoring)
- f(u, t, U, T) = 0 if u > 0 and u ≤ t (this victory is not stress-free)
- f(u, t, U, T) = f(u+1, t, U, T) + f(u, t+1, U, T) otherwise (either team can score next)

Similarly, let g(u, t, U, T) be the number of ways to achieve a stressful victory:

- g(U, T, U, T) = 1 (we're done!)
- g(u, T, U, T) = 1 (all that's left is for us to finish scoring)
- g(U, t, U, T) = 0 (this victory is not stressful)
- g(u, t, U, T) = 0 if u > t (this victory is not stressful)
- g(u, t, U, T) = g(u+1, t, U, T) + g(u, t+1, U, T) otherwise (either team can score next)

Obviously the latter two parameters don't change, so we just need O(U * T) memory to memoize the results, and the time complexity will also be O(U * T).

Input: http://pastebin.com/zbf0GYiD

Output: http://pastebin.com/cQutFFcq
