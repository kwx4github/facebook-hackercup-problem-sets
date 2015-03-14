import java.io.*;
import java.util.Arrays;
public class FHC15{
    FHC15() throws IOException, FileNotFoundException
    {
        
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = null;
        String nc = br.readLine();
        int count=1;
        char temp;
        while((line = br.readLine()) != null)
        {
            String ch = line;//"35421"
           // System.out.println(line);
             long num = Long.valueOf(line);
                if(num == 0)
                {
                    System.out.println("Case "+"#"+count+": "+num+" "+num);
                    count++;
                }
                else
                {
                    String copy = ch;
                    char[] ret = ch.toCharArray();//['3','5','4','2','1']
                    char[] ret1 = ch.toCharArray();
                    char[] ret2 = ch.toCharArray();
                    Arrays.sort(ret);
                    int leng = ret.length;
                    int digit,min=0;
                    for(int k=0;k<leng;k++)
                    {
                        digit = Character.getNumericValue(ret[k]);
                        if(digit==0)
                            continue;
                        else
                        {
                            min=k;
                            break;
                        }
                    }
                    char maxs = ret[leng-1];
                    char mins = ret[min];
                    //System.out.println("Case "+"#"+count+": "+" "+"minimum"+mins+" "+"maximum"+maxs);
                    
                    for(int s=0; s<ret1.length; s++){
                        if(ret[leng-1]==ret1[s])
                        {
                            ret1[s] = ret1[0];
                            ret1[0] = ret[leng-1];
                        }
                     }
                     String max1 = String.valueOf(ret1);
                     //minimun
                    for(int s=0; s<ret2.length; s++){
                        if(mins==ret2[s] && ret.length > 2 )
                        {
                            temp = ret2[0];
                            ret2[0] = mins;
                            ret2[s] = temp;
                            //ret2[0] = ret2[s];
                        }
                     }
                     String max2 = String.valueOf(ret2);
                    System.out.println("Case "+"#"+count+": "+ max2+" "+max1);
                    count++;
                }
            }
        br.close();
        }
    public static void FHC15 (String args[]) throws FileNotFoundException, IOException
    {
        new FHC15();
    }
}
