[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-qualification-round-solutions/1043281905687710)

##### Cooking the Books

With only 9 digits, it's easy to just try swapping all possible pairs of digits to see what makes the smallest and largest numbers. You must take care not to swap zeroes to the front of the number, of course. This solution has a time complexity of O(N^2) where N is the number of digits, or potentially O(N^3) if you use strings to represent the numbers.

An O(N) solution is also available, though it isn't necessary for such small numbers. First observe that you always want to modify the most significant digit that you can. If we want to make a number as large as possible, we need to find the most significant digit D such that there is some less significant digit D' that satisfies D' > D. We want to select the largest possible D', but if this isn't unique, then we want to select the least significant one.

For example, if the number is 997818, D is 7, as we can't replace 9 with anything larger. D' will be 8, and in particular we select the 8 from the end of the number, to give us the result 998817. We can select both D and D' in O(N) time, leading to an overall time complexity of O(N). The process to find the smallest number is parallel.

Input: http://pastebin.com/UEW60MbW
Output: http://pastebin.com/Xqm6PThN

