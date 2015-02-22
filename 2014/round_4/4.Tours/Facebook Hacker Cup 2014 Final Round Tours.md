[src](https://www.facebook.com/hackercup/problems.php?pid=638015132901061&round=180228228840273)

## Tours

### 37 points 

Facebook HQ -- a mysterious place full of magical code and trade secrets. If
outsiders were ever to breach the walls of the compound, which are protected
by a legion of security foxes, the entire company could well be brought to its
knees!

Hmmm. Actually, campus tours are given regularly.

The compound consists of **N** buildings, with **M** walkways running amongst
them. The _i_th walkway connects buildings **A<sub>i</sub>** and
**B<sub>i</sub>**, (**A<sub>i</sub>** != **B<sub>i</sub>**) and no two
buildings are directly connected by more than one walkway. There are no other
ways to move from building to building.

Over a period of **D** days, some events will occur at Facebook HQ. One of two
types of events will happen on the _i_th day, indicated by a character
**E<sub>i</sub>**. If **E<sub>i</sub>** = 'T', then a tour will take place.
Otherwise, **E<sub>i</sub>** = 'S', and a security sweep of one building will
take place.

If a tour is given on the _i_th day, visitors will plan to enter the compound
at building **X<sub>i</sub>**, and leave from building **Y<sub>i</sub>**
(**X<sub>i</sub>** != **Y<sub>i</sub>**). If it turns out that these two
buildings are not actually connected by any sequence of walkways, then the
tour will be cancelled, and the unfortunate visitors will be given Facebook
T-shirts on the way out. Otherwise, a large number of people will be led from
building **X<sub>i</sub>** to building **Y<sub>i</sub>** along various routes.
No route will involve travelling along the same walkway multiple times (even
in different directions), but a route might revisit the same building
repeatedly, including buildings **X<sub>i</sub>** and **Y<sub>i</sub>**. Along
the way some visitors will inevitably get themselves "lost", and fail to
rejoin the tour group. In total, **O<sub>i</sub>** new outsiders will be left
behind in each building which could possibly be part of any valid tour route
from building **X<sub>i</sub>** and building **Y<sub>i</sub>**. Good thing
they'll no doubt have brought cameras to amuse themselves with while they wait
to be found.

On the other hand, if a security sweep is conducted on the _i_th day, then the
security foxes will carefully search building **Z<sub>i</sub>** for any
trespassers remaining from previous tours, and kindly escort them out.

Since Facebook likes data, you've been hired to record how many outsiders were
found in each sweep.

### Input

Input begins with an integer **T**, the number of test cases. Each test case
begins with a line containing three integers, **N**, **M**, and **D**. The
next **M** lines contain two integers **A<sub>i</sub>** and **B<sub>i</sub>**.
The next **D** lines contain a character **E<sub>i</sub>**, followed by either
three integers **X<sub>i</sub>**, **Y<sub>i</sub>**, **O<sub>i</sub>** if
**E<sub>i</sub>** = 'T', or a single integer **Z<sub>i</sub>** if
**E<sub>i</sub>** = 'S'.

### Output

For each test case _i_, output "Case #i: " followed by the total number of
visitors the foxes escort off the campus. Since this number may be quite
large, output it modulo 1,000,000,007.

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 10<sup>5</sup>  
1 ≤ **M** ≤ 10<sup>6</sup>  
1 ≤ **D** ≤ 10<sup>6</sup>  
1 ≤ **O<sub>i</sub>** ≤ 1,000  
1 ≤ **A<sub>i</sub>**, **B<sub>i</sub>**, **X<sub>i</sub>**,
**Y<sub>i</sub>**, **Z<sub>i</sub>** ≤ **N**  

### Explanation of Sample

In the first sample case:

On the first day, a tour is given from building 1 to building 2. The only
valid route consists of simply crossing the walkway between these two
buildings. As such, by the end of the day, 5 outsiders are left hiding in each
of buildings 1 and 2.

On the second day, the tour cannot take place.

On the third and fourth days, security sweeps of buildings 2 and 6 are carried
out, with 5 and 0 outsiders found respectively.

On the fifth day, a tour is given from building 2 to building 3. There are
exactly three valid routes (2, 3), (2, 3, 4, 5, 3), (2, 3, 5, 4, 3). As such,
one new outsider remains behind in each of buildings 2, 3, 4, and 5.

On the sixth day, the valid tour routes are (5, 3) and (5, 4, 3), so 14 new
outsiders take up residence in each of buildings 3, 4, and 5.

Finally, security sweeps of buildings 1, 2, and 4 are conducted evicting 5, 1,
and 15 people respectively, for a grand total of 26.

#### Example input

```
5
6 5 9
1 2
2 3
3 4
4 5
5 3
T 1 2 5
T 5 6 1000
S 2
S 6
T 2 3 1
T 5 3 14
S 1
S 2
S 4
2 1 3
1 2
T 1 2 10
S 1
S 2
3 2 4
1 2
2 3
T 1 3 10
T 2 3 5
S 1
S 3
3 3 4
1 2
2 3
3 1
T 1 3 10
T 2 3 5
S 1
S 3
3 1 4
1 2
T 1 2 10
T 1 3 10
S 1
S 3

```

#### Example output

```
Case #1: 26
Case #2: 20
Case #3: 25
Case #4: 30
Case #5: 10

```
