#include <bits/stdc++.h>

using namespace std;

#define LL long long int

int main(){



    freopen("inn.txt", "r", stdin);
    freopen("out.txt", "w", stdout);

    int i,t,j,k , caseno = 0;
    int n , a, b,c;
    string s , ss;

    scanf("%d",&t); //getchar();

    while(t--){


       cin>>s;



       if ( s[0] == '0'){

          printf("Case #%d: 0 0\n",++caseno); continue;

       }


        ss = s;

        int x, y ,f ,ze , on , zpos , onpos;

        a = 0 , b = 0 ;
        x = y = ze = on = 99999;


    vector<string> v1 , v2;

    for(i = s.size() - 1 ;i >=0 ;i--){

         for(j = i - 1 , onpos = -1 ,a  = s[i]- 48 ;j>=0 ;j-- ){

             if(s[i] == '0' && j ==0)continue;

             if( (s[j] - 48) > a  ){
                //a = s[j] - 48;
                onpos = j;
            }
         }
        if(onpos == -1)
            v1.push_back(s);
        else{
        swap( s[i] , s[onpos] );
        v1.push_back(s);
        swap( s[i] , s[onpos] );
        }

    }

    for(i = s.size() - 1 ;i >=0 ;i--){

         for(j = i - 1 , onpos = -1 ,a  = s[i]- 48 ;j>=0 ;j-- ){

             if(s[i] == '0' && j ==0)continue;

             if( (s[j] - 48) < a  ){
                //a = s[j] - 48;
                onpos = j;
            }
         }
        if(onpos == -1)
            v2.push_back(s);
        else{
        swap( s[i] , s[onpos] );
        v2.push_back(s);
        swap( s[i] , s[onpos] );
        }

    }

   sort(v2.begin() , v2.end());
   sort(v1.begin() , v1.end());

   cout<<"Case #"<<++caseno<<": "<< v1[0]<<" "<<v2[v2.size() - 1]<<endl;




       // printf("Case #%d: %s %s\n",++caseno , ss.c_str() , s.c_str() );

    }


}
