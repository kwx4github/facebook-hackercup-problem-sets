#include <iostream>
#include <cstdio>
using namespace std;

#define N 10000010

int p[N];
int c[N];

void main2() {
	int A, B, K;
	cin >> A >> B >> K;
	int ans = 0;
	for (int i = A; i <= B; i++) if (c[i] == K) ans++;
	cout << ans << endl;
}

int main() {
	int T;
	cin >> T;
	int i, j;
	for (i = 2; i < N; i++) p[i] = 1;
	for (i = 2; i * i < N; i++) if(p[i] == 1) {
		c[i] = 1;
		for (j = i * 2; j < N; j += i) {
			p[j] = 0;
			c[j]++;
		}
	}
	for (int cs = 1; cs <= T; cs++) {
		printf("Case #%d: ", cs);
		main2();
	}
	return 0;
}
