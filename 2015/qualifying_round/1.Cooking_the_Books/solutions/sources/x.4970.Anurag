#include <bits/stdc++.h>

using namespace std;

int main() {
    int tc,j, i, pos1 = 0;
    int pos2 = 0;
    int max = -1;
    int min = 10;
    char no[12];
    char minimum[12];
    char maximum[12];
    ofstream outfile;
    ifstream infile;
//    outfile.open("output.txt");
 //   infile.open("input.txt");

    scanf ("%d", &tc);
    for (j = 1; j <= tc; j++) {
    int pos1 = 0;
    int pos2 = 0;
    int max = -1;
    int min = 10;
        scanf ("%s", no);
        for(i = 0; i < strlen(no); i++) {
            if (max < (no[i] - 48)) {
                max = no[i] - 48;
                pos1 = i;
            }

            if ((min > (no[i] - 48))) {
                min = no[i] - 48;
                if (min != 0)
                    pos2 = i;
            }
        }

        strcpy(minimum,no);
        strcpy(maximum,no);

        minimum[0] = (char)(min + 48);
        minimum[pos2] = no[0];

        maximum[0] = (char)(max + 48);
        maximum[pos1] = no[0];


        printf ("Case #%d: %s %s\n", j,minimum,maximum);
    }

    return 0;
}
