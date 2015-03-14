#include <cstdio>

struct food
{
  int p, c, f;
};

int main(void)
{
  int c;
  scanf("%d\n", &c);
  for (int i = 1; i <= c; i++)
  {
    food all;
    scanf("%d %d %d\n", &all.p, &all.c, &all.f);
    int n;
    scanf("%d\n", &n);
    food f[n];
    for (int j = 0; j < n; j++)
    {
      scanf("%d %d %d\n", &f[j].p, &f[j].c, &f[j].f);
    }

    bool yes = false;
    for (int j = 1; j < 1<<n; j++)
    {
      food tmp;
      tmp.p = tmp.c = tmp.f = 0;
      for (int k = 0, value = j; k < n; k++, value /= 2)
      {
        if (1 == value % 2)
        {
          tmp.p += f[k].p;
          tmp.c += f[k].c;
          tmp.f += f[k].f;
        }
      }

      if ((tmp.p == all.p) && (tmp.c == all.c) && (tmp.f == all.f))
      {
        yes = true;
        break;
      }
    }

    printf("Case #%d: ", i);
    if (yes)
    {
      printf("yes\n");
    }
    else
    {
      printf("no\n");
    }
  }

  return 0;
}