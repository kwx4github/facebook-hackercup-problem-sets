import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.util.Locale;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.FileOutputStream;
import java.util.StringTokenizer;

/**
 * Built using CHelper plug-in
 * Actual solution is at the top
 */
public class Main {
	public static void main(String[] args) {
		Locale.setDefault(Locale.US);
		InputStream inputStream;
		try {
			inputStream = new FileInputStream("cookingthebooks.txt");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		OutputStream outputStream;
		try {
			outputStream = new FileOutputStream("cookingthebooks.out");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		InputReader in = new InputReader(inputStream);
		PrintWriter out = new PrintWriter(outputStream);
		CookingTheBooks solver = new CookingTheBooks();
		int testCount = Integer.parseInt(in.next());
		for (int i = 1; i <= testCount; i++)
			solver.solve(i, in, out);
		out.close();
	}
}

class CookingTheBooks {
    public void solve(int testNumber, InputReader in, PrintWriter out) {
        long n = in.nextLong();
        int []ap = new int[String.valueOf(n).length()];
        int g = ap.length - 1;
        long max = n, min = n;
        while (n > 0){
            ap[g--] = (int) (n % 10);
            n /= 10;
        }
        g = ap.length;
        for (int i = 0; i < g; i++) {
            for (int j = i + 1; j < g; j++) {
                swap(ap,i,j);
                max = check(max,ap,true,g);
                if (i != 0 || (i == 0 && ap[i] != 0))
                    min = check(min,ap,false,g);
                swap(ap,i,j);
            }
        }
        out.print("Case #"+testNumber+": "+min+" "+max+"\n");
    }

    private long check(long max, int[] ap, boolean b, int g) {
        long t = 0;
        for (int i = 0; i < g; i++) {
            t = t*10 + ap[i];
        }
        if (b) max = Math.max(max,t);
        if (!b) max = Math.min(max,t);
        return max;
    }

    void swap(int []a,int from, int to){
        int t = a[to];
        a[to] = a[from];
        a[from] = t;
    }
}

class InputReader {
    public BufferedReader reader;
    public StringTokenizer tokenizer;

    public InputReader(InputStream stream) {
        reader = new BufferedReader(new InputStreamReader(stream));
        tokenizer = null;
    }

    public String next() {
        while (tokenizer == null || !tokenizer.hasMoreTokens()) {
            try {
                tokenizer = new StringTokenizer(reader.readLine());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return tokenizer.nextToken();
    }

    public long nextLong(){
        return Long.parseLong(next());
    }


}

