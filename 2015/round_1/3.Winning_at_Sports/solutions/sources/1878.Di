import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.InputMismatchException;
import java.util.StringTokenizer;

public class Main {

    static final long MOD = 1000000007;
    static long[][] C;

    static void init() {
        C = new long[5000][5000];
        for (int i = 0; i < 5000; ++i) {
            C[i][0] = C[i][i] = 1;
            for (int j = 1; j < i; ++j) {
                C[i][j] = (C[i - 1][j - 1] + C[i - 1][j]) % MOD;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        init();
        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            String[] parts = scan.nextToken().split("-");
            int my = Integer.parseInt(parts[0]);
            int opposite = Integer.parseInt(parts[1]);
            long stressFree;
            long stressFul;
            if (opposite == 0) {
                stressFree = stressFul = 1;
            } else {
                stressFree = (MOD + C[my + opposite - 1][opposite] - C[my + opposite - 1][opposite - 1]) % MOD;
                stressFul = (MOD + C[opposite + opposite][opposite] - C[opposite + opposite][opposite - 1]) % MOD;
            }
            System.out.println(String.format("Case #%d: %d %d", taskIndex, stressFree, stressFul));
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
