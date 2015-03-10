[src](https://www.facebook.com/hackercup/problems.php?pid=357702634416161&round=1556405007936780)

## Fox Focks

### 20 points 

Mr. Fox has opened up a fabulous Fock farm! A Fock is a cute little animal
which can have either red, green, or blue fur (these 3 possible colors can be
numbered 1, 2, and 3, respectively). Furthermore, a Fock's fur color can
change every second!

Mr. Fox owns a flock of **N** Focks, with the **i**th one initially having a
color of **C<sub>i</sub>**. Every second, if the **i**th Fock currently has a
color of **a**, it will switch to having a color of **b** for the next second
with probability **P<sub>i,a,b</sub>**%. All Focks change color
simultaneously.

After a very large amount of time has gone by, Mr. Fox will take a single
photo of all of his Focks to help advertise his farm. In particular, he picks
an integer **t** at uniform random from the range [10<sup>100</sup>,
10<sup>1000</sup>] and waits that many seconds. He's hoping that the photo
will make it look like his farm has a well-balanced mix of Fock colors — it'll
be no good if the photo ends up featuring a strict majority of a single color
(that is, strictly more than **N**/2 of the Focks having the same color).
What's the probability of this occurring?

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 50,000  
1 ≤ **C<sub>i</sub>** ≤ 3 for all **i**  
0 ≤ **P<sub>i,a,b</sub>** ≤ 100 for all **i**, **a** and **b**  
**P<sub>i,a,1</sub>** \+ **P<sub>i,a,2</sub>** \+ **P<sub>i,a,3</sub>** = 100 for all **i** and **a**  

### Input

Input begins with an integer **T**, the number of Fock farms Mr. Fox has. For
each farm, there is first a line containing the integer **N**. Then, for each
Fock **i**, 4 lines follow. The first of these lines contains the integer
**C<sub>i</sub>**. The next three lines contain three space-separated integers
each, with the **b**th integer on the **a**th line being
**P<sub>i,a,b</sub>**.

### Output

For the **i**th farm, print a line containing "Case #**i**: " followed by the
probability that the **i**th picture contains a strict majority of some color
of Fock, rounded to 6 decimal places.

Absolute errors of up to 2e-6 will be ignored.

### Explanation of Sample

In the first case, the first Fock never changes color, so it'll still have
color 1 in the photo. The second Fock is likely to have color 2 for a while,
but by the time the photo is taken, it'll certainly have color 3. The third
Fock will have either color 2 or 3 in the photo, with equal probability.
Therefore, the photo will have a 50% chance of having a strict majority of
color 3, and a 50% chance of no strict majority.

#### Example input

```
5
3
1
100 0 0
0 100 0
0 0 100
2
100 0 0
0 99 1
0 0 100
2
100 0 0
0 50 50
0 50 50
3
1
100 0 0
0 100 0
0 0 100
2
100 0 0
0 100 0
0 0 100
3
100 0 0
0 100 0
0 0 100
3
1
100 0 0
0 100 0
0 0 100
2
100 0 0
0 100 0
0 0 100
2
100 0 0
0 100 0
0 0 100
3
1
34 33 33
33 34 33
33 33 34
2
34 33 33
33 34 33
33 33 34
3
34 33 33
33 34 33
33 33 34
3
1
10 20 70
30 30 40
50 20 30
2
30 10 60
90 5 5
15 15 70
3
98 1 1
98 1 1
98 1 1

```

#### Example output

```
Case #1: 0.500000
Case #2: 0.000000
Case #3: 1.000000
Case #4: 0.777778
Case #5: 0.812282

```
