#include<bits/stdc++.h>
using namespace std;

struct node {
int A;
int B;
int C;
}p[21];

bool checkSum( int n, node sum)
{
  if(sum.A==0 && sum.B==0 && sum.C==0)
  {
    return true;
  }

  if(n>=0)
  {
  if(p[n].A>sum.A || p[n].B>sum.B || p[n].C>sum.C)
  {
    return checkSum(n-1, sum );
  }
  node temp;
  temp.A = sum.A - p[n].A, temp.B = sum.B - p[n].B, temp.C = sum.C - p[n].C;
  return checkSum(n-1,  sum) || checkSum(n-1,  temp);
  }
  else return false;
}

int main()
{
  int test;
  cin>>test;
  for(int j=0;j<test;j++)
  {
    node sum;
    cin>>sum.A>>sum.B>>sum.C;
    int n;
    cin>>n;
    for(int i=0;i<n;i++)
    {
      // int u,v,w;
      cin>>p[i].A>>p[i].B>>p[i].C;
      
    }
   if(checkSum(n-1, sum))
    cout<<"Case #"<<j+1<<":"<<" yes"<<endl;

    else cout<<"Case #"<<j+1<<":"<<" no"<<endl;
   
  }
}