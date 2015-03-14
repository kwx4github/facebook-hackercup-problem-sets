#include <iostream>
#include<cmath>
#include<cstdio>
#include<cstring>
#include<algorithm>
#include<vector>
#include<stack>
#include<queue>

using namespace std;






main()
{

   // freopen("a.txt","r",stdin);
    // freopen("b.txt","w",stdout);
    int T,cased=0;
    string s,mn,mn2,mx;
    cin>>T;
    while(T--)
    {
        cin>>s;
       char m='9',m2='9',mm='0';
       int pm=0,pn=0,pn2;
       mn=mn2=s;
       mx=s;
       bool pos=true;
       for(int i=0;i<s.size();i++)if(mn[i]<=m){if(mn[i]=='0' and pos){m2=m;pn2=pn; pos=false;}  m=mn[i];  pn=i;  }
       for(int i=0;i<s.size();i++)if(mn[i]>'0' and mn[i]>mm){mm=mn[i];  pm=i;}
       swap(mx[0],mx[pm]);
       if(m=='0' and s.size()>1)
       {
           swap(mn[0],mn[pn2]);
           swap(mn2[1],mn2[pn]);
           mn=min(mn,mn2);
       }
       else swap(mn[0],mn[pn]);
       printf("Case #%d: ",++cased);
       cout<<mn<<" "<<mx<<endl;

    }



}
