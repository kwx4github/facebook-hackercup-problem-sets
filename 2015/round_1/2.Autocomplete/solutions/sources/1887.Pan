#include <iostream>
#include <cstdio>
using namespace std;

struct TrieNode {
	TrieNode* children[30];
};

void insert(TrieNode* root, char* word) {
	if(!*word) return;
	int n = *word - 'a';
	if (!root->children[n]) root->children[n] = new TrieNode;
	insert(root->children[n], ++word);
}

int findlen(TrieNode* root, char* word) {
	if(!*word || !root) {
		return 0;
	}
	int n = *word - 'a';
	return 1 + findlen(root->children[n], ++word);
}

char w[1000010];

void main2() {
	int n;
	cin >> n;
	long long int ans = 0;
	TrieNode* root = new TrieNode;
	for (int i = 0; i < n; i++) {
		cin >> w;
		ans += findlen(root, w);
		insert(root, w);
	}
	cout << ans << endl;
}

int main() {
	int T;
	cin >> T;
	for (int cs = 1; cs <= T; cs++) {
		printf("Case #%d: ", cs);
		main2();
	}
	return 0;
}
