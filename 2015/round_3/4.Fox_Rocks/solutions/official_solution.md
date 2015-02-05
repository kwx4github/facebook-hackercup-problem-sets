[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-3-solutions/1056536891028878)

Fox Rocks

(Problem authors: Andrew Henrey, Jacob Plachta)

Let's consider the given directed graph of clearings and trails to be divided into M = ceil(N/4) rows, with nodes 0..3 in row 1, nodes 4..7 in row 2, and so on. The constraint that an edge from node a to node b may only exist if 0 ≤ floor(b/4) - floor(a/4) ≤ 1 can then be restated as follows: an edge from node a to node b may only exist if a and b are in the same row, or if b is in the row just after a's row. 

When taking a stroll starting from a node in row r, note that Mr. Fox will walk amongst nodes in row r, walk to a node in row r+1, walk amongst nodes in row r+1, walk to a node in row r+2, and so on until he reaches a closed set of nodes in some row which have no outgoing edges to the following row, which he'll walk amongst forever (or until he reaches a node with no outgoing edges, at which point the stroll will end).

For each row, we'd like to calculate a 4x4 table of values P, where P<sub>i,j</sub> is the probability that, given that Mr. Fox is currently in the ith node in row r, he will eventually reach the jth node in row r+1 without having reached any other nodes in row r+1 previously. Note that Σ[1 ≤ j ≤ 4] P<sub>i,j</sub> may not be equal to 1, if there's a chance that Mr. Fox will never reach row r+1 from the ith node in row r.

This table can be calculated by modeling the 8 nodes in rows r and r+1 (which we can re-number as nodes 1..4 and 5..8 respectively) as a Markov chain, with nodes 5..8 (and any nodes with no outgoing edges) being absorbing states. In particular, we can construct an 8x8 one-step transition matrix A, where A<sub>i,i</sub> = 1 if node i is an absorbing state, A<sub>i,j</sub> = 0 if node i is an absorbing state and i ≠ j, and A<sub>i,j</sub> is the weighed probability of Mr. Fox walking to node j while at node i (based on the relative rock counts on outgoing edges from node i) if i is not an absorbing state. The long-run transition matrix B can then be computed by using fast matrix exponentiation to take A to a high enough power (for example, B = A<sup>2<sup>16</sup></sup>). P then consists of the values B<sub>i,j</sub> for i=1..4 and j=5..8. This computation takes 16*8<sup>3</sup> time per table. P can be computed more efficiently (with 8<sup>3</sup> time) with Gaussian elimination and some additional operations, but this is not required.

The above P table calculations will need to be done for each row initially (once the starting edges have been inputted), and then each time an edge from some node a is added or removed (due to an event of type 1 or 2), the P table for node a's row will have to be recomputed. Therefore, the total time spent on them will be (M + D) * 16 * 8<sup>3</sup>, which is expensive but acceptable.

Now, to handle events of type 3, let's say that Mr. Fox starts at the c<sub>1</sub>th node in row r<sub>1</sub>, and we want the probability that he'll eventually visit the c<sub>2</sub>th node in row r<sub>2</sub>. If r<sub>2</sub>&nbsp;&lt; r<sub>1</sub>, then the answer is trivially 0. Otherwise, the first step is to determine a list of 4 values S similar to the P table, where S<sub>i</sub>&nbsp;is the probability that Mr. Fox will eventually reach the ith node in row r<sub>2</sub>&nbsp;without having reached any other nodes in row r<sub>2</sub>&nbsp;previously. In fact, if we consider the product of matrices P<sub>r<sub>1</sub></sub>&nbsp;* P<sub>r<sub>1</sub>+1</sub>&nbsp;* ... * P<sub>r<sub>2</sub>-1</sub> (or the identity matrix if r<sub>1</sub>&nbsp;= r<sub>2</sub>), then S is just the c<sub>1</sub>th row of this resulting matrix.</p>

We can't afford to loop over O(M) rows to compute S for each type 3 operation, but the standard concept of using a segment tree to perform range queries will cut that factor down to O(log(M)). In this case, each node in the segment tree will store a 4x4 matrix of probabilities - the leaf nodes of the tree will contain the computed P tables, and each interior node will store the product of its left child's matrix with its right child's matrix. Building the tree initially takes M * 4<sup>3</sup> time, updating it when a P table changes takes log(M) * 4<sup>3</sup> time, and querying it to compute S also takes log(M) * 4<sup>3</sup> time. Therefore, the total time from these calculations is (M + D*log(M)) * 4<sup>3</sup>.

Finally, given S, we still need to consider Mr. Fox walking amongst the nodes in row r<sub>2</sub>&nbsp;to determine the probability that he'll ever visit its c<sub>2</sub>th node. Just like the P table calculation, this may be modeled as a Markov chain, with an 8x8 one-step transition matrix A calculated exactly as before but with node c<sub>2</sub>&nbsp;also being made into an absorbing state (by ignoring all of its outgoing edges and giving it a self loop). The long-run transition matrix B = A<sup>2<sup>16</sup></sup> may also be calculated as before, in 16 * 8<sup>3</sup> time, and then the final answer will be Σ[1 ≤ i ≤ 4] S<sub>i</sub> * B<sub>i,c<sub>2</sub></sub>, considering each of the 4 possible points of entry into row r<sub>2</sub>.

Input: https://www.dropbox.com/s/gsononzjesbbg2k/rocks.full.in?dl=0

Output: https://www.dropbox.com/s/l2vyfcgy2f4s7ql/rocks.full.out?dl=0
