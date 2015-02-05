[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-qualification-round-solutions/1043281905687710)

##### Laser Maze

This problem involves doing a breadth-first search (BFS) with a slightly augmented state. Our state needs to capture not only our location, but also the directions that the turrets are facing. The number of turrets may be arbitrarily large, so we can't specify the facing of each turret individually. A first observation is that the only information we need is the number of steps we've taken so far. With that, we can determine each turret's facing.

But we can do better. Since each turret rotates through 4 different positions, after every 4 steps the turrets will be facing the same direction they were originally facing. Observe that all we need to keep track of is the number of steps taken modulo 4. After 13 steps, the turrets will be facing the same direction they were after 1, 5, or 9 steps. The problem is then to run BFS on a state of (current row, current column, number of steps modulo 4). This state has size O(N^2), where N is the size of the largest side of the maze.The other piece of the problem to consider is how to determine which cells can be moved into at every step. Naively, at every step we can iterate over each turret and determine which cells it's firing into. This will take O(N^2) time, leading to an overall time complexity of O(N^4). 

As this is a qualification problem, O(N^4) is good enough to pass the relatively small bounds. However, we can do better by precomputing which cells will be dangerous. For all 4 possible turret orientations, we can do an O(N^2) precomputation and store the dangerous cells. We can now determine whether or not we can enter a certain cell in O(1) time when we're running the search, leading to a total time complexity of O(N^2).

Input: http://pastebin.com/E0KUyu3W

Output: http://pastebin.com/ZCSsDGPw
