#include <cstdio>
#include <numeric>
#include <iostream>
#include <vector>
#include <set>
#include <cstring>
#include <string>
#include <map>
#include <cmath>
#include <ctime>
#include <algorithm>
#include <bitset>
#include <queue>
#include <sstream>
#include <deque>

using namespace std;

#define mp make_pair
#define pb push_back
#define rep(i,n) for(int i = 0; i < (n); i++)
#define re return
#define fi first
#define se second
#define sz(x) ((int) (x).size())
#define all(x) (x).begin(), (x).end()
#define sqr(x) ((x) * (x))
#define sqrt(x) sqrt(abs(x))
#define y0 y3487465
#define y1 y8687969
#define fill(x,y) memset(x,y,sizeof(x))
                         
typedef vector<int> vi;
typedef long long ll;
typedef long double ld;
typedef double D;
typedef pair<int, int> ii;
typedef vector<ii> vii;
typedef vector<string> vs;
typedef vector<vi> vvi;

template<class T> T abs(T x) { re x > 0 ? x : -x; }

const int N = 1000*1000*10;

int n;
int m;
int f[N + 1];
int res[N + 1];

int main () {
	for (int i = 2; i <= N; i++)
		if (!f[i]) {
			f[i] = i;
			for (int j = 2 * i; j <= N; j += i)
				f[j] = i;
		}
	res[1] = 0;
	for (int i = 2; i <= N; i++) {
		int j = i, k = f[i];
		while (j % k == 0) j /= k;
		res[i] = res[j] + 1;
	}
	int tt;
	cin >> tt;
	for (int it = 1; it <= tt; it++) {
		int a, b, c;
		cin >> a >> b >> c;
		int ans = 0;
		for (int i = a; i <= b; i++)
			ans += int (res[i] == c);
		cout << "Case #" << it << ": " << ans;
		cout << endl;
		fprintf (stderr, "%d / %d = %.2f | %.2f\n", it, tt, (double)clock () / CLOCKS_PER_SEC, ((double)clock () / it * tt) / CLOCKS_PER_SEC);
	}
	return 0;
}