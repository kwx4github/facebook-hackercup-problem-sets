# facebook hackercup problem set collections

## Introduction

This repo meant to be a repository collecting all (or as many as possible) the problem set, solutions and perhaps also the source code written by others in the facebook hacker cup in the hope that it would be useful for others to use them for practice and prepare for the future coding contests.

Please feel free to clone it for practice. 

I haven't decided fully about the folder structure and what information to include and in what format to store them. Please feel free to send me comments to help to enhance it. For comments pleaes message me at: kwokwah _plus_ github _at_ gmail _dot_ com

## Repo content

In brief, here is the plan:

The following content will be gathered in the repository:

- Links to the sources of the FAQ, the round instructions and the solutions (all years stored in one single page)
- FAQ (per year), which also contains the schedule for that year's hacker cup
- Round instructions (per round), usually there is qualifying round, then 2 to 3 rounds before the final round
- Problem description (per problem)
- Sample input / output (per problem)
- Actual input (per problem), from the official solutions
- Expected output (per problem), generated from the source code by other winning hackers
- Official solutions (per problem)
- Source code by other facebook hackers (per problem)

## Folder struction and file naming conventions

### Links to the sources of the FAQ, the round instructions and the solutions

source-links.md

- The links to the FAQ, the round instructions and the solutions shall be kept in this single file for easy access. 
- All source links from all the years will be kept here.

### Folders and files per year and round

```
[year]
├── faq.md
└── [round]
    ├── [problem_id].[problem_title]
    └── round-instructions.md
```

- For each year, there will be a folder of that year. 
- The FAQ for that year will be saved in a file named faq.md under that year. 
- Under that year, there will be folders of the rounds. 
- The instructions for that round will be saved in a file nameed round-instructions.md under that round
- Under each round folder, there will be problem set folders named in the format of [problem number].[problem_title]. 

For example:

```
- 2015/
    - faq.md
    - qualifying_round/
	- round-instructions.md
        - 1.Cooking_the_Books/
        - 2.New_Year's_Resolution/
        - 3.Laser_Maze/
    - round_1/
        - round-instructions.md
        - 1.Homework/
        - 2.Autocomplete
        - 3.Winning at Sports
        - 4.Corporate Gifting
    - ...
```

### Folders and files per problem set

```
[problem_id].[problem_title]
├── problem.md
├── [sample_input].txt
├── [sample_output].txt
└── solutions
    ├── official_solution.md
    ├── [actual_input].txt
    ├── expected_output.txt
    └── sources
        └── [rank].[hacker_name].[ext]
```

- In each problem set folder, there will be the following folders and files:
- The problem description, named as problem.md
- The sample input, downloaded directly from the problem description, named by default or otherwise the format of [problem name]_example_input.txt
- The sample output, downloaded directly from the problem description, named by default or otherweise the format of [problem name]_example_output.txt
- A solutions folder, named solutions
- The official solutions, named as official_solution.md
- The input file from official solution, downloaded from the solution page.
- A sources code folder, for holding the source code written by the winners of that round (only source code marked correct should be included)
- The source code written by contestants of that round will be collected from the scoring page. They are stored under the sources folder, named in the format of [rank].[hacker name].[source code extension] where rank means the ranking of that contestant in that round.
- The expected output of the official input file will be generated by the winning sources (should try to verify them by running several winning sources on the input) as well.

For example:

```
- 1.Cooking_the_Books/
    - problem.md
    - cooking_the_books_example_input.txt
    - cooking_the_books_example_output.txt
    - solutions/
        - official_solution.md
        - cooking_the_books.txt
        - sources/
            - 1.Nick.java
            - 2.Timothy.py
            - 3.Алексей.cpp
            - ...
        - expected_output.txt
```

## Adding new years / rounds / problem sets

- In order to facilitate easy adding of new problem sets, a sample template is created under the folder "templates"
- Whenever there is a new year of contest coming, just cp -r _year_ under templates will do. e.g. cp -r templates/_year_ 2015
- Edit the .md files accordingly
- Save the sample input / output files under appropriate positions
- Adding a new problem is similar, just by cp -r the _problem_id_._problem_title_ folder  to a properly named folder will do
- Edit the .md files inside accordingly
- Save the input / output files and also source code by others and note well about the naming convention will do

