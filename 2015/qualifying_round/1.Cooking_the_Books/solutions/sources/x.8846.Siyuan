#include <iostream>
#include <cstdio>
#include <string>
#include <algorithm>
using namespace std;

void do_it_small(string &str, int start, int n)
{
	if(start == n-1)  // single character, already done
		return;
	int i1 = start;  // smallest digits index of str[start, END]
	for(int i = n-1; i >= start; i--)
	{
		if(str[i] < str[i1])
			i1 = i;
	}
	if(start == 0 && str[i1] == '0')
	{
		i1 = start;
		for(int i = n-1; i >= start; i--)
		{
			if(str[i] != '0' && str[i] < str[i1])
				i1 = i;
		}

	}
	if(i1 > start)
		swap(str[start], str[i1]);
	else
		do_it_small(str, start+1, n);
}

void do_it_big(string &str, int start, int n)
{
	if(start == n-1)
		return;
	int i2 = start;  //	biggest digits index of str[start, END]
	for(int i = n-1; i >= start; i--)
	{
		if(str[i] > str[i2])
			i2 = i;
	}
	if(i2 > start)
		swap(str[i2], str[start]);
	else
		do_it_big(str, start+1, n);

}

int main(int argc, char *argv[])
{
	int N;
	int digits;
	int len;
	string small_str, big_str;
	scanf("%d", &N);
	for(int i = 1; i <= N; i++)
	{
		scanf("%d", &digits);
		small_str = big_str = to_string(digits);
		len = small_str.size();
		do_it_small(small_str, 0, len);
		do_it_big(big_str, 0, len);
		cout << "Case #" << i << ": " << small_str << " " << big_str << endl;
	}
	return 0;
}
