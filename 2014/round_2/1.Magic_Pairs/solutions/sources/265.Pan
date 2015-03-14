#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
#include <cstring>
#include <string>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <cassert>
#include <cstdlib>
#include <algorithm>
#include <bitset>
#include <vector>
#include <stack>
#include <list>
#include <utility>
#include <queue>
#include <set>
#include <map>
using namespace std;

typedef long long ll;
typedef pair<int, int> PII;
typedef vector<int> VI;
typedef vector<PII> VP;
typedef vector<string> VS;

#define FOR(i,a,b) for(i=(a);i<(b);i++)
#define FORE(it,x) for(typeof(x.begin()) it=x.begin();it!=x.end();it++)
#define ALL(x) x.begin(),x.end()
#define CLR(x, v) memset((x),v,sizeof (x))
#define gcd(a, b) __gcd(a, b)
#define PB push_back 
#define MP make_pair
#define INF 2000000007

int toInt(string s){ istringstream sin(s); int t; sin>>t; return t; }
template<class T> string toString(T x){ ostringstream sout; sout<<x; return sout.str(); }
template<class T> void chmin(T &t, T f) { if (t > f) t = f; }
template<class T> void chmax(T &t, T f) { if (t < f) t = f; }

int x[1000010], y[1000010], cnt[1000010];
set<ll> st, r;
void solve()
{
	int n, m;
	ll x1, a1, b1, c1, r1;
	ll x2, a2, b2, c2, r2;
	cin >> n >> m;
	cin >> x1 >> a1 >> b1 >> c1 >> r1;
	cin >> x2 >> a2 >> b2 >> c2 >> r2;
	x[0] = x1; y[0] = x2;
	int i, j;
	FOR(i,1,max(n,m)) {
		if(i < n) x[i] = (a1 * x[(i-1) % n] + b1 * y[(i-1) % m] + c1) % r1;
		if(i < m) y[i] = (a2 * x[(i-1) % n] + b2 * y[(i-1) % m] + c2) % r2;
	}
	st.clear();
	r.clear();
	ll ans = 0;
	int pre = 0;
	j = pre;
	FOR(i,0,n) {
		if(st.find(x[i]) != st.end()) {
			ans += j - pre;
		} else {
			st.insert(x[i]);
			r.insert(x[i]);
			int pos = -1;
			while(j < m) {
				if(st.find(y[j]) == st.end()) break;
				if(r.find(y[j]) != r.end()) {
					r.erase(r.find(y[j]));
					if(r.size() == 0) pos = j;
				}
				j++;
			}
			if(pos == -1) {
				pre = j;
			} else {
				pre = pos;
				ans += j - pre;
			}
		}
	}
	cout << ans << endl;
}

int main()
{
	int T;
	cin >> T;
	for(int cs = 1; cs <= T; cs++) {
		cout << "Case #" << cs << ": ";
		solve();
	}
	return 0;
}
