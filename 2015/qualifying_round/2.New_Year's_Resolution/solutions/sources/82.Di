import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.InputMismatchException;
import java.util.StringTokenizer;

public class Main {

    private static void swap(char[] arr, int i, int j) {
        char temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public static void main(String[] args) throws Exception {
        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            int GP = scan.nextInt();
            int GC = scan.nextInt();
            int GF = scan.nextInt();
            int N = scan.nextInt();
            int[] P = new int[N];
            int[] C = new int[N];
            int[] F = new int[N];
            for (int i = 0; i < N; ++i) {
                P[i] = scan.nextInt();
                C[i] = scan.nextInt();
                F[i] = scan.nextInt();
            }

            boolean find = false;
            int limit = 1 << N;
            for (int state = 0; state < limit; ++state) {
                int SP = 0, SC = 0, SF = 0;
                for (int i = 0; i < N; ++i) {
                    if ((state & (1 << i)) != 0) {
                        SP += P[i];
                        SC += C[i];
                        SF += F[i];
                    }
                }
                if (SP == GP && SC == GC && SF == GF) {
                    find = true;
                    break;
                }
            }

            System.out.println(String.format("Case #%d: %s", taskIndex, find ? "yes" : "no"));
        }
    }
}

class FastScanner {
    BufferedReader in;
    StringTokenizer tok;

    public FastScanner(InputStream in) {
        this.in = new BufferedReader(new InputStreamReader(in));
        tok = new StringTokenizer("");
    }

    private String tryReadNextLine() {
        try {
            return in.readLine();
        } catch (Exception e) {
            throw new InputMismatchException();
        }
    }

    public String nextToken() {
        while (!tok.hasMoreTokens()) {
            tok = new StringTokenizer(next());
        }
        return tok.nextToken();
    }

    private String next() {
        String newLine = tryReadNextLine();
        if (newLine == null)
            throw new InputMismatchException();
        return newLine;
    }

    public int nextInt() {
        return Integer.parseInt(nextToken());
    }

    public double nextDouble() {
        return Double.parseDouble(nextToken());
    }

    public long nextLong() {
        return Long.parseLong(nextToken());
    }

}
