[src](https://www.facebook.com/hackercup/problems.php?pid=602966206500471&round=890884524269795)

## Fox Rocks

### 40 points 

Mr. Fox sure loves his rocks! In fact, when he's not in a hurry, he often
looks at the rocks lying around near him to decide where to wander in his
forest.

Mr. Fox lives in a forest with **N** clearings, numbered from 0 to **N**-1,
with **P** one-way trails initially running amongst them. The **i**th trail
runs from clearing **A<sub>i</sub>** to a different clearing
**B<sub>i</sub>**, and is littered with **R<sub>i</sub>** rocks. No two
clearings are connected by multiple trails running in the same direction,
though they could be connected by 2 trails running in opposite directions.
Additionally, an interesting property of this forest is that a trail from
clearing **a** to clearing **b** may only exist if 0 ≤ floor(**b**/4) -
floor(**a**/4) ≤ 1.

To entertain himself over a period of **D** days, Mr. Fox will cause one event
to occur on each day. The **i**th event may be one of 3 types, determined by
the value of **E<sub>i</sub>**:

  1. Given 3 integers **X<sub>i</sub>**, **Y<sub>i</sub>**, and **Z<sub>i</sub>**, Mr. Fox will create a new trail from clearing **X<sub>i</sub>** to a different clearing **Y<sub>i</sub>**, and drop **Z<sub>i</sub>** rocks onto it. It's guaranteed that no trail from **X<sub>i</sub>** to **Y<sub>i</sub>** will exist at the start of the **i**th day, and that 0 ≤ floor(**Y<sub>i</sub>**/4) - floor(**X<sub>i</sub>**/4) ≤ 1 will hold. 

  2. Given 2 distinct integers **X<sub>i</sub>** and **Y<sub>i</sub>**, Mr. Fox will completely destroy the trail from clearing **X<sub>i</sub>** to clearing **Y<sub>i</sub>** (which is guaranteed to exist at the start of the **i**th day). Note that, once such a trail is destroyed, a new trail from **X<sub>i</sub>** to **Y<sub>i</sub>** may be created in the future. 

  3. Given 2 distinct integers **X<sub>i</sub>** and **Y<sub>i</sub>**, Mr. Fox will take a "random stroll" starting at clearing **X<sub>i</sub>**, and would like to determine the probability that he'll visit clearing **Y<sub>i</sub>** at least once during it. 

A "random stroll" consists of repeating the following process potentially
infinitely: If Mr. Fox is currently in some clearing **c**, and there are no
outgoing trails from **c**, then the stroll ends immediately. Otherwise, he'll
consider all of the rocks on all of the outgoing trails from **c**, choose one
of these rocks uniformly at random, follow the trail on which that rock lies
to its destination clearing (without removing any rocks), and repeat the
process from his new clearing.

For each event of type 3, output the requested probability.

### Input

Input begins with an integer **T**, the number of test cases. For each test
case, there is first a line containing the space-separated integers **N**,
**P**, and **D**.

Then, **P** lines follow, the **i**th of which contains the space-separated
integers **A<sub>i</sub>**, **B<sub>i</sub>**, and **R<sub>i</sub>**.

Then, **D** lines follow, the **i**th of which contains the space-separated
integers **E<sub>i</sub>**, **X<sub>i</sub>**, and **Y<sub>i</sub>**. If
**E<sub>i</sub>** = 1, this line additionally contains the integer
**Z<sub>i</sub>**.

### Output

For the **i**th test case, print a line containing "Case #**i**: " followed by
the computed probabilities for each stroll that Mr. Fox takes. These
probabilities should be space-separated, and rounded to 6 decimal places.

Absolute errors of up to 2 * 10<sup>-6</sup> will be ignored.

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 50,000  
0 ≤ **P** ≤ 100,000  
1 ≤ **D** ≤ 20,000  
0 ≤ **A<sub>i</sub>**, **B<sub>i</sub>**, **X<sub>i</sub>**, **Y<sub>i</sub>**
< **N**  
1 ≤ **E<sub>i</sub>** ≤ 3  
1 ≤ **R<sub>i</sub>**, **Z<sub>i</sub>** ≤ 5  

### Explanation of Sample

In the first test case, Mr. Fox does multiple strolls from clearing 0 while
looking out for clearing 3. His first stroll has probability 1 as he must
always end up at clearing 3. His second stroll has probability 1/2 as there's
a 50% chance he gets stuck in clearing 4. His third stroll has probability 2/3
as he now only goes to clearing 4 1/3 of the time. His fourth stroll has
probability 1/3 as he gets stuck in clearing 4 1/3 of the time, and in
clearing 1 1/3 of the time.

#### Example input

```
5
8 0 10
1 0 1 1
1 1 2 1
1 2 3 1
3 0 3
1 0 4 1
3 0 3
1 0 3 1
3 0 3
2 1 2
3 0 3
4 4 10
0 1 1
1 0 1
1 2 1
0 3 1
3 0 2
2 0 1
1 0 1 2
3 0 2
2 0 1
1 0 1 3
3 0 2
2 0 1
1 0 1 4
3 0 2
8 7 5
0 1 1
1 2 1
2 3 1
0 4 1
1 5 1
2 6 1
3 7 1
3 0 5
3 0 7
1 3 0 1
3 0 5
3 0 7
8 4 10
4 5 1
5 6 1
6 7 1
7 4 1
1 0 4 1
1 0 1 4
3 0 7
1 1 6 1
3 0 7
1 1 2 1
1 2 3 1
3 0 7
1 2 0 1
3 0 7
12 5 7
0 4 1
4 8 1
0 1 1
1 2 1
2 3 1
3 0 8
1 1 4 1
3 0 8
1 2 4 1
3 0 8
1 3 4 1
3 0 8

```

#### Example output

```
Case #1: 1.000000 0.500000 0.666667 0.333333
Case #2: 0.333333 0.500000 0.600000 0.666667
Case #3: 0.250000 0.125000 0.266667 0.066667
Case #4: 0.200000 1.000000 0.600000 0.750000
Case #5: 0.500000 0.750000 0.875000 1.000000

```
