#include <stdio.h>
#include <string.h>

const int MAX_SIZE = 10000001;
int flags[MAX_SIZE];
const int MAX_BASE = 10;
int array[MAX_BASE][MAX_SIZE];
int cursors[MAX_BASE];

int find_le(int key, const int* base, int length)
{
  int count = length;
  int low = 0;
  while (0 < count)
  {
    int step = count/2;
    if (base[low+step] < key) {
      low += step+1;
      count -= step+1;
    }
    else count=step;
  }

  return low;
}


int find_gt(int key, const int* base, int length)
{
  int count = length;
  int low = 0;
  while (0 < count)
  {
    int step = count/2;
    if (!(key < base[low+step]))
    {
      low += step+1;
      count -= step+1;
    }
    else count=step;
  }

  return low;
}

int main(void)
{
  memset(flags, 0, sizeof(flags));
  memset(array, 0, sizeof(array));
  memset(cursors, 0, sizeof(cursors));

  int i = 2;
  while (i*i  < MAX_SIZE)
  {
    for (int c = 2, idx = 2*i; idx < MAX_SIZE; c++, idx = c*i)
    {
      flags[idx]++;
    }

    do
    {
      i++;
    } while ((i*i < MAX_SIZE) && flags[i]);
  }

  for (int i = 2; i < MAX_SIZE; i++)
  {
    int idx = (flags[i] ? flags[i] : 1);
    array[idx][cursors[idx]] = i;
    cursors[idx]++;
  }

  int c;
  scanf("%d\n", &c);
  for (int i = 1; i <= c; i++)
  {
    int a, b, k;
    scanf("%d %d %d\n", &a, &b, &k);
    printf("Case #%d: ", i);
    if (k < MAX_BASE)
    {
      printf("%d\n", find_gt(b, array[k], cursors[k]) - find_le(a, array[k], cursors[k]));
    }
    else
    {
      printf("0\n");
    }
  }

  return 0;
}

