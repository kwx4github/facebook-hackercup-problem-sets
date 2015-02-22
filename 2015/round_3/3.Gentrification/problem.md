[src](https://www.facebook.com/hackercup/problems.php?pid=847639175277938&round=890884524269795)

## Gentrification

### 35 points 

The residents of Townsville have made it clear to the mayor that they're
greatly concerned about gentrification, a process by which wealthy people move
into the city in large numbers, displacing the people who currently live
there. The mayor of Townsville knows a thing or two about this, and she would
like to put the people's minds at ease by determining the worst-case scenario.

Townsville is made up of **N** neighbourhoods, with **M** one-way roads
running between them. The **i**th road runs from neighbourhood
**A<sub>i</sub>** to neighbourhood **B<sub>i</sub>**. A swarm of rich migrants
will move to the city all at once, immediately gentrifying any neighbourhood
they decide to move into.

The mayor knows the following facts about these new affluent residents: First,
they like to visit other gentrified neighbourhoods. If there's a way of
getting from their home neighbourhood to another gentrified neighbourhood,
they will surely go visit. Second, they never walk anywhere; they only drive.
Consequently, they'll get very angry if they end up in some neighbourhood with
no way to drive back home.

Putting these facts together, it means that if rich migrants move into and
gentrify any two neighbourhoods **u** and **v**, then it must be the case that
there is a series of roads connecting **u** to **v** if and only if there is a
series of roads connecting **v** to **u**.

Given this self-imposed constraint, and the layout of the roads in Townsville,
what is the maximum number of neighbourhoods that can be gentrified?

### Input

Input begins with an integer **T**, the number of test cases. For each test
case, there is first a line containing the space-separated integers **N** and
**M**.

Then, **M** lines follow, the **i**th of which contains the space-separated
integers **A<sub>i</sub>** and **B<sub>i</sub>**.

### Output

For the **i**th test case, print a line containing "Case #**i**: " followed by
the maximum possible number of gentrified neighbourhoods.

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 500  
1 ≤ **M** ≤ 20,000  
0 ≤ **A<sub>i</sub>**, **B<sub>i</sub>** < **N** for all 1 ≤ **i** ≤ **N**  
**A<sub>i</sub>** ≠ **B<sub>i</sub>** for all 1 ≤ **i** ≤ **N**   

### Explanation of Sample

In the first test case, you can get from any neighbourhood to any other
neighbourhood, so they can all be gentrified.

In the second test case, any single neighbourhood can be gentrified, but
that's it. If any two neighbourhoods are gentrified, there would be a path
from one to the other, but no path back.

#### Example input

```
5
4 4
0 1
1 2
2 3
3 0
4 3
0 1
1 2
2 3
6 6
0 1
1 0
2 3
3 2
4 5
5 4
6 8
0 1
1 0
2 3
3 2
4 5
5 4
0 2
1 4
4 4
0 1
0 2
1 3
2 3
```

#### Example output

```
Case #1: 4
Case #2: 1
Case #3: 6
Case #4: 4
Case #5: 2
```
