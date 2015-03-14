#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;

int getv(char num[], int n) {
	int v = 0;
	for (int i = 0; i < n; i++)
		v = v * 10 + num[i] - '0';
	return v;
}

int main() {
	int T;
	int i, j;
	cin >> T;
	for (int cs = 1; cs <= T; cs++) {
		char num[20];
		cin >> num;
		int n = strlen(num);
		int mn = getv(num, n), mx = getv(num, n);
		for (i = 0; i < n; i++)
			for (j = i + 1; j < n; j++) {
				swap(num[i], num[j]);
				if(num[0] != '0') {
					mn = min(mn, getv(num, n));
					mx = max(mx, getv(num, n));
				}
				swap(num[i], num[j]);
			}
		printf("Case #%d: ", cs);
		cout << mn << " " << mx << endl;
	}
	return 0;
}
