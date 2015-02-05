[src](https://www.facebook.com/notes/facebook-hacker-cup/hacker-cup-2015-round-1-solutions/1047761065239794)

##### Autocomplete

The go-to data structure for this problem is a trie (http://en.wikipedia.org/wiki/Trie). As each word comes in, we add it to the trie in O(L) time, where L is the length of the word. In the same amount of time, we can determine what the shortest unique prefix is. If we traverse the trie all the way to the end of a word W, then some word W' must already exist that has W as a prefix. In this case, we must type all of W. However, if we hit a leaf node in the trie, then we know that the prefix we'll type is one letter longer than the word stored in that leaf node.

Input: https://www.dropbox.com/s/8u5hbw54dgr48m0/autocomplete.full.in?dl=0

Output: http://pastebin.com/GRZriZCB
