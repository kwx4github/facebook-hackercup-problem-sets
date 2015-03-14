import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.Queue;
import java.util.StringTokenizer;
import java.util.concurrent.LinkedBlockingDeque;

public class Main {

    private static int[] dx = new int[] { -1, 0, 1, 0 };
    private static int[] dy = new int[] { 0, 1, 0, -1 };
    private static HashMap<Character, Integer> directions;
    static {
        directions = new HashMap<>();
        directions.put('^', 0);
        directions.put('>', 1);
        directions.put('v', 2);
        directions.put('<', 3);
    }

    static class Node {
        int x;
        int y;
        int d;

        public Node(int x, int y, int d) {
            this.x = x;
            this.y = y;
            this.d = d;
        }
    }

    private static int solve(char[][] map, int M, int N) {
        boolean[][][] ban = new boolean[M][N][4];
        int sx = -1, sy = -1;
        int gx = -1, gy = -1;
        for (int i = 0; i < M; ++i) {
            for (int j = 0; j < N; ++j) {
                if (map[i][j] == 'S') {
                    sx = i;
                    sy = j;
                } else if (map[i][j] == 'G') {
                    gx = i;
                    gy = j;
                }
                if (!directions.containsKey(map[i][j])) {
                    continue;
                }
                int init = directions.get(map[i][j]);
                for (int k = 0; k < 4; ++k) {
                    int direction = (init + k) % 4;
                    int nx = i + dx[direction];
                    int ny = j + dy[direction];
                    while (nx >= 0 && nx < M && ny >= 0 && ny < N && map[nx][ny] != '#'
                            && !directions.containsKey(map[nx][ny])) {
                        ban[nx][ny][k] = true;
                        nx += dx[direction];
                        ny += dy[direction];
                    }
                }
            }
        }

        boolean[][][] visited = new boolean[M][N][4];
        int[][][] dist = new int[M][N][4];
        for (int i = 0; i < M; ++i) {
            for (int j = 0; j < N; ++j) {
                for (int k = 0; k < 4; ++k) {
                    dist[i][j][k] = Integer.MAX_VALUE;
                }
            }
        }
        Queue<Node> queue = new LinkedBlockingDeque<>();
        visited[sx][sy][0] = true;
        dist[sx][sy][0] = 0;
        queue.offer(new Node(sx, sy, 0));
        while (!queue.isEmpty()) {
            Node current = queue.poll();
            int nd = (current.d + 1) % 4;
            int nv = dist[current.x][current.y][current.d] + 1;
            for (int i = 0; i < 4; ++i) {
                int nx = current.x + dx[i];
                int ny = current.y + dy[i];
                if (nx < 0 || nx >= M || ny < 0 || ny >= N || map[nx][ny] == '#' || directions.containsKey(map[nx][ny])) {
                    continue;
                }
                if (!visited[nx][ny][nd] && !ban[nx][ny][nd]) {
                    dist[nx][ny][nd] = nv;
                    visited[nx][ny][nd] = true;
                    queue.offer(new Node(nx, ny, nd));
                }
            }
        }

        int res = Integer.MAX_VALUE;
        for (int i = 0; i < 4; ++i) {
            res = Math.min(res, dist[gx][gy][i]);
        }
        return res == Integer.MAX_VALUE ? -1 : res;
    }

    public static void main(String[] args) throws Exception {
        FastScanner scan = new FastScanner(System.in);
        int taskCount = scan.nextInt();
        for (int taskIndex = 1; taskIndex <= taskCount; ++taskIndex) {
            int M = scan.nextInt();
            int N = scan.nextInt();
            char[][] map = new char[M][];
            for (int i = 0; i < M; ++i) {
                map[i] = scan.nextToken().toCharArray();
            }
            int res = solve(map, M, N);
            if (res == -1) {
                System.out.println(String.format("Case #%d: impossible", taskIndex));
            } else {
                System.out.println(String.format("Case #%d: %d", taskIndex, res));
            }
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
