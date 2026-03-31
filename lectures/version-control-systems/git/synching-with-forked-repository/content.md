# Synching With Forked Repository


* To `pull` changes in from upstream master, execute command below.

```
git pull https://github.com/theirusername/reponame
```



* To `pull` changes from upstream branches, execute commands below.

```bash
git remote add theirusername git@github.com:theirusername/reponame.git
git fetch theirusername
git checkout -b mynamefortheirbranch theirusername/theirbranch
```