[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-2-solutions/1051224511560116)

##### Lazy Sort

(Problem Author: Anonymous)

The important observation in this problem is that it becomes greedy after the first choice is made. After choosing to move the top or bottom page first, our future moves are either forced or don't matter.

Observe that, at any point, the partially completed final stack must always contain a contiguous sorted set of pages. If we had page 1 and page 3 touching in the final stack, there's no way we could get page 2 in between. Let's call the minimum and maximum student IDs in the partial final stack A and B respectively. The only pages we can add to this stack are A-1 or B+1. If only one of these pages is available on the top or bottom of the current unsorted pile, we must take it. If both pages are available, it doesn't matter which one we take. We can take them in either order.

That means that the only important choice is which page we grab initially, and we can of course just try both possibilities and greedily simulate the rest of the way for each. This gives us a solution that takes O(N) time and memory.

Input: https://www.dropbox.com/s/d604x5spfzk2vz4/lazy.in?dl=0

Output: http://pastebin.com/nRdy83Wi
