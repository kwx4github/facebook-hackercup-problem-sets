#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <cmath>
#include <ctime>
#include <algorithm>
#include <vector>
#include <string>
#include <queue>
#include <deque>
#include <list>
#include <set>
#include <map>

using namespace std;

#define pb push_back
#define mp make_pair
#define eprintf(...) fprintf(stderr, __VA_ARGS__)
#define sz(x) ((int)(x).size())
#define forn(i, n) for (int i = 0; i < (n); i++)

typedef long long ll;
typedef vector<ll> vll;
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<bool> vb;
typedef vector<vb> vvb;
typedef pair<int, int> pii;

const int MAXN = int(1e7) + 100;
int myp[MAXN + 1];
vi ps;

int cnts[MAXN + 1];
vvi byCnts;

void precalc() {
  forn (i, MAXN + 1) {
    myp[i] = i;
  }
  for (int i = 2; i <= MAXN; i++) {
    if (myp[i] == i) {
      ps.pb(i);
    }
    for (int x : ps) {
      if (x > myp[i]) break;
      ll ne = ll(i) * x;
      if (ne > MAXN) break;
      myp[ne] = x;
    }
  }
  for (int i = 2; i <= MAXN; i++) {
    int x = myp[i];
    int prev = i / x;
    if (prev == 1) {
      cnts[i] = 1;
    } else {
      cnts[i] = cnts[prev] + (myp[prev] > x);
    }
  }
  int mv = *max_element(cnts, cnts + MAXN + 1);
  byCnts = vvi(mv + 1);
  for (int i = 2; i <= MAXN; i++) {
    byCnts[cnts[i]].pb(i);
  }
}

void solve() {
  int a, b, k;
  scanf("%d%d%d", &a, &b, &k);
  if (k >= sz(byCnts)) {
    printf("0\n");
    return;
  }
  vi &x = byCnts[k];
  printf("%d\n", upper_bound(x.begin(), x.end(), b) - lower_bound(x.begin(), x.end(), a));
}

int main(int argc, char* argv[]) {
  assert(argc <= 3);
  if (argc == 3) {
    assert(freopen(argv[1], "r", stdin));
    assert(freopen(argv[2], "w", stdout));
  } else {
    string filename = ".in";
    if (argc >= 2) filename = argv[1];

    assert(freopen(filename.c_str(), "r", stdin));

    if (filename.length() >= 3 && string(filename, filename.length() - 3, 3) == ".in") {
      filename = string(filename, 0, filename.length() - 3);
    }
    filename += ".out";
    assert(freopen(filename.c_str(), "w", stdout));
  }

  int TN;
  char buf[16];
  assert(fgets(buf, sizeof buf, stdin));
  assert(sscanf(buf, "%d", &TN) >= 1);
  precalc();
  for (int TID = 1; TID <= TN; TID++)
    try {
      eprintf("===== Solving test case #%d =====\n", TID);
      printf("Case #%d: ", TID);
      solve();
    } catch (...) {
      eprintf("Exception was caught while executing on test #%d\n", TID);
      return 1;
    }
  return 0;
}
