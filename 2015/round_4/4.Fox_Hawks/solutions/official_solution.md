[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-final-round-solutions/1080127472003153)

Fox Hawks

(Problem author: Vladislav Isenbaev)

To approach this problem, we need to be able to count the number of solutions to the boolean expression with some variables possibly having fixed values (true or false), or determine that the number of solutions is larger than 10<sup>18</sup>. If we can do that, then we can determine the value of each variable from N down to 1 in turn using the following standard procedure:

Fix variable N to be false, and count the number of solutions. If it's no greater than K, then variable N must be false, due to the fact that all sets without hawk N have smaller values than all sets with hawk N. Otherwise, variable N must be true, and we can subtract that solution count from K going forward. We can then repeat this process with variable N-1, while keeping variable N fixed at its determined value, and so on.

Now, the tricky part is determining the solution count each time it's needed, with new variables having fixed values. To begin with, we should parse the boolean expression and store it in the well-known format of a binary expression tree, with each leaf node representing a variable, and each internal node representing an operator (operating on the subexpressions represented by its two children). Furthermore, for each node, we'd like to calculate the number of satisfying solutions for its subexpression, and and the number of non-satisfying solutions. For a leaf node, these values depend on the variable's fixed value (if any), and for an internal node, these values can be computed from its children's values. The number of solutions to the whole boolean expression is then stored in the root node.

All of the values in the tree can initially be computed in O(N) time, and then when a variable's value is fixed, only its node's ancestor's values need to be recomputed. However, there can be O(N) such ancestors each time, so this is too slow. To improve the time complexity of each iteration to O(log<sup>2</sup> N), we can perform heavy-light decomposition on the tree, creating a segment tree for each run of heavy edges. Basically, each node of each segment tree will end up storing 4 values - the number of true/false solutions for its range's top node's subexpression in terms of the number of true/false solutions for its range's bottom node's subexpression.

Input: https://www.dropbox.com/s/ket1jsfkese6idz/fox_hawks.in?dl=0

Output: https://www.dropbox.com/s/ouxboghrhdb1rbd/fox_hawks.out?dl=0
