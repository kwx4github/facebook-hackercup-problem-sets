import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.FilenameFilter;
import java.util.Locale;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.FileOutputStream;
import java.io.File;
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
			final String regex = "homework.*[.]txt";
			File directory = new File(".");
			File[] candidates = directory.listFiles(new FilenameFilter() {
				public boolean accept(File dir, String name) {
					return name.matches(regex);
				}
			});
			File toRun = null;
			for (File candidate : candidates) {
				if (toRun == null || candidate.lastModified() > toRun.lastModified())
					toRun = candidate;
			}
			inputStream = new FileInputStream(toRun);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		OutputStream outputStream;
		try {
			outputStream = new FileOutputStream("homework.out");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		InputReader in = new InputReader(inputStream);
		PrintWriter out = new PrintWriter(outputStream);
		Homework solver = new Homework();
		int testCount = Integer.parseInt(in.next());
		for (int i = 1; i <= testCount; i++)
			solver.solve(i, in, out);
		out.close();
	}
}

class Homework {
    static final int MAX = (int) 1e7 + 1;
    int[] primacity;

    public Homework() {
        primacity = new int[MAX];
        int[] divisor = new int[MAX];
        for (int i = 2; i < MAX; ++i) if (divisor[i] == 0) {
            divisor[i] = i;
            for (int j = i * 2; j < MAX; j += i)
                if (divisor[j] == 0) divisor[j] = i;
        }
        for (int i = 1; i < MAX; ++i) {
            int tmp = i;
            while (tmp > 1) {
                int cur = divisor[tmp];
                while (tmp % cur == 0) tmp /= cur;
                ++primacity[i];
            }
            if (primacity[i] == 0) {
                if (i != 1) throw new RuntimeException();
            }
        }
    }

    public void solve(int testNumber, InputReader in, PrintWriter out) {
        int a = in.nextInt();
        int b = in.nextInt();
        int k = in.nextInt();
        int res = 0;
        for (int x = a; x <= b; ++x)
            if (primacity[x] == k) ++res;
        out.println("Case #" + testNumber + ": " + res);
    }
}

class InputReader {
    public BufferedReader reader;
    public StringTokenizer tokenizer;

    public InputReader(InputStream stream) {
        reader = new BufferedReader(new InputStreamReader(stream), 32768);
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

    public int nextInt() {
        return Integer.parseInt(next());
    }

}

