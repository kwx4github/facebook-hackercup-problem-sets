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

const int inf = int(1e9);

vvi chi;
vvi dyn, dynexc;

void calc(int v) {
  for (int x : chi[v]) {
    calc(x);
  }
  int maxc = sz(chi[v]) + 1;
  if (v != 0) maxc++;
  // maxc - degree of 'v' plus one

  dyn[v] = vi(maxc + 1, 0);
  vi toadd(maxc + 1, 0);
  for (int x : chi[v]) {
    for (int subc = 1; subc < sz(dynexc[x]) && subc <= maxc; subc++) {
      if (subc > 1) {
        toadd[subc] -= dynexc[x][subc - 1];
      }
      toadd[subc] += dynexc[x][subc];
    }
  }
  for (int col = 1; col <= maxc; col++) {
    dyn[v][col] = dyn[v][col - 1] + toadd[col] + 1;
  }

  vi ld(maxc + 2, inf), rd(maxc + 2, inf);
  for (int col = 1; col <= maxc; col++) {
    ld[col] = min(ld[col - 1], dyn[v][col]);
  }
  for (int col = maxc; col >= 1; col--) {
    rd[col] = min(rd[col + 1], dyn[v][col]);
  }

  dynexc[v] = vi(maxc + 2, inf);
  for (int col = 1; col <= maxc; col++) {
    dynexc[v][col] = min(ld[col - 1], rd[col + 1]);
  }
  dynexc[v][maxc + 1] = ld[maxc];
}

void solve() {
  int n;
  scanf("%d", &n);
  chi = vvi(n);
  forn (i, n) {
    int p;
    scanf("%d", &p), p--;
    assert((p < 0) == (i == 0));
    if (p >= 0) {
      chi[p].pb(i);
    }
  }
  dyn = vvi(n);
  dynexc = vvi(n);
  calc(0);
  printf("%d\n", dynexc[0].back());
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
