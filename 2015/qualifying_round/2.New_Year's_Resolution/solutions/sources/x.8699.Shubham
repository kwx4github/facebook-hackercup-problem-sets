/**
 *
 * @author Shubham
 */

import java.util.Scanner;

class New_Year_Resolution 
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        for(int i=0;i<t;i++)
        {
            int ap = sc.nextInt();
            int ac = sc.nextInt();
            int af = sc.nextInt();
            int n = sc.nextInt();
            int food[][] = new int[n][3];
            for(int j=0;j<n;j++)
            {
                food[j][0] = sc.nextInt();
                food[j][1] = sc.nextInt();
                food[j][2] = sc.nextInt();
            }
            System.out.print("Case #" +(i+1) +": ");
            int f[][] = new int[n][3];
            int k=0;
            for(int j=0;j<n;j++)
            {
                if((food[j][0]<=ap) && (food[j][1]<=ac) && (food[j][2]<=af))
                {
                    f[k][0] = food[j][0];
                    f[k][1] = food[j][1];
                    f[k][2] = food[j][2];
                    k++;
                }
            }
            int sap=0,sac=0,saf=0;
            for(int j=0;j<k;j++)
            {
                sap += f[j][0];
                sac += f[j][1];
                saf += f[j][2];
            }
            if((sap<ap) || (sac<ac) || (saf<af))
                System.out.println("no");
            else
                System.out.println("yes");
        }
    }
}
