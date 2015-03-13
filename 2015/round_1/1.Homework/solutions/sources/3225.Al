#include<bits/stdc++.h>
using namespace std;
#define MAX 10000020
long long int p[10002000];
bool num[10002000];
void seiev()
{
    long long int i,j;
    for(i=0;i<=MAX;i++) {num[i]=true; p[i]=0; }
    num[1]=false;
    for(i=2;i<=MAX;i+=2) {p[i]++;}
    for(i=4;i<=MAX;i+=2) num[i]=false;
    for(i=3;i<=MAX;i+=2)
    {
        if(num[i]==true)
        {
            p[i]++;
            for(j=i+i;j<=MAX;j+=i)
            {
                p[j]++;
                num[j]=false;
            }
        }
    }
}

int main()
{
    long long int k,i,j,a,b,n,t,c;
    int Case=1;
    seiev();
    freopen("input_1.txt","r",stdin);
    freopen("output_1.txt","w",stdout);
    cin>>t;
    while(t--)
    {
        cin>>a>>b>>k;
        int cnt=0;
        for(i=a;i<=b;i++)
        {
            if(p[i]==k) cnt++;
        }
        cout<<"Case #"<<Case++<<": "<<cnt<<endl;
    }
    return 0;
}
