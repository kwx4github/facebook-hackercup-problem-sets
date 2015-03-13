import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.InputMismatchException;
import java.util.StringTokenizer;

public class Main {

    static int[][] dp;
    static int[] primes;

    static void initPrimes() {
        boolean[] notPrime = new boolean[3200];
        notPrime[0] = notPrime[1] = true;
        int N = notPrime.length - 2;
        for (int i = 2; i < notPrime.length; ++i) {
            if (notPrime[i]) {
                continue;
            }
            int next = i + i;
            boolean find = false;
            while (next < notPrime.length) {
                if (!notPrime[next]) {
                    notPrime[next] = true;
                    --N;
                    find = true;
                }
                next += i;
            }
            if (!find) {
                break;
            }
        }
        primes = new int[N];
        for (int i = 2, j = 0; i < notPrime.length; ++i) {
            if (!notPrime[i]) {
                primes[j++] = i;
            }
        }
    }

    static void init() {
        initPrimes();
        int N = 10000000;
        dp = new int[N + 1][9];
        for (int i = 2; i <= N; ++i) {
            System.arraycopy(dp[i - 1], 0, dp[i], 0, 9);
            int distinct = 0;
            int value = i;
            for (int j = 0; j < primes.length && value > 1; ++j) {
                if (value % primes[j] == 0) {
                    ++distinct;
                    while (value % primes[j] == 0) {
                        value /= primes[j];
                    }
                }
            }
            ++dp[i][distinct];
        }
    }

    public static void main(String[] args) throws Exception {
        init();

        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            int A = scan.nextInt();
            int B = scan.nextInt();
            int K = scan.nextInt();
            int res;
            if (K > 8) {
                res = 0;
            } else {
                res = dp[B][K] - dp[A - 1][K];
            }
            System.out.println(String.format("Case #%d: %d", taskIndex, res));
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
