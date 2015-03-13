#include <iostream>
#include <cstdio>
using namespace std;

#define N 2010
#define MOD 1000000007

long long int c1[N][N];
long long int c2[N][N];
long long int c3[N][N];

void main2() {
	string score;
	cin >> score;
	int a, b;
	sscanf(score.c_str(), "%d-%d", &a, &b);
	cout << c1[a][b] << " " << c3[a][b] << endl;
}

int main() {
	int T;
	cin >> T;
	int i, j, k;
	c1[0][0] = c2[0][0] = c3[0][0] = 1;
	for (i = 1; i < N; i++) {
		c1[i][0] = c2[i][0] = c3[i][0] = 1;
		for (j = 1; j < i - 1; j++) {
			for (k = 0; k <= j; k++) {
				c1[i][j] += c1[i-1][k];
				if (c1[i][j] >= MOD) c1[i][j] -= MOD;
			}
		}
		if (i > 1) c1[i][i-1] = c1[i][i-2];
		for (j = 1; j < i; j++) {
			for (k = 0; k <= j; k++) {
				c2[i][j] += c2[i-1][k];
				if (c2[i][j] >= MOD) c2[i][j] -= MOD;
			}
		}
		c2[i][i] = c2[i][i-1];
		for (j = 1; j < i; j++) {
			for (k = 0; k < j; k++) {
				c3[i][j] += c2[j-1][k];
				if (c3[i][j] >= MOD) c3[i][j] -= MOD;
			}
		} 
	}
	for (int cs = 1; cs <= T; cs++) {
		printf("Case #%d: ", cs);
		main2();
	}
	return 0;
}

