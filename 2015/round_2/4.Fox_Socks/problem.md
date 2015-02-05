[src](https://www.facebook.com/hackercup/problems.php?pid=1521672018093383&round=323882677799153)

##### Fox Socks

##### 45 points

Mr. Fox sure loves his socks! He stores his many indistinguishable socks in a set of **N** bins, which are arranged in a circle and numbered in clockwise order. For every 1 ≤ **i** < **N**, the next bin clockwise of bin **i** is bin **i**+1, and the next bin clockwise of bin **N** is bin 1. Initially, the **i** th bin contains **S<sub>i</sub>** socks.

Never being quite satisfied with his sock collection, Mr. Fox would like to perform **M** operations on it, one after another. Each operation **i** may be of one of the following 4 types, determined by the value of **O<sub>i</sub>**:

Given integers **A<sub>i</sub>**, **B<sub>i</sub>**, **C<sub>i</sub>**, and **D<sub>i</sub>**, add **C<sub>i</sub>** + 0 * **D<sub>i</sub>** socks to bin **A<sub>i</sub>**, add **C<sub>i</sub>** + 1* **D<sub>i</sub>** socks to the next bin clockwise of bin **A<sub>i</sub>**, add **C<sub>i</sub>** + 2* **D<sub>i</sub>** to the next bin clockwise of that one, and so on until this has been done for **B<sub>i</sub>** bins. Determine the total number of socks added in this process.

Given integers **A<sub>i</sub>**, **B<sub>i</sub>**, and **C<sub>i</sub>**, remove all of the socks from bin **A<sub>i</sub>** and then add **C<sub>i</sub>** socks to it. Do the same for the next bin clockwise of **A<sub>i</sub>**, and so on until this has been done for **B<sub>i</sub>** bins. Determine the sum of two values: the total number of socks removed in this process, and the total number of socks added in this process.

Given integers **A<sub>i</sub>** and **B<sub>i</sub>**, count the number of socks in bin **A<sub>i</sub>** (without removing them), the number of socks in the next bin clockwise of **A<sub>i</sub>**, and so on until the socks in **B<sub>i</sub>** bins have been counted. Determine the total number of socks counted in this process.

Given integers **A<sub>i</sub>** and **B<sub>i</sub>**, check if bin **A<sub>i</sub>** contains an odd number of socks. Do the same for the next bin clockwise of **A<sub>i</sub>**, and so on until this has been done for **B<sub>i</sub>** bins. Determine the total number of these bins that contain an odd number of socks.

Can you help Mr. Fox keep track of his socks? Note the value calculated during each of the **M** operations as they're performed, and then output the sum of all **M** of the values modulo 10<sup>9</sup>.

###### Input

Input begins with an integer **T**, the number of sock collections Mr. Fox has. For each sock collection, there are 7 lines containing the following space-separated integers:

1. **N M**
2. **S<sub>1</sub> S<sub>2</sub> X<sub>S</sub> Y<sub>S</sub> Z<sub>S</sub>**
3. **O<sub>1</sub> O<sub>2</sub> X<sub>O</sub> Y<sub>O</sub> Z<sub>O</sub>**
4. **A<sub>1</sub> A<sub>2</sub> X<sub>A</sub> Y<sub>A</sub> Z<sub>A</sub>**
5. **B<sub>1</sub> B<sub>2</sub> X<sub>B</sub> Y<sub>B</sub> Z<sub>B</sub>**
6. **C<sub>1</sub> C<sub>2</sub> X<sub>C</sub> Y<sub>C</sub> Z<sub>C</sub>**
7. **D<sub>1</sub> D<sub>2</sub> X<sub>D</sub> Y<sub>D</sub> Z<sub>D</sub>**

The first two elements of each sequence of integers (**S**, **O**, **A**, **B**, **C**, and **D**) are given, and the rest are computed with the following pseudorandom generators:

   **S<sub>i</sub>** = (**X<sub>S</sub>** * **S<sub>i-2</sub>** + **Y<sub>S</sub>** * **S<sub>i-1</sub>** + **Z<sub>S</sub>**) modulo 10<sup>9</sup>, for 3 ≤ i ≤ **N**
   **O<sub>i</sub>** = ((**X<sub>O</sub>** * **O<sub>i-2</sub>** + **Y<sub>O</sub>** * **O<sub>i-1</sub>** + **Z<sub>O</sub>**) modulo 4) + 1, for 3 ≤ i ≤ **M**
   **A<sub>i</sub>** = ((**X<sub>A</sub>** * **A<sub>i-2</sub>** + **Y<sub>A</sub>** * **A<sub>i-1</sub>** + **Z<sub>A</sub>**) modulo **N**) + 1, for 3 ≤ i ≤ **M**
   **B<sub>i</sub>** = ((**X<sub>B</sub>** * **B<sub>i-2</sub>** + **Y<sub>B</sub>** * **B<sub>i-1</sub>** + **Z<sub>B</sub>**) modulo **N**) + 1, for 3 ≤ i ≤ **M**
   **C<sub>i</sub>** = (**X<sub>C</sub>** * **C<sub>i-2</sub>** + **Y<sub>C</sub>** * **C<sub>i-1</sub>** + **Z<sub>C</sub>**) modulo 10<sup>9</sup>, for 3 ≤ i ≤ **M**
   **D<sub>i</sub>** = (**X<sub>D</sub>** * **D<sub>i-2</sub>** + **Y<sub>D</sub>** * **D<sub>i-1</sub>** + **Z<sub>D</sub>**) modulo 10<sup>9</sup>, for 3 ≤ i ≤ **M**

###### Output

For the ith sock collection, print a line containing "Case #i: " followed by the sum of all values calculated during each operation, modulo 109.

###### Constraints

1 ≤ **T** ≤ 20 <br>
2 ≤ **N** ≤ 1,000,000 <br>
2 ≤ **M** ≤ 1,000,000 <br>
0 ≤ **S<sub>i</sub>** &lt; 10<sup>9</sup> <br>
1 ≤ **O<sub>i</sub>** ≤ 4 <br>
1 ≤ **A<sub>i</sub>** ≤ **N** <br>
1 ≤ **B<sub>i</sub>** ≤ **N** <br>
0 ≤ **C<sub>i</sub>** &lt; 10<sup>9</sup> <br>
0 ≤ **D<sub>i</sub>** &lt; 10<sup>9</sup> <br>
0 ≤ **X<sub>S</sub>**, **X<sub>O</sub>**, **X<sub>A</sub>** **X<sub>B</sub>**, **X<sub>C</sub>**, **X<sub>D</sub>** &lt; 10<sup>9</sup> <br>
0 ≤ **Y<sub>S</sub>**, **Y<sub>O</sub>**, **Y<sub>A</sub>** **Y<sub>B</sub>**, **Y<sub>C</sub>**, **Y<sub>D</sub>** &lt; 10<sup>9</sup> <br>
0 ≤ **Z<sub>S</sub>**, **Z<sub>O</sub>**, **Z<sub>A</sub>** **Z<sub>B</sub>**, **Z<sub>C</sub>**, **Z<sub>D</sub>** &lt; 10<sup>9</sup> <br>

###### Explanation of Sample

The first collection has 5 bins that all have 0 socks. None of the operations involve any socks at all, so the answer is 0.

The second collection has 5 bins with 1, 2, 3, 4, and 5 socks. Mr. Fox performs the operations 1, 2, 3, and 4 in order. For each operation, A = 1, B = 5, C = 0, D = 0. He first adds 0 socks to the bins, then removes all 15 socks, then counts the 0 remaining socks, and then counts 0 odd bins, for a total of 15.

The third collection also has 5 bins with 1, 2, 3, 4, and 5 socks. Mr. Fox performs the same operations, but this time C and D take on the values 1, 2, 3, and 4 in that order. He adds 15 socks to the bins, then removes all 30 socks and adds 2 socks to each bin, then counts those 10 socks, and then counts 0 odd bins. The total is then 15 + 30 + 10 + 10 = 65.

Example input

```
5
5 4
0 0 0 0 0
1 2 0 1 0
1 1 0 0 0
1 1 0 0 0
0 0 0 0 0
0 0 0 0 0
5 4
1 2 0 1 1
1 2 0 1 0
1 1 0 0 0
5 5 0 1 4
0 0 0 0 0
0 0 0 0 0
5 4
1 2 0 1 1
1 2 0 1 0
1 1 0 0 0
5 5 0 1 4
1 2 0 1 1
1 2 0 1 1
5 2
1 2 0 1 1
4 4 0 0 0
1 1 0 0 0
5 5 0 0 0
0 0 0 0 0
0 0 0 0 0
100 100
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
```

Example output

```
Case #1: 0
Case #2: 15
Case #3: 65
Case #4: 6
Case #5: 505274484
```
