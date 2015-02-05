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

int need[10], sum[10];
int a[100][10];

inline void solve() {
    for (int i = 0; i < 3; ++i) {
        scanf("%d", &need[i]);
    }
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < 3; ++j) {
            scanf("%d", &a[i][j]);
        }
    }
    bool can = false;
    for (int i = 0; i < (1 << n); ++i) {
        for (int j = 0; j < 3; ++j) {
            sum[j] = 0;
        }
        for (int j = 0; j < n; ++j) {
            if ((i & (1 << j)) != 0) {
                for (int z = 0; z < 3; ++z) {
                    sum[z] += a[j][z];
                }
            }
        }
        bool fl = true;
        for (int j = 0; j < 3; ++j) {
            if (need[j] != sum[j]) {
                fl = false;
                break;
            }
        }
        if (fl) {
            can = true;
            break;
        }
    }
    if (can) {
        puts("yes");
    } else {
        puts("no");
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