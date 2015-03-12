[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-final-round-solutions/1080127472003153)

##### Fox Blocks

(Problem author: Jacob Plachta)

When querying the range of indices a..b, consider the following algorithm:

Find the smallest index i such that a < i ≤ b and H<sub>i</sub> > H<sub>a</sub>, if any. If such an index is found, then each column a..(i-1) must have a water level of H<sub>a</sub> inches, so these columns in total hold H<sub>a</sub> * (i - a) - (H<sub>a</sub> + H<sub>a+1</sub> + ... + H<sub>i-1</sub>) square inches of water. Then, repeat this process from index i instead of a (find the first index j such that i < j ≤ b and H<sub>j</sub> > H<sub>i</sub>, and so on), until the leftmost column x with maximum height in the range of indices a..b has been found (and all of the water to its left has been totaled up).

The above strategy can then be repeated starting at index b and going to the left, up to the rightmost column y with maximum height. Finally, the water level of columns x..y must be H<sub>x</sub> inches, so they hold H<sub>x</sub> * (y - x + 1) - (H<sub>x</sub> + H<sub>x+1</sub> + ... + H<sub>y</sub>) square inches of water.

The algorithm described above clearly takes O(N) time per query naively. To attempt to speed it up, we can precompute the prefix sums of H (to query sums of intervals of H values in O(1) time). Additionally, for each index, we can precompute the next key index to the right and the total water stored between them (as described above), by iterating over the array right-to-left and keeping a stack of indices sorted by column height. Similarly, we can precompute this going to the right, for the second part of the algorithm. On random data, this may save time on searching for the next index at each iteration of the algorithm - however, it will still take O(N) time per query in the worst case.

Finally, to improve the time complexity to O(log N) per query, we can store not only the next index (in each direction), but also the one 2 steps ahead, 4 steps ahead, 8 steps ahead, and so on. For each query, we can then repeatedly skip ahead as much as possible from a without overshooting b (and vice versa), which will take at most O(log N) skips.

Input: https://www.dropbox.com/s/ievk6o4z51ea557/fox_blocks.in?dl=0
Output: https://www.dropbox.com/s/n2vyjvxj85hc823/fox_blocks.out?dl=0
