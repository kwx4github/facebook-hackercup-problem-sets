[src](https://www.facebook.com/hackercup/problems.php?pid=354218218104277&round=1556405007936780)

## Fox Lochs

### 15 points 

Mr. Fox is going on a trip to Scotland to witness its many beautiful lochs!
He's heard that skimboarding is a fun pastime, somewhat similar to surfing,
and he'd like to give it a try while he's there.

He soon finds himself on a flat beach by the side of a loch. The beach can be
represented by an infinite 2D plane, with **N** axis-aligned rectangular pools
of shallow water on it. The **i**th pool has a pair of opposite corners at
coordinates (**x<sub>1</sub>**, **y<sub>1</sub>**) and (**x<sub>2</sub>**,
**y<sub>2</sub>**). All of the pools can arbitrarily overlap with one another,
the result being that there's shallow water everywhere within the union of the
pools' rectangles (including right on its edges), and no water anywhere else
(Mr. Fox isn't brave enough to venture into the loch itself yet!).

Mr. Fox would like to get a running start and then launch himself across the
water at some location, skimboarding across the pools in a straight line until
he hits a point with no water. In other words, his skimboarding debut will
consist of a line segment contained within the union of the pools' rectangles
(inclusive of borders). What's the maximum length this line segment can have?

### Input

Input begins with an integer **T**, the number of places Mr. Fox goes
skimboarding. For each place, there is first a line containing the integer
**N**. Then **N** lines follow, the **i**th of which contains the space-
separated integers **x<sub>1</sub>**, **y<sub>1</sub>**, **x<sub>2</sub>**,
and **y<sub>2</sub>**.

### Output

For the **i**th place, print a line containing "Case #**i**: " followed by the
length of longest possible skimboarding path rounded to 6 decimal places.

Absolute errors of up to 2e-6 will be ignored.

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 20  
-1,000,000 ≤ **x<sub>1</sub>** < **x<sub>2</sub>** ≤ 1,000,000   
-1,000,000 ≤ **y<sub>1</sub>** < **y<sub>2</sub>** ≤ 1,000,000   

### Explanation of Sample

In the first case, (2, 0) to (5, 5) is an optimal path.

#### Example input

```
5
2
2 0 4 3
3 2 5 5
1
0 0 3 4
3
0 0 3 2
0 1 3 3
0 2 3 4
3
0 0 1 1
2 0 4 2
5 0 8 3
3
-3 -3 3 3
-2 -2 2 2
-1 -1 1 1

```

#### Example output

```
Case #1: 5.830952
Case #2: 5.000000
Case #3: 5.000000
Case #4: 4.242641
Case #5: 8.485281

```
