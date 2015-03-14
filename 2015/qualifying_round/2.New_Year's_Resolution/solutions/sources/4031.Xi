#include <bits/stdc++.h>
#define  RD(x)      scanf("%d", &x)
#define  REP(i, n)  for (int i=0; i<int(n); ++i)
#define  FOR(i, n)  for (int i=1; i<=int(n); ++i)
#define  pii        pair<int, int>
#define  piL        pair<int, long long>
#define  mp         make_pair
#define  pb         push_back
#define  whatis(x) cout << #x << ": " << x << endl;
int dx[8] = {2, 1, -1, -2, -2, -1, 1, 2};
int dy[8] = {1, 2, 2, 1, -1, -2, -2, -1};

using namespace std;
#define  N   1234
#define  eps 1e-8
#define  pi  acos(-1.0)
#define  inf 0XFFFFFFFll
#define  mod 1000000007ll
#define  LL  long long
#define  ULL unsigned long long

int gp, gc, gf;
int p[N], c[N], f[N];
int n;

int Main() {
    freopen("new_years_resolution.txt", "r", stdin);
    freopen("out.txt", "w", stdout);
    ios_base::sync_with_stdio(0);

    int T;
    cin >> T;

    FOR(_T, T) {
    	cin >> gp >> gc >> gf;
    	cin >> n;

    	REP(i, n)
    		cin >> p[i] >> c[i] >> f[i];

    	bool yes = false;

    	REP(s, 1<<n) {
    		int tp = 0, tc = 0, tf = 0;
    		REP(i, n) if ((s >> i) & 1) {
    			tp += p[i];
    			tc += c[i];
    			tf += f[i];
    		}
    		if (tp == gp && tc == gc && tf == gf) {
    			yes = true;
    			break;
    		}
    	}

    	printf("Case #%d: ", _T);
    	puts(yes ? "yes" : "no");

    }


    return 0;
}


int main() {
    return Main();
}
