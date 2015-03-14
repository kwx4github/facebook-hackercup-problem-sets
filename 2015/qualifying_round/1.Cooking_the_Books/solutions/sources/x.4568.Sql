#include<iostream>
#include<string>
#include<algorithm>
#include<cstdio>
using namespace std;
bool f(int i, int j) { return i<j&&i!='0'; }

int main()
{
    freopen("in.txt","r",stdin);
    freopen("w.txt","w",stdout);
    int tc;
    cin>>tc;
    for(int t=1;t<=tc;t++){
        string max,min,in;
        cin>>in;
        min=max=in;
        int x=max_element(in.begin(),in.end())-in.begin();;
        int n=min_element(in.begin(),in.end(),f)-in.begin();
        swap(max[0],max[x]);
        swap(min[0],min [n]);
        cout<<"Case #"<<t<<": "<<min <<" "<<max<<endl;;

            }
}
