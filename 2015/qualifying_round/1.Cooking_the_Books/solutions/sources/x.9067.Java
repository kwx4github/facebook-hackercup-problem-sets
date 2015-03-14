import java.io.IOException;

/**
 * Created by kaaveh on 1/9/15.
 */
public class Main {
    public static void main(String[] args) {

        kaaveh in = new kaaveh();

        int num = in.kint();
        for (int i=0 ; i<num; i++){
            int max=0 , min =0;
            String data = in.kLine(12);
            char MAX = data.charAt(0);
            char MIN = data.charAt(0);

            for (byte j=1 ; j<data.length(); j++) {
                if (MAX < data.charAt(j)) {
                    max = j;
                    MAX = data.charAt(j);
                }
                if (MIN > data.charAt(j) && data.charAt(j) != '0') {
                    min = j;
                    MIN = data.charAt(j);
                }
            }

            System.out.print("Case #" + (i+1) + ": " + MIN);
                for (byte k=1; k<data.length(); k++){
                    if (k == min){
                        System.out.print(data.charAt(0));
                        continue;
                    }
                    System.out.print(data.charAt(k));
                }
                System.out.print(" " + MAX);

                for (byte k=1; k<data.length(); k++){
                    if (k == max){
                        System.out.print(data.charAt(0));
                        continue;
                    }
                    System.out.print(data.charAt(k));
                }
                System.out.println();
        }
    }
}

class kaaveh{
    static String kLine (int maxLg)
    {
        byte lin[] = new byte [maxLg];
        int lg = 0, car = -1;
        String line = "";

        try
        {
            while (lg < maxLg)
            {
                car = System.in.read();
                if ((car < 0) || (car == '\n')) break;
                lin [lg++] += car;
            }
        }
        catch (IOException e)
        {
            return (null);
        }

        if ((car < 0) && (lg == 0)) return (null);  // eof
        return (new String (lin, 0, lg));
    }

    static String knex (int maxLg)
    {
        byte lin[] = new byte [maxLg];
        int lg = 0, car = -1;
        String line = "";

        try
        {

            while ((car < 0) || (car == '\n') || (car == ' ') || (car == '\t') || (car == '\r'))
                car = System.in.read();

            while (lg < maxLg)
            {
                if ((car < 0) || (car == '\n') || (car == ' ') || (car == '\t') || (car == '\r')) break;
                lin [lg++] += car;
                car = System.in.read();
            }
        }
        catch (IOException e)
        {
            return (null);
        }

        if ((car < 0) && (lg == 0)) return (null);  // eof
        return (new String (lin, 0, lg));
    }

    static int kint()
    {
        return Integer.parseInt(knex(11));
    }

    static long kLong()
    {
        return Long.parseLong(knex(20));
    }

    static double kdouble()
    {
        return Double.parseDouble(knex(100));
    }
}
