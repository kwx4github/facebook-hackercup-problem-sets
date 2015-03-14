#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>

using namespace std;

int n;
string *a;

void readf(){
	ifstream fi ("cooking_the_books.txt");
	fi>>n;
	a = new string[n];
	for (int i=0; i<n; i++) fi>>a[i];
	fi.close();
}

bool check(string s){
	int n = s.length();
	for (int i=1; i<n; i++)
		if (s[i]=='.') i++;
		else if ((s[0]>s[i]) || (s[0]!=s[i])) return false;
	return true;	
}

string xl(string s){
	int index = s.find('.');
	if (index!=-1) s.erase(index);
	int l=s.length();
	int index2 = 0;
	char max = s[0];
	for (int i=1; i<l; i++)
		if (s[i]>=max) {
			max = s[i];	
			index2 = i;
		}
	char temp = s[0];
	s[0] = max;
	s[index2] = temp;
	if (index!=-1) s.insert(index,".");
	return s+"";		
}

void process(){
	ofstream fo ("cooking_the_books.out.txt");
	for (int i=0; i<n; i++){
		string s = a[i];
		if (check(s)) {
			fo<<"Case #"<<i+1<<": "<<a[i]<<" "<<a[i]<<endl;
		}
		else{
			fo<<"Case #"<<i+1<<": "<<a[i]<<" "<<xl(a[i])<<endl;
		}
	}
	fo.close();
}

int main(){
	readf();
	process();
}

