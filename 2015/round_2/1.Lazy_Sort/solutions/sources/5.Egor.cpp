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

bool can(vi &as) {
  const int n = sz(as);

  int vl = as[0], vr = as[0];
  int l = 1, r = n - 1;
  while (l <= r) {
    if (as[l] == vl - 1) { vl--; l++; continue; }
    if (as[l] == vr + 1) { vr++; l++; continue; }
    if (as[r] == vl - 1) { vl--; r--; continue; }
    if (as[r] == vr + 1) { vr++; r--; continue; }
    return false;
  }
  assert(vl == 0 && vr == n - 1);
  return true;
}

void solve() {
  int n;
  scanf("%d", &n);
  vi as(n);
  for (int &x : as) scanf("%d", &x), x--;

  if (can(as)) {
    printf("yes\n");
    return;
  }
  reverse(as.begin(), as.end());
  if (can(as)) {
    printf("yes\n");
    return;
  }
  printf("no\n");
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