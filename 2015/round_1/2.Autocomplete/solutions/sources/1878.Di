import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.InputMismatchException;
import java.util.StringTokenizer;
import java.util.TreeSet;

public class Main {

    static boolean check(String target, String cmp, int prefix) {
        if (cmp.length() < prefix) {
            return true;
        } else {
            return !target.substring(0, prefix).equals(cmp.substring(0, prefix));
        }
    }

    public static void main(String[] args) throws Exception {

        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            int N = scan.nextInt();
            String[] words = new String[N];
            for (int i = 0; i < N; ++i) {
                words[i] = scan.nextToken();
            }
            TreeSet<String> sorted = new TreeSet<String>();
            int res = 0;
            for (int i = 0; i < N; ++i) {
                int len = 1;
                while (len < words[i].length()) {
                    if (sorted.floor(words[i]) != null && !check(words[i], sorted.floor(words[i]), len)) {
                    } else if (sorted.ceiling(words[i]) != null && !check(words[i], sorted.ceiling(words[i]), len)) {
                    } else {
                        break;
                    }
                    ++len;
                }
                res += len;
                sorted.add(words[i]);
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
