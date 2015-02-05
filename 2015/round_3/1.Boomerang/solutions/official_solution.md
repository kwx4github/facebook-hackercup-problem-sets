[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-3-solutions/1056536891028878)

##### Boomerang

(Problem author: Jacob Plachta)

Since your score is the product of the number of targets hit on each segment, we need to attempt to hit at least one target on the initial segment. So we'll throw the boomerang in the direction of some target. For each target, we can determine the intermediate point at which the boomerang changes direction (after D distance). From that point, we will again want the boomerang to fly towards at least one target.

A naive solution takes O(N<sup>3</sup>) time. There are N possible directions in which to throw the boomerang, each of which yields a possible intermediate point for the boomerang's path. For each such point, there are N possible directions for the second segment, and it takes O(N) time to determine, for each of those possible angles from the intermediate point, which of the targets lie on that path.

We can do better for each possible considered intermediate point if we sort the targets by angle relative to that point, in O(N log N) time. We can then do an angular line sweep to determine, in O(N) time, how many targets lie along each distinct possible considered angle relative to the intermediate point. This yields a time complexity of O(N<sup>2</sup> log N).

Input: https://www.dropbox.com/s/y6o5zwmvwpwz7ck/boomerang.in?dl=0

Output: https://www.dropbox.com/s/ft40see4ysncbgz/boomerang.out?dl=0


