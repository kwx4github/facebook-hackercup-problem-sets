#include<iostream>
#include<fstream>
#include<string>
#include<vector>
#include<algorithm>
#include<memory>
using namespace std;

struct Node
{
	bool usedYet;
	Node* nextList;
	vector<string> wordsInNodeArrayUsed;
	string quickWord;

	Node()
	{
		usedYet = false;
		nextList = NULL;
		wordsInNodeArrayUsed.clear();
		quickWord = "";
	}

	//return how many it had to go in (***minus one, depth not zero index based***)
	int insert(string word, int depth)
	{
		if (word == quickWord)
			return depth;

		//fix?


		char curLetter = word[depth - 1];
		if (usedYet == false)
		{
			usedYet = true;
			nextList = new Node[26];
			quickWord = word;
			return depth;
		}
		else
		{


			if (quickWord != "" && quickWord.size() > depth)
			{
				nextList[quickWord[depth] - 'a'].insert(quickWord, depth + 1);
				quickWord = "";
			}

			if (depth == word.size())//entire word must be used
			{
				return depth;
			}
			else
				return nextList[word[depth] - 'a'].insert(word, depth + 1);
		}
	}
};



int main()
{
	int numOfCases;

	ifstream fin("input.txt");
	//ifstream fin("largeInputTest.txt");
	ofstream fout("output.txt");

	fin >> numOfCases;
	int numOfWords;

	string word;

	Node* orgArray;

	int lettersNeededToType;

	for (int i = 0; i < numOfCases; ++i)
	{
		fin >> numOfWords;
		lettersNeededToType = 0;
		orgArray = new Node[26]; //memory leak, whatever

		for (int j = 0; j < numOfWords; ++j)
		{
			fin >> word;
			lettersNeededToType += orgArray[word[0] - 'a'].insert(word, 1);
		}

		cout << "Case #" << i + 1 << ": " << lettersNeededToType << endl;
		fout << "Case #" << i + 1 << ": " << lettersNeededToType << endl;
	}





	return 0;
}