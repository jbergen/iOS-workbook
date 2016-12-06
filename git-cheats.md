Git Cheat Sheet
====

based on gist: https://gist.github.com/juristr/5280366

# Repositories

### Create New Repo

```
$ git init
```

### Cloning

```
$ git clone <repo address> <target folder>
```

### .gitignore
Boilerplates: [https://github.com/github/gitignore](https://github.com/github/gitignore)

### Fetch Origin

```
$ git fetch
```

### Sync Branch With Origin

this will fetch then merge the branch in question

```
$ git pull origin <branch name>
```


# Branches
Docs: [http://gitref.org/branching/](http://gitref.org/branching/)

### Branch Status
```
$ git status
```

### View Commits
```
$ git log
```

### List Branches locally
```
$ git branch
```

### Checkout Existing Branch
```
$ git checkout <branch name>
```

### Quick Create New Branch
```
$ git checkout -b <new branch name>
```

### Delete local branch

```
$ git branch -D bugfix
```

### Push Local Branch

```
$ git push origin <branch name>
```

### Force Push Local Branch
This will overwrite the branch's history. USE WITH EXTREME CAUTION!

```
$ git push origin <branch name>
```

# Committing and Undoing

### Adding file for committing

```
$ git add -A
```

### Executing Commit

```
$ git commit -am "My comment"
```

### Undoing all changes

Reverts **all** changes to the last commit

```
$ git reset --hard
```

### Jumping back to a given SHA

```
# reset the index to the desired tree
$ git reset 56e05fced

# move the branch pointer back to the previous HEAD
$ git reset --soft HEAD@{1}

$ git commit -m "Revert to 56e05fced"

# Update working copy to reflect the new commit
$ git reset --hard
```


## Removing a tracked file

To remove a tracked file from git but not from the local file system use

```
$ git rm --cached <filename>
```

# Merging

### Merge Branch

```
$ git merge <branch name>
```

### Merge single file(s)

```
$ git checkout <local-branch-name> <file-path>
```

### Undo a merge

[StackOverflow post](http://stackoverflow.com/a/2389423/50109)

```
$ git reset --hard commit_sha
```

or simply

```
$ git reset --hard origin/HEAD
```

to reset to the last remote commit. **Attention**, undo obviously only local merges.

# Update from original repo

```
$ git remote add upstream <org_git_url>
```

Then you can fetch it normally through

```
$ git pull upstream <branch>
```


# Git Configuration

### Pretty logs

Add an alias to your `~/.gitconfig` like

```
[alias]
  lg = log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"
```

Alternatively (as described [here](https://coderwall.com/p/euwpig/a-better-git-log) )

```
lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
```
http://adit.io/posts/2013-08-16-five-useful-git-tips.html

## Autocompletion

Download [this](https://raw.github.com/git/git/master/contrib/completion/git-completion.bash) file to `~/` and rename it to `.git-completion.bash`. Then open `.bash_profile` and add

```
source ~/.git-completion.bash
```

## Recover lost commits

Check out [this blog post](http://adit.io/posts/2013-08-16-five-useful-git-tips.html).


