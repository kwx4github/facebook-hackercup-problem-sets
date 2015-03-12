[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-final-round-solutions/1080127472003153)

##### Fox Lochs

(Problem author: Jacob Plachta)

It can be shown that there exists a longest line segment that passes through at least 2 vertices of the union of the rectangles (in fact, this extends to the union of a set of arbitrary polygons). Each vertex of the union is either the vertex of a rectangle, or an intersection point of two rectangles. Therefore, the union has O(N<sup>2</sup>) vertices, and we must consider O(N<sup>4</sup>) different lines, finding the longest valid segment of each.

For each line, we can compute its (at most two) intersection points with each rectangle, which (if they exist) define a range of the line which is within the union. Note that calculating the intersection of a line with only axis-aligned line segments may be done with simpler code than general line intersection. Finally, we can do a line sweep over the line to find maximal ranges which lie within at least one rectangle. Sorting the line's intersection points with rectangles takes O(N log N) time, and so the total time complexity of this algorithm is O(N<sup>5</sup> log N).

Input: https://www.dropbox.com/s/4paspa7w1jxjbp4/fox_lochs.in?dl=0

Output: https://www.dropbox.com/s/ujkjm3mhl5blypf/fox_lochs.out?dl=0
