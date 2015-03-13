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

const int MOD = int(1e9) + 7;
void madd(int &a, int b) { if ((a += b) >= MOD) a -= MOD; }

void solve() {
  int maxa, maxb;
  scanf("%d-%d", &maxa, &maxb);
  assert(0 <= maxa && 0 <= maxb && maxa > maxb);
  forn (ty, 2) {
    vvi dyn(maxa + 1, vi(maxb + 1));
    dyn[0][0] = 1;
    forn (a, maxa + 1)
    forn (b, maxb + 1)
    forn (k, 2) {
      int na = a + (k == 0);
      int nb = b + (k == 1);
      if (na > maxa || nb > maxb) continue;

      bool ok = false;
      if (ty == 0) {
        ok = na > nb;
      } else {
        ok = na <= nb || nb == maxb;
      }
      if ((na == maxa && nb == maxb) || ok) {
        madd(dyn.at(na).at(nb), dyn.at(a).at(b));
      }
    }
    printf("%d%c", dyn[maxa][maxb], "\n "[ty + 1 < 2]);
  }
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

