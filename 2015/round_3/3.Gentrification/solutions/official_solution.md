[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-3-solutions/1056536891028878)

Gentrification

(Problem author: Leopoldo Taravilse)

In the given directed graph of neighbourhoods and roads, two nodes u and v may be selected for gentrification either if both of them are reachable from one another, or if neither of them is reachable from the other. Note that the former holds if and only if u and v are in the same strongly connected component (SCC). The latter holds if and only if their respective SCCs are not reachable from one another. From this, it's not hard to see that each SCC can be considered as a whole - it's optimal to either use all of its nodes, or none of them.

As such, let's start by converting the given directed graph of neighbourhoods and roads into a second graph, by collapsing each SCC into a single node labeled with a weight equal to the number of nodes from the original graph which are in that component. All of the SCCs can be found in O(N+M) time due to Kosaraju's algorithm, and the second graph can be assembled from them (joined by corresponding edges present in the original graph) in O(N+M) time as well. Note that this new graph must be a directed acyclic graph (DAG).

We're now trying to find an antichain in this DAG with a maximized sum of node weights. An antichain is a set of nodes, such that no two of them are reachable from one another. To solve this problem, we'll need to convert this second graph into a third graph - an "equivalent" (for our antichain-­finding purposes) DAG with unweighted nodes, and then find the largest size of an antichain in it (in other words, its width).

The third graph can be constructed by considering each node n in the second graph in turn. Let's say that node n has a set of incoming edges e<sub>i</sub>, a set of outgoing edges e<sub>o</sub>, and a weight of w. In the third graph, this single node will be replaced by a node e at which all edges in e<sub>i</sub> will end, a node o at which all edges in e<sub>o</sub> will begin, and a set of w nodes linking nodes e and o in parallel. That is, for each of these w nodes, there should be an edge from e to it, and from it to o. Intuitively, it can be seen that all w of these intermediate nodes may be included in an antichain (but not along with e or o), just as the w nodes in the corresponding SCC in the original graph may be gentrified together. As a final note, this third graph is guaranteed to have at most 3*N nodes.

Finally, the width of this final DAG may be found due to Dilworth's Theorem by computing its transitive closure, constructing a bipartite graph with O(N) nodes based on it, and finding the size of the maximum matching in it. Computing the transitive closure and matching each take at most O(N<sup>3</sup>) time, which is acceptable.

Input: Coming soon!

Output: Coming soon!
