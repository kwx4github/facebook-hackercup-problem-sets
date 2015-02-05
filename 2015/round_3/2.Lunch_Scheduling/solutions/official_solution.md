[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-3-solutions/1056536891028878)

##### Lunch Scheduling

(Problem author: Jacob Plachta)

Right off the bat, it's simplest to handle a special case separately: if L &gt; 80,000,000, then the answer is simply 0. Going forward, let's assume that this is not the case.

For every meeting M, there are at most two potentially optimal “next” meetings to attend - one for each person. Of all of the meetings that James can attend that start after M starts and start earlier than L milliseconds after M ends, let M<sub>j</sub> be the one that ends the latest, if any. We can define M<sub>w</sub> similarly for Wilson. If somebody attends meeting M, the only two meetings we need to consider attending next are M<sub>j</sub> and M<sub>w</sub>. We can naively precompute M<sub>j</sub> and M<sub>w</sub> for every meeting M in O(N<sup>2</sup>) time, where N is the total number of meetings (N = J + W).

Let S<sub>j</sub> and S<sub>w</sub> be the two meetings that are optimal to start with for James and Wilson respectively, if any. That is, the meetings for each of them that end as late as possible, but start earlier than time L. If neither S<sub>j</sub> nor S<sub>w</sub> are defined (no meetings start earlier than time L), then it's impossible to avoid having lunch.

Otherwise the answer we're looking for is then the minimum of these (unless both are ∞, in which case lunch also cannot be avoided):

min[0 ≤ i ≤ J] max(f(S<sub>j</sub>, i), i), if S<sub>j</sub> is defined

min[0 ≤ i ≤ J] max(f(S<sub>w</sub>, i), i), if S<sub>w</sub> is defined

We can define f(M, K) recursively as follows:

   - f(M, K) = ∞ if M is undefined (that is, if we refer to M<sub>j</sub> or M<sub>w</sub> but such a meeting doesn't exist)
   - f(M, 0) = 1 if M ends after 80,000,000 - L (no more meetings after M are needed to avoid lunch), and M is one of Wilson's meetings
   - f(M, 1) = 0 if M ends after 80,000,000 - L, and M is one of James's meetings
   - f(M, K) = ∞ if M ends after 80,000,000 - L, and neither of the above 2 cases holds
   - f(M, 0) = f(M<sub>w</sub>, 0) + 1 (we've run out of James's meetings, so Wilson must attend a meeting)
   - f(M, K) = min(f(M<sub>j</sub>, K - 1), f(M<sub>w</sub>, K) + 1) if K &gt; 0 (either person can take the next meeting)

There are only O(N<sup>2</sup>) states to compute, and each one can be computed in O(1) time. So the total time complexity of this solution is O(N<sup>2</sup>)

Input: https://www.dropbox.com/s/lzxs67n30gepqzj/lunch.full.in?dl=0

Output: https://www.dropbox.com/s/h2srfxg0hbw4v1w/lunch.full.out?dl=0

