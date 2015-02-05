[src](https://www.facebook.com/hackercup/problems.php?pid=764700076919084&round=890884524269795)

##### Lunch Scheduling

##### 15 points

James and Wilson are the best of buddies. And, conveniently enough, they both work at Corpro Corp! Every day, they have the opportunity to eat lunch together, while talking about how well their favourite sports teams are doing and how strict their managers are. However, their work obligations can often get in the way of that.

At Corpro Corp, each workday is 80,000,000 milliseconds long, and the company uses the phrase "time **t**" to refer to the moment in time **t** milliseconds after the start of the workday. All employees arrive at time 0, and leave at time 80,000,000.

On a certain day, James gets invited to **J** optional meetings. The **i**th of these meetings starts at time **A<sub>i</sub>** and ends at time **B<sub>i</sub>**. Similarly, Wilson gets invited to **W** optional meetings, with the **i**th one starting at time **C<sub>i</sub>** and ending at time **D<sub>i</sub>**. All **J**+**W** meetings might arbitrarily overlap with one another.

Both James and Wilson may choose to accept any subset of their invitations, possibly none of them or all of them. The meetings are all conducted virtually, making it possible to attend multiple meetings at the same time — as such, two invitations may be accepted even if their time ranges overlap.

As it turns out, James and Wilson actually hate having lunch together, but they feel obligated to do so if they're able to. Eating lunch takes exactly **L** milliseconds, and so the two friends will meet up for lunch if there's a consecutive interval of at least **L** milliseconds within their work hours during which neither of them is taking part in any meetings.

Less surprisingly, James and Wilson hate attending meetings. If James accepts **x** of his **J** invitations, and Wilson accepts **y** of his **W** invitations, then the combined inconvenience they experience is max(**x**, **y**). Determine whether or not it's possible for them to avoid having to eat lunch together — and, if so, determine the minimum combined inconvenience they must incur to do so.

##### Input

Input begins with an integer **T**, the number of days James and Wilson go to work. For each day, there is first a line containing the space-separated integers 
**J**, **W**, and **L**.

Then, **J** lines follow, the **i**th of which contains the space-separated integers **A<sub>i</sub>** and **B<sub>i</sub>**.

Then, **W** lines follow, the **i**th of which contains the space-separated integers **C<sub>i</sub>** and **D<sub>i</sub>**.

##### Output

For the **i**th day, print a line containing "Case #**i**: " followed by the minimum combined inconvenience James and Wilson must experience, or "Lunchtime" if they cannot avoid having lunch together.

##### Constraints

1 ≤ **T** ≤ 20 

0 ≤ **J**, **W** ≤ 3000 

1 ≤ **L** ≤ 100,000,000 

0 ≤ **A<sub>i</sub>** &lt; **B<sub>i</sub>** ≤ 80,000,000 

0 ≤ **C<sub>i</sub>** &lt; **D<sub>i</sub>** ≤ 80,000,000 

##### Explanation of Sample

In the first case, James can attend the meeting from time 40,000,000 to 70,000,000, and Wilson can attend the meeting from time 10,000,000 to time 21,000,000. They each attend one meeting, so the combined inconvenience is 1.

Example input

```
5
2 2 20000000
0 50000000
40000000 70000000
10000000 21000000
15000000 16000000
2 2 100
20 300
800 80000000
500 1000
800 80000000
2 2 100
20 300
650 1000
350 600
1050 80000000
2 1 100
20 300
350 1000
650 80000000
0 5 10000000
9999999 20000000
10000000 40000000
12345678 33333333
45000000 60000000
54321234 76543456
```

Example output

```
Case #1: 1
Case #2: Lunchtime
Case #3: 2
Case #4: 2
Case #5: 4
```
