//2**20 is small, and 6 minutes is a long time :P

#include <iostream>

using namespace std;

int main() {
    int T; cin >> T;
    for (int i = 1; i <= T; ++i) {
        cout << "Case #" << i << ": ";
        int Gp, Gc, Gf; cin >> Gp >> Gc >> Gf;
        int N; cin >> N;
        int * P = new int[N];
        int * C = new int[N];
        int * F = new int[N];
        for (int j = 0; j < N; ++j) cin >> P[j] >> C[j] >> F[j];
        bool possible = false;
        for (int sub = 0; sub < (1 << N); ++sub) {
            int tmp = sub;
            int p = 0, c = 0, f = 0;
            for (int k = 0; k < N; ++k) {
                if (tmp & 1) {
                    p += P[k]; c += C[k]; f += F[k];
                }
                tmp >>= 1;
            }
            possible = possible | ((p == Gp) && (c == Gc) && (f == Gf));
        }
        if (possible) cout << "yes";
        else cout << "no";
        cout << endl;
    }
    return 0;
}
