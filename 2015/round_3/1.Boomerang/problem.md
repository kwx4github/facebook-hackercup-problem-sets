[src](https://www.facebook.com/hackercup/problems.php?pid=642233395880928&round=890884524269795)

## Boomerang

### 10 points 

Today you've found yourself standing on an infinite 2D plane at coordinates
(**X<sub>0</sub>**, **Y<sub>0</sub>**). There are also **N** targets on this
plane, with the **i**th one at coordinates (**X<sub>i</sub>**,
**Y<sub>i</sub>**).

You have a boomerang which you can throw in a straight line in any direction
from your initial location. After you throw it, you may instantaneously run to
any location on the plane. After the boomerang has travelled a distance of
exactly **D** along its initial trajectory, it will return directly to you —
that is, to your chosen final location. Note that you cannot move around once
the boomerang has started its return trip — its path will always consist of 2
line segments (the first of which has a length of exactly **D**). The
boomerang and the targets have infinitesimal size.

Let **A** be the number of targets which your boomerang hits (directly passes
through) during the first segment of its flight, and **B** be the number of
targets which it hits during the second segment. Your throw is then awarded a
score of **A** * **B**. What's the maximum score you can achieve? Note that,
if there is a target at the exact location at which the two segments meet (at
a distance of **D** from your initial location), then it counts towards both
**A** and **B**!

### Input

Input begins with an integer **T**, the number of planes. For each plane,
there is first a line containing the space-separated integers
**X<sub>0</sub>** and **Y<sub>0</sub>**. The next line contains the integer
**D**, and the one after contains the integer **N**. Then, **N** lines follow,
the **i**th of which contains the space-separated integers **X<sub>i</sub>**
and **Y<sub>i</sub>**.

### Output

For the **i**th plane, print a line containing "Case #**i**: " followed by the
maximum score you can achieve.

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 3,000  
1 ≤ **D** ≤ 100  
-100 ≤ **X<sub>i</sub>**, **Y<sub>i</sub>** ≤ 100, for 0 ≤ **i** ≤ **N**   

All coordinates are pairwise distinct. The following restrictions are also
guaranteed to hold for the input given:

For any three targets at distinct points **a**, **b**, and **c**, it is
guaranteed that **c** is either closer than 10<sup>-13</sup> away from the
infinite line between **a** and **b** (and is considered to be on the line),
or is further than 10<sup>-6</sup> away (and is considered to not be on the
line).

Let **p** be any point at which the boomerang may change direction after
hitting a target. For any two targets at distinct points **a** and **b**, it
is guaranteed that **p** is either closer than 10<sup>-13</sup> away from the
infinite line between **a** and **b** (and is considered to be on the line),
or is further than 10<sup>-6</sup> away (and is considered to not be on the
line).

### Explanation of Sample

On the first plane, one optimal strategy is to throw the boomerang in the
direction of the positive x-axis (that is, to (6, 0)), and then run to (0, 0).
It will hit targets 2 and 3 on the first segment of its flight, and all 3
targets on the second segment, for a score of 2*3=6.

#### Example input

```
5
2 0
2
3
1 0
3 0
4 0
2 0
1
3
1 0
3 0
4 0
5 5
10
4
0 0
10 0
10 10
0 10
0 0
2
6
-1 -1
0 8
0 9
0 10
10 1
10 2
0 0
10
6
-1 -1
0 8
0 9
0 10
10 1
10 2
```

#### Example output

```
Case #1: 6
Case #2: 3
Case #3: 2
Case #4: 1
Case #5: 9
```
