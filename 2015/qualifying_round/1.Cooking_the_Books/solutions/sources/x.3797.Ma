#include <cstdio>
#include <cstring>
#include <algorithm>

bool is_small(int len, const char* a, const char* b)
{
  for (int i = 0; i < len; i++)
  {
    if (a[i] < b[i])
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  return false;
}

int main(void)
{
  int c;
  scanf("%d\n", &c);
  for (int i = 1; i <= c; i++)
  {
    char a[100];
    gets(a);
    int len = strlen(a);

    if (1 == len)
    {
      printf("Case #%d: %s %s\n", i, a, a);
      continue;
    }

    int ones[len];
    ones[len-1] = 1;
    ones[len-2] = 1;
    char b[100];
    char c[100];
    strcpy(b, a);
    strcpy(c, a);

    do
    {
      for (int j = 0; j < len; j++)
       {
        if (1 == ones[j])
        {
          for (int k = j+1; k < len; k++)
          {
            if (1 == ones[k])
            {
              char d[100];
              strcpy(d, a);
              char tmp = d[j];
              d[j] = d[k];
              d[k] = tmp;
              if (is_small(len, c, d))
              {
                strcpy(c, d);
              }

              if (('0' != d[0]) && is_small(len, d, b))
              {
                strcpy(b, d);
              }
              break;
            }
          }
          break;
        }
      }
    } while (std::next_permutation(ones, ones+len));

    printf("Case #%d: %s %s\n", i, b, c);
  }
}