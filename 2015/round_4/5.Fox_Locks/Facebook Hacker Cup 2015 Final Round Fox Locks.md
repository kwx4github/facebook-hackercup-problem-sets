[src](https://www.facebook.com/hackercup/problems.php?pid=330876530451188&round=1556405007936780)

## Fox Locks

### 25 points 

Mr. Fox has just won the lottery! As a result, he's treated himself to some
gifts — a few socks, a few rocks, a few blocks... oh, and the entire Panama
canal system.

The system has **K** canals, the **i**th of which consists of a line of
**N<sub>i</sub>** equally-sized sections. The **j**th section of the **i**th
canal initially contains **W<sub>i,j</sub>** gallons of water. There's also an
initially closed lock (a retractable wall) between each pair of adjacent
sections (that is, between sections 1 and 2, sections 2 and 3, and so on). As
such, there are **N<sub>i</sub>**-1 such locks in the **i**th canal.

The canals are all linked to each other by an additional central hub section
(also of equal size to the other sections), which initially contains **H**
gallons of water. This section is adjacent to the 1st section of each of the
canals, separated by a special initially closed lock. As such, there are **K**
such central locks.

Mr. Fox is relaxing in a yacht (oh, right, he also bought himself one of
those) floating in the central hub section. Just for fun, he'd like to raise
the water level in this section as high as possible. To do so, he may give any
(potentially empty) sequence of commands to his Panama employees, one per
minute. Each command consists of selecting a single lock anywhere in the canal
system and toggling it from being closed to being open (or vice versa). In the
following minute, the water will level out (as water tends to do) by flowing
through open locks such that, for any pair of adjacent sections which are
separated by an open lock, they will end up with equal amounts of water. Mr.
Fox does need to obey the Panama canal system's safety regulations, however,
which impose one restriction on his commands: whenever one of the **K**
central locks adjacent to the central hub section is opened, it must be closed
a minute later and then never re-opened.

Mr. Fox loves watching water flow through his locks, especially when it allows
his yacht to magically rise up. Wheeeee! By commanding his employees
carefully, how much water can Mr. Fox get into the central hub section?

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **K** ≤ 50  
0 ≤ **H** ≤ 10^9  
1 ≤ **N<sub>i</sub>** ≤ 100,000  
**N<sub>i</sub>** > 1 implies **N<sub>i+1</sub>** ≥ 2***N<sub>i</sub>** (for 1 ≤ **i** < **K**)   
0 ≤ **W<sub>i,j</sub>** ≤ 10^9  

### Input

Input begins with an integer **T**, the number of canal systems Mr. Fox owns.
For each system, there is first a line containing the space-separated integers
**K** and **H**. Then, **K** lines follow, the **i**th of which contains the
integer **N<sub>i</sub>** followed by the space-separated integers
**W<sub>i,1</sub>** ... **W<sub>i,N<sub>i</sub></sub>**.

### Output

For the **i**th canal system, print a line containing "Case #**i**: " followed
by the maximum amount of water (in gallons) that can end up in the central hub
section, rounded to 6 decimal places.

Absolute errors of up to 5e-6 will be ignored.

### Explanation of Sample

In the first case, the optimal solution is to first open and close the lock
between the central hub and canal 1. This leaves the central hub with 0.5
gallons of water. Then, opening the lock between the central hub and canal 2
leaves the central hub with 1.25 gallons of water.

#### Example input

```
5
2 0
1 1
1 2
2 5
1 10
1 3
2 6
3 10 10 10
6 8 8 8 8 8 8
3 0
1 5
2 8 6
4 2 6 12 20
5 10
1 123
1 103
1 120
2 111 112
5 120 121 125 123 124

```

#### Example output

```
Case #1: 1.250000
Case #2: 7.500000
Case #3: 9.428571
Case #4: 9.100000
Case #5: 121.465278

```
