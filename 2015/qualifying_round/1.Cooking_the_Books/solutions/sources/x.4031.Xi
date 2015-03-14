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

char s[N];

int Main() {
    freopen("cooking_the_books.txt", "r", stdin);
    freopen("out.txt", "w", stdout);
    ios_base::sync_with_stdio(0);

    int T;
    RD(T);

    FOR(_T, T) {
    	scanf("%s", s);
    	int len = strlen(s);
    	int u = 0, v = 0;
    	REP(i, len) if (s[i] != '0') {
    		if (s[i] >= s[u])
    			u = i;
    		if (s[i] <= s[v])
    			v = i;
    	}
    	printf("Case #%d: ", _T);

    	swap(s[0], s[v]);
    	printf("%s ", s);
    	swap(s[0], s[v]);
    	swap(s[0], s[u]);
    	printf("%s\n", s);

    }


    return 0;
}


int main() {
    return Main();
}
