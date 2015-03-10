[src](https://www.facebook.com/hackercup/problems.php?pid=1548507912063902&round=1556405007936780)

## Fox Blocks

### 15 points 

Today, Mr. Fox is taking it easy by playing with some blocks in a 2D world.
Each block is an inch-by-inch square, and there are **N** stacks of blocks in
a row, with the **i**th stack having **H<sub>i</sub>** blocks. For example, if
**N**=6 and **H**={3, 1, 5, 4, 1, 6}, then the collection of blocks looks like
this (where an "X" denotes a block):

    
    
    .....X
    ..X..X
    ..XX.X
    X.XX.X
    X.XX.X
    XXXXXX
    

Ever curious, Mr. Fox would like to answer **Q** questions about his blocks
(without actually modifying them), the **i**th one being as follows:

"If I were to consider only the stacks from **A<sub>i</sub>** to
**B<sub>i</sub>** inclusive, getting rid of all of the other blocks, how many
square inches of water would my block structure be able to hold?"

As one might imagine, a given square inch can hold water if it doesn't contain
a block itself, but there is a block both somewhere to its left and somewhere
to its right at the same height. For example, if you were to take
**A<sub>i</sub>**=2 and **B<sub>i</sub>**=6, you would be left with the
following block structure to consider (where an "*" denotes an inch-by-inch
square which can hold water):

    
    
    ....X
    .X**X
    .XX*X
    .XX*X
    .XX*X
    XXXXX
    

### Constraints

1 ≤ **T** ≤ 20  
1 ≤ **N** ≤ 300,000  
1 ≤ **Q** ≤ 300,000  
1 ≤ **H<sub>i</sub>** ≤ 10<sup>9</sup>  
1 ≤ **A<sub>i</sub>** ≤ **B<sub>i</sub>** ≤ **N**  

### Input

Input begins with an integer **T**, the number of block structures Mr. Fox
has. For each structure, there is first a line containing the space-separated
integers **N** and **Q**. The next line contains the space-separated integers
**H<sub>i</sub>**. Then follow **Q** lines, the **i**th of which contains the
space-separated integers **A<sub>i</sub>** and **B<sub>i</sub>**.

### Output

For the **i**th structure, print a line containing "Case #**i**: " followed by
the sum of the answers to the **Q** questions modulo 10<sup>9</sup>+7.

### Explanation of Sample

In the first case, we consider prefixes of the block structure. The answers to
the queries are 0, 0, 0, 0, 0, 5, 5, 7, 7, 18, 18 for a total of 60.

#### Example input

```
5
11 11
2 4 5 3 2 6 1 3 1 8 1
1 1
1 2
1 3
1 4
1 5
1 6
1 7
1 8
1 9
1 10
1 11
5 3
10 1 1 1 10
1 5
1 2
4 5
5 3
10 1 5 1 10
1 5
1 3
3 5
5 1
1 2 3 4 5
1 5
7 7
2 1 2 1 2 1 2
1 1
1 2
1 3
1 4
1 5
1 6
1 7

```

#### Example output

```
Case #1: 60
Case #2: 27
Case #3: 31
Case #4: 0
Case #5: 9

```
