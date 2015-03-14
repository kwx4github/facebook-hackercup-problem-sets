#include "iostream"
#include "sstream"
#include "fstream"
#include "string"
#include "vector"

using namespace std;

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);

	long testCase, caseCount = 1, dim, i, j, ii, jj, newSize;
	vector<string> data;
	string str,temp,min,max;
	int gotIt = -1;
	
	cin >> testCase;

	while(caseCount <= testCase)
	{

		cin >> str;

		min = str;
		max = str;
		for(i=0;i<str.length();i++)
		{
			for(j=i+1;j<str.length();j++)
			{
				if(i==0 && str[j]=='0')
				{
					continue;
				}

				char c = str[j];
				str[j] = str[i];
				str[i] = c;

				if(str>max)
					max = str;
				if(str<min)
					min = str;

				c = str[j];
				str[j] = str[i];
				str[i] = c;
			}
		}
		
		cout << "Case #" << caseCount << ": " << min << " " << max << endl;
		caseCount++;
	}

}