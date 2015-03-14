package test;
import java.util.*;
import java.util.Arrays.*;
import java.io.*;
import java.io.BufferedReader;
import java.math.*;
import java.lang.*;

public class Main {

    public static void main(String[] args) {
        new Main().test();
    }

    public void test() {
        BufferedReader in = null;
        BufferedWriter out = null;

        try{
            in = new BufferedReader(new FileReader("cooking_the_books.txt"));
            out = new BufferedWriter(new FileWriter("output.txt"));
            int T = Integer.parseInt(in.readLine());
            System.out.println("T="+T);
            for(int i=0;i<T;i++){
                System.out.print("Case #"+(i+1)+":");
                out.write("Case #"+(i+1)+":");

                String N = in.readLine();
           
                int len = N.length();
                int[] num = new int[len];
                for(int a=0;a<len;a++){
                    num[a] = Integer.parseInt(""+N.charAt(a));
                }
                int[] sml = Arrays.copyOf(num,len);
                int[] lar = Arrays.copyOf(num,len);
                int[] sorted = Arrays.copyOf(num,len);
                Arrays.sort(sorted);
                int z0 = 0;
                for(int a=0;a<len;a++){
                    if(sorted[a]==0){
                        z0++;
                    }
                }
                if(len>1&&z0>0){
                    int t = sorted[z0];
                    sorted[z0] = 0;
                    sorted[0] = t;
                }
                for(int a=0;a<len;a++){
                    if(sorted[a]!=sml[a]){
                        for(int b=len-1;b>=0;b--){
                            if(sml[b]==sorted[a]){
                                int tmp = sml[b];
                                sml[b] = sml[a];
                                sml[a] = tmp;
                                break;
                            }
                        }
                        break;
                    }
                }

                Arrays.sort(sorted);
                int[] sorted2 = new int[len];
                for(int a=len-1;a>=0;a--){
                   sorted2[len-a-1] = sorted[a]; 
                }

                for(int a=0;a<len;a++){
                    if(sorted2[a]!=lar[a]){
                        for(int b=len-1;b>=0;b--){
                            if(lar[b]==sorted2[a]){
                                int tmp = lar[a];
                                lar[a] = lar[b];
                                lar[b] = tmp;
                                break;
                            }
                        }
                        break;
                    }
                }

                String rs = "";
                for(int a=0;a<len;a++){
                    rs = rs + sml[a];
                }
                rs = rs + " ";
                for(int a=0;a<len;a++){
                    rs = rs + lar[a];
                }
                System.out.print(" "+rs+"\n");
                out.write(" "+rs+"\n");
            }

            in.close();
            out.close();
        }catch(Exception e){
            e.printStackTrace();
            try{
                in.close();
                out.close();
            }catch(Exception ee){
                ee.printStackTrace();
            }
        }
        System.out.print("Done!\n");
    }
}
