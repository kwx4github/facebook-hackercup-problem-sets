[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-2-solutions/1051224511560116)

All Critical

(Problem Author: Wesley May)

Let P(s, i) be the probability that we have collected exactly i critical bars after s plays of the song. So P(0, 0) = 1, and for i > 0, P(0, i) = 0. We can then compute P(s, i) for s > 0 and 0 ≤ i ≤ 20 recursively as follows:

P(s, i) = Σ[0 ≤ j ≤ i] (P(s - 1, j) * C(20 - j, i - j) * p<sup>i-j</sup> * (1 - p)<sup>20-i</sup>)

(Note that C(n, k) is the binomial coefficient, or “combinatoric choose”, function.)

The intuitive explanation for the above formula is that we want to have exactly i critical bars after s playthroughs, and we consider all values j ≤ i such that we had exactly j critical bars right before our sth playthrough. The probability of that having been the case is P(s - 1, j), the number of ways to select exactly i-j of the remaining 20-j sections (on which to get new critical bars) is C(20 - j, i - j), and these values are multiplied by both the probability of getting critical bars on i-j bars, and by the probability of not getting critical bars on the remaining 20-i bars.

For i > 0, let Q(i) be the probability that we receive our 20th critical bar on the ith playthrough. For i > 0, we can compute the following:

Q(i) = P(i, 20) - P(i-1, 20)

For example, if there's a 50% chance that we have all of the bars after one playthrough, and a 60% chance that we have them all after two playthroughs, then there must be a 60% - 50% = 10% chance that it will take us exactly two playthroughs to get all of the bars.

We can then compute the expected number of playthroughs, E, with the following infinite sum:

E = Σ[i > 0] (i * Q(i))

Practically though, we only need to evaluate this sum for small values of i, up to some value L. i increases linearly, but Q(i) falls off exponentially, so their product also decreases exponentially. Since we only need 5 decimal places of precision, it's safe to stop computing the remainder of the sum once this product is reasonably small (say 10<sup>-9</sup> for example). For the lower bound in this problem, p = 0.01, giving L a value of 5000 or so is more than sufficient. Computing P(s, i) for 0 ≤ s ≤ L and 0 ≤ i ≤ 20 takes on the order of L*20<sup>2</sup> operations.

Input: http://pastebin.com/1TuGBaZh

Output: http://pastebin.com/8XzptxV7

