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

struct Node {
  int ne[26];
  int subCnt;
  bool fin;

  Node() {
    memset(ne, -1, sizeof ne);
    subCnt = 0;
    fin = false;
  }
};

const int MAXL = int(1e6) + 100;

void solve() {
  vector<Node> ns(1);

  int n;
  scanf("%d", &n);
  int totans = 0;
  forn (wid, n) {
    static char buf[MAXL + 1];
    scanf("%s", buf);

    int v = 0;
    int l = strlen(buf);
    vi seq;
    forn (i2, l) {
      int c = buf[i2] - 'a';
      assert(0 <= c && c < 26);
      seq.pb(v);
      if (ns[v].ne[c] < 0) {
        ns[v].ne[c] = sz(ns);
        ns.pb(Node());
      }
      v = ns[v].ne[c];
    }
    seq.pb(v);
    if (!ns[v].fin) {
      ns[v].fin = true;
      for (int x : seq)
        ns[x].subCnt++;
    }
    int ans = 0;
    for (int i2 = 1; i2 < sz(seq); i2++) {
      ans++;
      if (ns[seq[i2]].subCnt == 1) {
        break;
      }
    }
    totans += ans;
  }
  printf("%d\n", totans);
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
