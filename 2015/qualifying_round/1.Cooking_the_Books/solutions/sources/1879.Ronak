#include <bits/stdc++.h>
using namespace std;

int main()
{
  // freopen("test.txt","w", stdout);
  int test;
  cin>>test;
  for(int k=1;k<=test;k++){
  string s;
  string tamp = "0";
  cin>>s;
  string mini = max(s,tamp);string maxi =max(s,tamp);
  for(int i=0;i<(int)s.size();i++)
  {
    for(int j=i+1;j<(int)s.size();j++)
    {
      if(s[i]>=s[j])
      {
        string you(s);
        swap(you[i],you[j]);
        if(you[0] == '0') continue;
        mini = min(mini, you);
      }
      else if(s[i]<s[j])
      {
        string you(s);
        swap(you[i],you[j]);
        maxi = max(maxi, you);
      }
    }

  }

  cout<<"Case #"<<k<<": "<<mini<<" "<<maxi<<endl;

}

}