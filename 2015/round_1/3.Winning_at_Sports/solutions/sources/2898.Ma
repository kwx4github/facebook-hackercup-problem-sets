#include <stdio.h>
#include <string.h>

const int MAX_SIZE = 2001;
const int MOD = 1000000007;

int smooth[MAX_SIZE][MAX_SIZE];
int stress[MAX_SIZE][MAX_SIZE];

int main(void)
{
  memset(smooth, 0, sizeof(smooth));
  for (int i = 1; i < MAX_SIZE; i++)
  {
    smooth[i][0] = 1;
  }

  for (int i = 2; i < MAX_SIZE; i++)
  {
    for (int j = 1; j < i; j++)
    {
      smooth[i][j] = smooth[i-1][j] + smooth[i][j-1];
      smooth[i][j] %= MOD;
    }
  }

  memset(stress, 0, sizeof(stress));
  for (int y = 0; y < MAX_SIZE; y++)
  {
    stress[0][y] = 1;
  }

  for (int x = 1; x < MAX_SIZE; ++x)
  {
    for (int y = x; y < MAX_SIZE; ++y)
    {
      stress[x][y] = stress[x-1][y] + stress[x][y-1];
      stress[x][y] %= MOD;
    }
  }

  int c;
  scanf("%d\n", &c);
  for (int i = 1; i <= c; i++)
  {
    int self, opp;
    scanf("%d-%d\n", &self, &opp);
    printf("Case #%d: %d %d\n", i, smooth[self][opp], stress[opp][opp]);
  }
}

