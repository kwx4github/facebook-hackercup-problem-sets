/**
 *
 * @author Shubham
 */
import static java.lang.Math.pow;
import java.util.Scanner;

class Cooking_Books 
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        for(int i=0;i<t;i++)
        {
            int n = sc.nextInt();
            swap(n,i);
        }
    }
    
    static void swap(int n,int i)
    {
        int digit[] = new int[10];
        int size = 0;
        for(int j=0;j<10;j++)
        {
            digit[j]=n%10;
            n/=10;
            size++;
            if(n==0)
                break;
        }
        int ddigit[] = new int[size];
        for(int j=0;j<size;j++)
        {
            ddigit[j] = digit[j];
        }
        print_small(digit,i,size);
        System.out.print(" ");
        print_large(ddigit,size);
        System.out.println();
    }
    
    static void print_small(int a[],int i,int size)
    {
        System.out.print("Case #" +(i+1) +": ");
        int small=9,j,pos=0;
        for(j=0;j<size;j++)
        {
            if((small>a[j]) && (a[j]!=0))
            {
                small=a[j];
                pos = j;
            }
        }
        a[pos]=a[size-1];
        a[size-1]=small;
        int no = 0;
        for(j=(size-1);j>=0;j--)
        {
            no += (int) (a[j] * pow(10,j));
        }
        System.out.print(no);
    }
    
    static void print_large(int b[],int size)
    {
        int large=0,j,loc=0;
        for(j=0;j<size;j++)
        {
            if((large<b[j]) && (b[j]!=0))
            {
                large=b[j];
                loc = j;
            }
        }
        b[loc]=b[size-1];
        b[size-1]=large;
        int noo = 0;
        for(j=(size-1);j>=0;j--)
        {
            noo += (int) (b[j] * pow(10,j));
        }
        System.out.print(noo);
    }
}
