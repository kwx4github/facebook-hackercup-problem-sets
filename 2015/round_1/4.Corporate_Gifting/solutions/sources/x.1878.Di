import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.StringTokenizer;

public class Main {
    static int[][] dp;

    static int solve(int[][] manage, int node, int parentValue) {
        if (dp[node][parentValue] == -1) {
            int res = Integer.MAX_VALUE;
            for (int i = 1; i <= 3; ++i) {
                if (i == parentValue) {
                    continue;
                }
                int temp = i;
                for (int child : manage[node]) {
                    temp += solve(manage, child, i);
                }
                res = Math.min(res, temp);
            }
            dp[node][parentValue] = res;
        }

        return dp[node][parentValue];
    }

    static int solve(int[][] manage, int root) {
        return solve(manage, 0, 0);
    }

    public static void main(String[] args) throws Exception {

        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            int N = scan.nextInt();
            int[] report = new int[N];
            int[] count = new int[N];
            for (int i = 0; i < N; ++i) {
                report[i] = scan.nextInt() - 1;
            }
            for (int i = 1; i < N; ++i) {
                ++count[report[i]];
            }
            int[][] manage = new int[N][];
            for (int i = 0; i < N; ++i) {
                manage[i] = new int[count[i]];
            }
            for (int i = 1; i < N; ++i) {
                manage[report[i]][--count[report[i]]] = i;
            }
            dp = new int[manage.length][4];
            for (int[] arr : dp) {
                Arrays.fill(arr, -1);
            }

            for (int i = N - 1; i >= 0; --i) {
                for (int j = 0; j < 4; ++j) {
                    solve(manage, i, j);
                }
            }

            int res = solve(manage, 0);
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
