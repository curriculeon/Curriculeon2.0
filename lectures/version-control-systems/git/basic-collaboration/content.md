# Git Collaboration strategy


### Part 1, Creating The Dev Branch
0. `cd ~/dev`
1. `git clone https://github.com/GitUser/NameOfProject.git`
2. `cd NameOfProject`
3. `git checkout -b dev`
4. `git add .`
5. `git commit -m 'first commit'`
6. `git push -u origin dev`


### Part 2, Creating a Feature Branch
1. `git fetch origin`
2. `git checkout dev`
3. `git checkout -b feat/name-of-feature`


### Part 3, Synching a Feature Branch With Dev Branch
0. `git fetch origin`
1. `git checkout feat/name-of-feature`
2. `git pull origin dev`
3. `git add .`
4. `git commit -m 'feature branch synched with team branch'`
5. `git push -u feat/name-of-feature`


### Part 4, Merging a Feature Branch into Dev Branch
1. `git fetch origin`
4. `git checkout dev`
5. `git merge feat/name-of-feature`
6. `git add .`
7. `git commit -m 'merged feat/name-of-feature into dev'`
8. `git push -u origin dev`