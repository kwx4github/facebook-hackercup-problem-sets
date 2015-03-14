#include<bits/stdc++.h>
using namespace std;
int main()
{
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    long long int i,j,a,k,n,t,m,b,d;
    string s,c,big,sml;
    char ch;
    cin>>t;
    for(k=1;k<=t;k++)
    {
        cin>>s;
        int mx=-1,mn=11;
        bool ok=false;
        c=s;
        int p1,p2;
        for(i=0;i<s.size();i++)
        {
            p1=i;p2=i;
            a=s[i]-'0';
            mn=a;
            for(j=s.size()-1;j>i;j--)
            {
                b=s[j]-'0';
                if(b<mn)
                {
                    if(b==0 && p1==0) continue;
                    mn=b;
                    ok=true;
                    p2=j;
                }
            }
            if(p2==p1) continue;
            ch=c[p1];
            c[p1]=c[p2];
            c[p2]=ch;
            sml=c;
            break;
        }
        if(ok==false) sml=s;
        ok=false;
        c=s;
        for(i=0;i<s.size();i++)
        {
            p1=i; p2=i;
            a=s[i]-'0';
            mx=a;
            for(j=s.size()-1;j>i;j--)
            {
                b=c[j]-'0';
                if(b>mx)
                {
                    if(b==0 && p1==0 ) continue;
                    mx=b;
                    ok=true;
                    p2=j;
                }
            }
            if(p1==p2) continue;
            ch=c[p1];
            c[p1]=c[p2];
            c[p2]=ch;
            big=c;
            break;
        }
        if(ok==false) big=s;
        cout<<"Case #"<<k<<": "<<sml<<" "<<big<<endl;
    }
    return 0;
}
