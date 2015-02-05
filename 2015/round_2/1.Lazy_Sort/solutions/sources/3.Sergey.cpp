#include <cstdio>
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <string>
#include <set>
#include <map>
#include <ctime>
#include <cstring>
#include <cassert>
#include <bitset>
#include <sstream>
#include <queue>

using namespace std;

#define forn(i, n) for(int i = 0; i < (int)(n); i++)
#define ford(i, n) for(int i = (int)(n) - 1; i >= 0; i--)
#define pb push_back
#define mp make_pair
#define fs first
#define sc second
#define last(a) int(a.size() - 1)
#define all(a) a.begin(), a.end()
#define seta(a,x) memset (a, x, sizeof (a))
#define I (int)

typedef long long int64;
typedef pair <int, int> pii;
typedef long double ldb;

const long double eps = 1e-9;
const int inf = (1 << 30) - 1;
const int64 inf64 = ((int64)1 << 62) - 1;
const long double pi = 3.1415926535897932384626433832795;

template <class T> T sqr (T x) {return x * x;}
template <class T> T abs (T x) {return x < 0 ? -x : x;}

const int nmax = 100100;
int n;
int a[nmax];

bool check() {
    int l, r, q, w;
    l = 1; r = n - 1;
    q = w = a[0];
    while(l < r) {
    	if (q - 1 == a[l]) {
    		l ++;
    		q --;
    		continue;
    	}
    	if (w + 1 == a[l]) {
    		l ++;
    		w ++;
    		continue;
    	}
    	if (q - 1 == a[r]) {
    		r --;
    		q --;
    		continue;
    	}
    	if (w + 1 == a[r]) {
    		r --;
    		w ++;
    		continue;
    	}
    	return 0;
    }
    return 1;	
}

void solve() {
	cin >> n;
	forn(i, n)
		scanf("%d", &a[i]);	
	if (check()) {
		puts("yes");
		return;
	}
	reverse(a, a + n);
	if (check()) {
		puts("yes");
		return;
	}
	puts("no");
}

int main ()
{
//	freopen("input.txt", "rt", stdin);
//	freopen("output.txt", "wt", stdout);

	int tst;
	cin >> tst;
	forn(i, tst) {
		printf("Case #%d: ", i + 1);
		solve();
	}
	

	return 0;
}
