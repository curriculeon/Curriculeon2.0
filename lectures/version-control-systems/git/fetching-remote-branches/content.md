# Fetch All Remote Branches
* Execute the commands below to fetch all remote branches to your local machine

```bash
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
git branch
```