#include <iostream>
#include <cstdio>
using namespace std;

int p[30], c[30], f[30];

int main() {
	int T;
	int i, j;
	cin >> T;
	for (int cs = 1; cs <= T; cs++) {
		int n;
		int gp, gc, gf;
		cin >> gp >> gc >> gf;
		cin >> n;
		for (i = 0; i < n; i++)
			cin >> p[i] >> c[i] >> f[i];
		for (i = 0; i < (1 << n); i++) {
			int tp = 0, tc = 0, tf = 0;
			for (j = 0; j < n; j++) if((1 << j) & i) {
				tp += p[j];
				tc += c[j];
				tf += f[j];
			}
			if (tp == gp && tc == gc && tf == gf) break;
		}
		printf("Case #%d: ", cs);
		cout << (i < (1 << n) ? "yes" : "no") << endl;
	}
	return 0;
}
