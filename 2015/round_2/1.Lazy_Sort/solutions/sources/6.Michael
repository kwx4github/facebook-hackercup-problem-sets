import java.io.InputStreamReader;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.FileInputStream;
import java.util.StringTokenizer;
import java.io.InputStream;

/**
 * Built using CHelper plug-in
 * Actual solution is at the top
 */
public class Main {
	public static void main(String[] args) {
		InputStream inputStream;
		try {
			inputStream = new FileInputStream("lazysort.in");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		OutputStream outputStream;
		try {
			outputStream = new FileOutputStream("lazysort.out");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		InputReader in = new InputReader(inputStream);
		PrintWriter out = new PrintWriter(outputStream);
		LazySort solver = new LazySort();
		int testCount = Integer.parseInt(in.next());
		for (int i = 1; i <= testCount; i++)
			solver.solve(i, in, out);
		out.close();
	}
}

class LazySort {
    public void solve(int testNumber, InputReader in, PrintWriter out) {
        int n = in.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = in.nextInt();
        }
        boolean answer = solveIt(a);
        out.println("Case #" + testNumber + ": " + (answer ? "yes" : "no"));
    }

    private boolean solveIt(int[] a) {
        return solveIt1(a, a[0], 1, a.length) || solveIt1(a, a[a.length - 1], 0, a.length - 1);
    }

    private boolean solveIt1(int[] a, int value, int from, int to) {
        int bottom = value, top = value;
        while (from < to) {
            if (a[from] == bottom - 1) {
                --bottom;
                ++from;
                continue;
            }
            if (a[from] == top + 1) {
                ++top;
                ++from;
                continue;
            }
            if (a[to - 1] == bottom - 1) {
                --bottom;
                --to;
                continue;
            }
            if (a[to - 1] == top + 1) {
                ++top;
                --to;
                continue;
            }
            return false;
        }
        return true;
    }
}

class InputReader {
    BufferedReader br;
    StringTokenizer st;

    public InputReader(InputStream stream) {
        br = new BufferedReader(new InputStreamReader(stream));
    }

    public String next() {
        return nextToken();
    }

    public String nextToken() {
        while (st == null || !st.hasMoreTokens()) {
            String line = null;
            try {
                line = br.readLine();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (line == null) {
                return null;
            }
            st = new StringTokenizer(line);
        }
        return st.nextToken();
    }

    public int nextInt() {
        return Integer.parseInt(nextToken());
    }

}

