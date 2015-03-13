#include<iostream>
#include<fstream>

using namespace std;

const int primSize = 10000000 - 2;

int main()
{
	ifstream fin("inputPrim.txt");
	ofstream fout("outputFile.txt");

	unsigned int num;

	unsigned int* primArray = new unsigned int[primSize];

	for (int i = 2; i <= 10000000; ++i)
	{
		fin >> num;
		primArray[i] = num;
	}

	if (!fin)
	{
		cout << "error find inputPrim";
	}

	fin.close();

	fin.open("input.txt");

	unsigned int numOfCases;
	fin >> numOfCases;

	unsigned int leftBound, rightBound, K;

	unsigned int kCounter;

	for (unsigned int i = 0; i < numOfCases; ++i)
	{
		fin >> leftBound;
		fin >> rightBound;
		fin >> K;

		kCounter = 0;

		for (unsigned int j = leftBound; j <= rightBound; ++j)
		{
			if (primArray[j] == K)
				++kCounter;
		}

		fout << "Case #" << i + 1 << ": " << kCounter << endl;
		cout << "Case #" << i + 1 << ": " << kCounter << endl;
	}
	





	return 0;
}