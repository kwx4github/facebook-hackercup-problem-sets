[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-qualification-round-solutions/1043281905687710)

##### New Year's Resolution

This is a variant of the NP-complete subset sum problem (http://en.wikipedia.org/wiki/Subset_sum_problem). Being NP-complete, it makes sense to expect exponential time complexity. Luckily, the upper bound on N is only 20.

One O(N * 2^N) approach is to iterate over all bitstrings of length N, and for each, add up the elements the correspond to the bits that are set to 1. An O(2^N) solution is to use recursion/backtracking and at each step choose whether or not to select a given element.

While not required (and perhaps not recommended) for the bounds in this problem, a dynamic programming solution also exists. Let F(p, c, f, n) be a function that returns true if it's possible to get exactly p units of protein, c units of carbohydrates, and f units of fat using only the foods with indices [n, N-1]. F(G_p, G_c, G_f, 0) will then be the answer we're looking for.

F(p, c, f, n) can be defined recursively as follows:
F(0, 0, 0, n) = true (if we've met our requirements, we're done!)
F(p, c, f, N) = false (if there are no foods left, we can't meet our requirements)
F(p, c, f, n) = F(p - P_n, c - C_n, f - F_n, n+1) || F(p, c, f, n+1) (we can choose to either eat the nth food, or not; if either of these choices satisfies our requirements, then we succeed)
This solution has a pseudo-polynomial time complexity of O(G_p * G_c * G_f * N), and is useful whenever N is large and the requirements are relatively small. Of course, it also carries a hefty memory complexity.

Input: http://pastebin.com/LpjBdwi3

Output: http://pastebin.com/KN11Vvxe

