#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
#include <string>
#include <vector>
#include <stack>
#include <queue>
#include <set>
#include <map>
#include <time.h>
#include <cctype>
#include <functional>
#include <deque>
#include <iomanip>
#include <bitset>
#include <assert.h>
#include <numeric>
#include <sstream>
#include <utility>

#define pb push_back
#define mp make_pair
#define fi first
#define se second
#define ranges(a,b) for(int i = a; i <= b; i ++)
#define ll long long
using namespace std;

struct trie
{
    trie *next[26];
    void init() {
        for(int i = 0; i < 26; i ++) next[i] = NULL;
    }
}*root,e[1000010];
char s[1100010];
int cnt;

void init()
{
    cnt = 1;
    e[0].init();
    root = &e[0];
}

int insert()
{
    int ans = -1;
    trie *p = root;
    for(int i = 0; s[i]; i ++) {
        int idx = s[i] - 'a';
        if(!p->next[idx]) {
            if(ans == -1) ans = i + 1;
            e[cnt].init();
            p->next[idx] = &e[cnt ++];
        }
        p = p->next[idx];
    }
    if(ans == -1) ans = strlen(s);
    return ans;
}

        
int main()
{
    freopen("autocomplete.txt","r",stdin);
    freopen("autocomplete.out","w",stdout);
    int t;
    scanf("%d",&t);
    for(int cas = 1; cas <= t; cas ++) {
        init();
        int n;
        scanf("%d",&n);
        long long ans = 0;
        while(n --) {
            scanf("%s",s);
            ans += insert();
        }
        printf("Case #%d: %lld\n",cas,ans);
    }
    return 0;
}
