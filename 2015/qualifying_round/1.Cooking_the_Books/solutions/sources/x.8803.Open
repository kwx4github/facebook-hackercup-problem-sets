
#include<bits/stdc++.h>

using namespace std;

int main()
{
    int test,i,j;
     vector<int>v;
     vector<int>q;
    vector<int>s;

    string a;
     freopen("input.txt","r",stdin);
	freopen("output.txt","w",stdout);
    cin>>test;
    for(i=1;i<=test;i++)
    {   cin>>a;
        for(j=0;j<a.length();j++)
        {
            v.push_back(a[j]-'0');
            q.push_back(a[j]-'0');
            s.push_back(a[j]-'0');
           // cout<<v[j]<<endl;
        }
        int maxi=0,posmax,zero,z=0;
        int mini=9999999999, posmin;

        for(j=0;j<v.size();j++)
        {
            if(v[j]==0)
            {
                zero=j;
                z++;
            }

            if(v[j]>0 && v[j]>=maxi)
            {
                maxi=v[j];
                posmax=j;
            }
            if(v[j]>0 && v[j]<=mini)
            {
                mini=v[j];
                posmin=j;
            }
            if(v[0]==0 && v.size()==1)
            {
                mini=0;
                maxi=0;
                posmax=0;
                posmin=0;
            }

        }
        int u=v.size()-1;


        if(v[0]==0 && v.size()==1)
            {
                maxi=0;
                swap(q[0],q[posmin]);
                swap(s[0],s[posmax]);
            }
        else if(v[0]==mini && z>0)
        {
            swap(q[1],q[zero]);
        }

         if(v[1]!=0 )
            swap(q[0],q[posmin]);
        if(v[1]!=0 )
            swap(s[0],s[posmax]);
        for(j=0;j<v.size();j++)
        {
            if(v[j]==0)
              {swap(s[j],s[u]);
            //u--;
            }

        }

        cout<<"Case #"<<i<<": ";
        for(j=0;j<v.size();j++)
        {
        cout<<q[j];
        }
        cout<<" ";

        for(j=0;j<v.size();j++)
        {
        cout<<s[j];
        }
    cout<<endl;
    v.clear();
    q.clear();
    s.clear();
    }

return 0;

}
