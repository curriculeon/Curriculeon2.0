# Migrating Repositories
* To migrate a repository and preserve its commit history as well as its branches, execute the commands below replacing the value of `sourceRepo` and `targetRepo` respectively

```bash
destDirectory="destination-directory"
sourceRepo="https://github.com/source-user/source-repository"
targetRepo="https://github.com/target-user/target-repository"

git clone $sourceRepo $destDirectory
cd $destDirectory
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
git branch
git remote add new-origin $targetRepo
git remote --all new-origin
git push --all new-origin -f
git remote rm origin
git remote rename new-origin origin
```