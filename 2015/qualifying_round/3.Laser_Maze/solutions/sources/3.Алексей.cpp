#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <ctime>
#include <cstring>
#include <cassert>
#include <algorithm>
#include <vector>
#include <set>
#include <map>
#include <bitset>
#include <stack>
#include <queue>
#include <deque>
#include <complex>

using namespace std;

#define pb push_back
#define mp make_pair
#define sz(s) int((s).size())
#define len(s) int((s).size())
#define all(s) (s).begin(), (s).end()
#ifdef _WIN32 || _WIN64
#define LLD "%I64d"
#else
#define LLD "%lld"
#endif
#ifdef LOCAL42
#define eprintf(...) fprintf(stderr, __VA_ARGS__)
#else
#define eprintf(...) 42
#endif
#define y0 yy0
#define y1 yy1
#define next _next
#define prev _prev
#define rank _rank
#define link _link
#define hash _hash
#define fs first
#define sc second

typedef long long ll;
typedef long long llong;
typedef long long int64;
typedef unsigned int uint;
typedef long double ld;
typedef unsigned long long ull;
typedef unsigned long long ullong;
typedef unsigned long long lint;
typedef pair<int, int> pii;
typedef vector<int> vi;

const int inf = int(1e9);
const double eps = 1e-9;
const double pi = 4 * atan(double(1));
const int N = 111;
const int dx[] = { -1, 0, 1, 0 };
const int dy[] = { 0, 1, 0, -1 };

int n, m;
int d[N][N][4];
bool can[4][N][N];
int q[N * N * 4];
char a[N][N];

inline bool good(int x, int y) {
    return x >= 0 && x < n && y >= 0 && y < m;
}

inline int get_dir(char ch) {
    if (ch == '^') {
        return 0;
    }
    if (ch == '>') {
        return 1;
    }
    if (ch == 'v') {
        return 2;
    }
    if (ch == '<') {
        return 3;
    }
    return -1;
}

inline void solve() {
    scanf("%d %d", &n, &m);
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            scanf(" %c", &a[i][j]);
        }
    }
    int x1 = -1, y1 = -1, x2 = -1, y2 = -1;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (a[i][j] == 'S') {
                x1 = i;
                y1 = j;
                a[i][j] = '.';
            }
            if (a[i][j] == 'G') {
                x2 = i;
                y2 = j;
                a[i][j] = '.';
            }
        }
    }
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < n; ++j) {
            for (int z = 0; z < m; ++z) {
                can[i][j][z] = (a[j][z] == '.');
            }
        }
        for (int j = 0; j < n; ++j) {
            for (int z = 0; z < m; ++z) {
                int dir = get_dir(a[j][z]);
                if (dir == -1) {
                    continue;
                }
                dir = (dir + i) % 4;
                int x = j + dx[dir], y = z + dy[dir];
                while (good(x, y) && a[x][y] == '.') {
                    can[i][x][y] = false;
                    x += dx[dir];
                    y += dy[dir];
                }
            }
        }
    }
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            for (int z = 0; z < 4; ++z) {
                d[i][j][z] = inf;
            }
        }
    }
    d[x1][y1][0] = 0;
    int l = 0, r = 3;
    q[0] = x1;
    q[1] = y1;
    q[2] = 0;
    while (l < r) {
        int x = q[l++], y = q[l++], s = q[l++];
        for (int i = 0; i < 4; ++i) {
            int nx = x + dx[i], ny = y + dy[i], ns = (s + 1) % 4;
            if (good(nx, ny) && can[ns][nx][ny] && d[nx][ny][ns] > d[x][y][s] + 1) {
                d[nx][ny][ns] = d[x][y][s] + 1;
                q[r++] = nx;
                q[r++] = ny;
                q[r++] = ns;
            }
        }
    }
    int ans = inf;
    for (int i = 0; i < 4; ++i) {
        ans = min(ans, d[x2][y2][i]);
    }
    if (ans == inf) {
        puts("impossible");
    } else {
        printf("%d\n", ans);
    }
}

int main() {
#ifdef LOCAL42
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
#else
    
#endif
    int t;
    cin >> t;
    for (int i = 0; i < t; ++i) {
        printf("Case #%d: ", i + 1);
        solve();
    }
    return 0;
}