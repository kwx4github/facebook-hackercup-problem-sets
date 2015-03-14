#include<iostream>
#include<cstdio>
using namespace std;
int two(int x)
{
    int z=1;
    for(int i=0;i<x;i++)
        z*=2;
    return z;
}
int main()
{
    freopen("b.txt","r",stdin);
    freopen("o.txt","w",stdout);

	int t,i,j,n,a[30][3],x,y,z,flag,s1,s2,s3;
	cin>>t;
	for(int tc=1;tc<=t;tc++)
        {
        cin>>x>>y>>z>>n;
        for(i=0;i<n;i++)
        {
            for(j=0;j<3;j++)
               cin>>a[i][j];
        }
        flag=0;
        s1=s2=s3=0;
        for(i=1;i<two(n);i++)
        {
            s1=s2=s3=0;
            for(j=0;j<n;j++)
            {
                if(i&(1<<j))
                {
                    s1=s1+a[j][0];
                    s2=s2+a[j][1];
                    s3=s3+a[j][2];

                }
            }

                if(s1==x && s2==y && s3==z)
                {

                    flag=1;
                    break;
                }

        }

            if(flag==1)
                cout<<"Case #"<<tc<<": yes\n";
            else cout<<"Case #"<<tc<<": no\n";


    }

}


