#include<stdio.h>
int main()
{
    int t,flag,mi,m,ma,n,temp,i,j,flag1,x;
    scanf("%d",&t);
    x=t;
    char a[12],b[12],c[12];
    while(t--)
    {
        scanf("%s",a);
        mi=a[0];
        ma=a[0];
        for(i=0;a[i]!='\0';i++)
        {
            b[i]=a[i];
            c[i]=a[i];
            if(a[i]<=mi && a[i]!='0')
            {
                mi=a[i];
                m=i;
            }
            if(a[i]>=ma)
            {
                ma=a[i];
                n=i;
            }
        }

        b[i]='\0';
        c[i]='\0';
        flag1=0;
        flag=0;
        if(a[0]==mi)
        {
            if(a[1]!='\0')
            {
                for(i=1; a[i+1]!='\0';i++)
                {
                    mi=a[i];
                    for(j=i+1;a[j]!='\0';j++)
                    {

                        if(a[j]<=mi)
                        {
                            mi=a[j];
                            m=j;
                            flag1=1;
                        }

                    }
                    if(mi!=a[i])
                    {
                        if(flag1==1)
                        {
                            temp=c[i];
                            c[i]=c[m];
                            c[m]=temp;
                            break;
                        }

                    }
                    else
                        flag1=0;

                }

            }
        }
        else
        {
            temp=a[0];
            c[0]=c[m];
            c[m]=temp;
        }
        if(a[0]==ma)
        {
            if(a[1]!='\0')
            {
                for(i=1; a[i+1]!='\0';i++)
                {
                    ma=a[i];
                    for(j=i+1;a[j]!='\0';j++)
                    {

                        if(a[j]>=ma)
                        {
                            ma=a[j];
                            n=j;
                            flag=1;
                        }

                    }
                    if(ma!=a[i])
                    {
                        if(flag==1)
                        {
                            temp=b[i];
                            b[i]=b[n];
                            b[n]=temp;
                        }
                    }
                }
            }
        }
        else
        {
            temp=a[0];
            b[0]=b[n];
            b[n]=temp;
        }
        printf("Case #%d: %s %s\n",x-t,c,b);
    }
    return 0;
}
