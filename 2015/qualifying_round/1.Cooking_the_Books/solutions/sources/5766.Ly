#include <bits/stdc++.h>

using namespace std;

int main() {
	freopen("in", "r", stdin);
	freopen("out", "w", stdout);
	int T, cas = 1;
	cin >> T;
	while (T --) {
		char num[20];
		char mn[20], mx[20];
		scanf("%s", num);
		int len = strlen(num);
		strcpy(mn, num);
		strcpy(mx, num);
		for (int i = 0; i < len; i++) {
			for (int j = i + 1; j < len; j++) {
				if (i == 0 && num[j] == '0') continue;
				swap(num[i], num[j]);
				if (strcmp(num, mn) < 0) strcpy(mn, num);
				if (strcmp(num, mx) > 0) strcpy(mx, num);
				swap(num[i], num[j]);
			}
		}
		printf("Case #%d: %s %s\n", cas ++, mn, mx);
	}
	return 0;
}
