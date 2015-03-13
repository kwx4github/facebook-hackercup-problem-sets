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

int n;
int m;

int x[50001];

int main () {
	int tt;
	cin >> tt;
	for (int it = 1; it <= tt; it++) {
		scanf ("%d", &n);
		for (int i = 0; i < n; i++) scanf ("%d", &x[i]);
		int good = 0;
		{
			int l = x[0], r = x[0];
			int lc = 1, rc = n - 1;
			while (lc <= rc) {
				if (x[lc] == l - 1) {
					l--;
					lc++;
				} else
				if (x[lc] == r + 1) {
					r++;
					lc++;
				} else
				if (x[rc] == l - 1) {
					l--;
					rc--;
				} else
				if (x[rc] == r + 1) {
					r++;
					rc--;
				} else break;
			}
			if (lc > rc) good = 1;
		}
		{
			int l = x[n - 1], r = x[n - 1];
			int lc = 0, rc = n - 2;
			while (lc <= rc) {
				if (x[lc] == l - 1) {
					l--;
					lc++;
				} else
				if (x[lc] == r + 1) {
					r++;
					lc++;
				} else
				if (x[rc] == l - 1) {
					l--;
					rc--;
				} else
				if (x[rc] == r + 1) {
					r++;
					rc--;
				} else break;
			}
			if (lc > rc) good = 1;
		}
		cout << "Case #" << it << ": " << (good ? "yes" : "no");
		cout << endl;
		fprintf (stderr, "%d / %d = %.2f | %.2f\n", it, tt, (double)clock () / CLOCKS_PER_SEC, ((double)clock () / it * tt) / CLOCKS_PER_SEC);
	}
	return 0;
}