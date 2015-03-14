#include<bits/stdc++.h>
using namespace std;
int coin1[21];
int coin2[21];
int coin3[21];

int dp[21][30005];

int use1[21];
int use2[21];
int use3[21];
int n;
int call(int i,int make1,int make2,int make3,int k,int l,int m)
{
    if(i>=n) {
        if(make1==0 && make2==0 && make3==0) return 1;
        else return 0;
    }
    if(dp[i][make1]!=-1) return dp[i][make1];
    int ret1=0,ret2=0;
    if((make1-coin1[i]>=0&&k<use1[i])&&(make2-coin2[i]>=0&&l<use2[i])&&(make3-coin3[i]>=0&&m<use3[i]))
    {
        k++; l++; m++;
        int x=make1-coin1[i];
        int y=make2-coin2[i];
        int z=make3-coin3[i];
        ret1=call(i,x,y,z,k,l,m);
    }
    k=0;l=0;m=0;
    ret2=call(i+1,make1,make2,make3,k,l,m);
    dp[i][make1]=ret1|ret2;
    return dp[i][make1];
}


int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    int i,j,c,a,b,m,t;
    int make1;
    int make2;
    int make3;
    cin>>t;
    for(int d=1;d<=t;d++)
    {
        cin>>make1>>make2>>make3;
        cin>>n;
        for(i=0;i<n;i++)
        {
            cin>>coin1[i]>>coin2[i]>>coin3[i];
            use1[i]=1; use2[i]=1; use3[i]=1;
        }
        memset(dp,-1,sizeof(dp));
        a=0;
        a=call(0,make1,make2,make3,0,0,0);

        if(a!=0) cout<<"Case #"<<d<<": yes"<<endl;
        else cout<<"Case #"<<d<<": no"<<endl;
    }
    return 0;
}

