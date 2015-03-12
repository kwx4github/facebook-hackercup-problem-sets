[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-final-round-solutions/1080127472003153)

##### Fox Locks

(Problem author: Jacob Plachta)

Due to the constraint regarding opening each lock adjacent to the central hub at most once (and closing it immediately afterwards), we'll end up choosing some sequence of distinct canals to "use", each time increasing the hub's water level as much as possible.

When a canal c is "used", it can be observed that it's always optimal to first open some prefix of p of its locks (those between sections 1 and 2, between 2 and 3, and so on up to the one between p and p+1), for some 0 ≤ p < N<sub>c</sub>, and then open and close the lock between section 1 and the hub. If the hub has a current water level of h1, then its water level h<sub>1</sub>, then its water level h<sub>2</sub> after this sequence of lock toggles will be (h<sub>1</sub> + W<sub>c,1</sub> + W<sub>c,2</sub> + ... + W<sub>c,p+1</sub>) / (p + 2).

Due to the constraints on the input, there can only be at most 16 "large" canals (those with multiple sections). Conveniently, it can be shown that it's always optimal to use the remaining "small" canals (those with 1 section) in non-descending order of water level in their single section, possibly skipping some - this is basically due to the fact that there's only one choice of p for these canals. As such, we can use the overall approach of bitmask DP, calculating the maximum hub water level D<sub>b,i</sub> after the bitmask b of large canals have been used, and the first i small canals (after sorting) have been considered. In the worst case, there are 2<sup>16</sup> * 35 ≅ 2*10<sup>6</sup> states, with at most 17 transitions from each state. Therefore, when considering a new large canal to use from a given state, trying all possible values of p will be far too slow. A single optimal value of p can't be precomputed for each canal either, as it can vary depending on the current water level of the hub.

For each value of p for a given large canal, considering plotting h<sub>1</sub> (the current hub water level) against h<sub>2</sub> (the resulting hub water level), on the x- and y-axes of a graph respectively. Note that each p produces a line with a slope of 1 / (p + 2), and that the optimal value of p given a certain h<sub>1</sub> corresponds to the line with the largest y at x=h<sub>1</sub>. As such, we're interested in the upper hull of these lines. Each line will be part of the hull for a single contiguous range of x-coordinates (or never). Therefore, for each large canal, we can iterate over its lines and precompute a set of ranges of x-coordinates, with a corresponding optimal line equation for each range, and then binary search over them during the DP to find the best way to use a certain canal c given a certain current hub water level in just O(log N<sub>c</sub>) time.

Input: https://www.dropbox.com/s/xcoeysz8ct8kcav/fox_locks.in?dl=0

Output: https://www.dropbox.com/s/99hay5su5j69v4i/fox_locks.out?dl=0
