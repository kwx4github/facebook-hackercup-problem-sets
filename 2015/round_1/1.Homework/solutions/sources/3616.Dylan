#include <stdio.h>

using namespace std;

int main() {
    bool * nums = new bool[10000001];
    int * prim = new int[10000001];
    nums[0] = nums[1] = true;
    prim[0] = prim[1] = 0;
    int p = 0;
    while (p < 3200) {
        while (nums[p]) ++p;
        for (int i = p; i < 10000001; i += p) {
            nums[i] = true;
            ++prim[i];
        }
        ++p;
    }    
    for (++p; p < 10000001; p += 2) {
        if (!nums[p]) {
            for (int i = p; i < 10000001; i += p) ++prim[i];
        }
    }
    int T; scanf("%d\n", &T);
    for (int c = 1; c <= T; ++c) {
        int A, B, K;
        scanf("%d %d %d\n", &A, &B, &K);
        int num = 0;
        for (int i = A; i <= B; ++i) {
            if (prim[i] == K) ++num;
        }
        printf("Case #%d: %d\n", c, num);
    }
    return 0;
}
