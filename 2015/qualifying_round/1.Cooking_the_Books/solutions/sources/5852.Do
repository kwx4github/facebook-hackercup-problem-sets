/*
*   make by Do Viet Anh
*/
#include <iostream>
#include <cstdio>

#include <algorithm>
#include <cstring>
#include <cmath>
#include <stack>
#include <queue>
#include <map>

#define For(i,a,b) for(int i = int(a); i <= int(b); i++)
#define Ford(i,b,a) for(int i = int(b); i >= int(a); i--)
#define rep(i,n) for(int i = 0; i < int(n); i++)
#define repd(i,n) for(int i = int(n)-1; i >= 0; i--)
#define MP make_pair
#define VI vector<int>
#define PII pair<int, int>
typedef long long llint;
const long double pi = cos(-1);
using namespace std;


#define IN "input.txt"
#define OUT "output.txt"
int main(){
    freopen(IN,"r",stdin);
    freopen(OUT,"w",stdout);
    //code
    llint f[20], a;
    int n;
    f[1] = 1;
    for(int i = 2; i < 17; i++)f[i] = f[i-1] * 10;
    cin>>n;
    for(int i = 0; i < n; i++){
        cin>>a;
        llint res_min, res_max, tmp = a;
        int na = 0;
        while(tmp>0){tmp/=10; na++;}
        //cout<<na<<endl;
        res_min = res_max = a;
        for(int j = 1; j <= na; j++)
            for(int k = j+1; k <= na; k++){
                //cout<<a<<" "<<a/f[j]<<" "<<a/f[k]<<endl;
                int c1 = a/f[j] % 10;
                int c2 = a/f[k] % 10;
                tmp = a + c2*f[j] + c1 * f[k] - c1 * f[j] - c2*f[k];
                //cout<<c1<<" "<<c2<<" "<<j<<" "<<k<<" "<<tmp<<endl;
                if(tmp>res_max)res_max = tmp;
                if(tmp>=f[na]&&tmp<res_min)res_min=tmp;
            }
        cout<<"Case #"<<i+1<<": "<<res_min<<" "<<res_max<<endl;
    }
    return 0;
}
