[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-final-round-solutions/1080127472003153)

Fox Focks

(Problem authors: Andrew Henrey and Jacob Plachta)

We can start by taking each Fock's given one-step color transition matrix to a large power (2<sup>50</sup> is easily enough) with standard fast matrix exponentiation, to compute the probability P<sub>i,c</sub> that the ith Fock has color c at time 2<sup>50</sup> (for 1 ≤ i ≤ N and 1 ≤ c ≤ 3). This takes N * 50 * 3<sup>3</sup> time.
Now, one might be tempted to guess that all of the P values are the same for time 2<sup>50</sup> as for time 2<sup>50</sup> + 1. In fact, this is true for many initial matrices. However, it's possible to construct matrices for which the P values instead eventually become periodic every 2 or 3 time steps, such as these:

```
0 50 50
100 0 0
100 0 0

0 100 0
0 0 100
100 0 0
```

Therefore, all of the P values must eventually become periodic as a whole every 6 time steps. As such, we can compute the probability of a strict majority of a Fock color at each time 2<sup>50</sup>..(2<sup>50</sup>+5), with the final answer being the average of these 6 values. Furthermore, for each time, the events of each of the 3 colors having a strict majority are mutually exclusive, so we can compute their probabilities and add them up.
There are two different intended ways to solve the above subproblem for a given time and color. One is based on the simple O(N<sup>2</sup>) DP solution, in which we calculate D<sub>i,j</sub> as the probability of j of the first i Focks having the current color at the current time. We can observe that, for each i, D<sub>i,j</sub> can only have a "significant" value (larger than some threshold such as 10<sup>-12</sup>) for quite a limited range of j values. Keeping track of this range as we iterate i from 0 to N, the inner loop will pass over significantly fewer than N values each time, allowing the DP to run easily in time.
The other possible intended method uses computes the probability C<sub>i</sub> of having i Focks of the current color with a divide-and-conquer strategy over indices of Focks. For a range with a small number of Focks (for example, no more than 100), the C values can be computed with the simple DP mentioned above. On the other hand, a larger range can be recursively split in half, with the C arrays of its two halves then combined together with a fast Fourier transform. This algorithm has a time complexity of O(N log<sup>2</sup> N).

Input: https://www.dropbox.com/s/nvxhklxbxkt3ax5/fox_focks.in?dl=0
Output: https://www.dropbox.com/s/r9vz088kyh31wc4/fox_focks.out?dl=0

