# 101 Git Commands  
*Essential version control commands — grouped by workflow*

### Setup & Configuration
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git init                                         | Initialize a new repository |
| git clone https://github.com/user/repo.git      | Clone a remote repo |
| git config --global user.name "Your Name"        | Set your name globally |
| git config --global user.email "you@example.com" | Set your email globally |
| git config --global core.editor code            | Set VS Code as default editor |
| git config --global init.defaultBranch main     | Default branch = main |
| git config --global alias.co checkout           | Create alias: git co |
| git config --global alias.br branch              | Create alias: git br |
| git config --global alias.ci commit              | Create alias: git ci |
| git config --global alias.st status              | Create alias: git st |

### Daily Workflow
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git status                                       | Show current state |
| git add file.txt                                 | Stage a file |
| git add .                                        | Stage all changes |
| git add -A                                       | Stage everything (new/modified/deleted) |
| git commit -m "Fix bug"                          | Commit with message |
| git commit -am "Update docs"                     | Skip staging for tracked files |
| git diff                                         | See unstaged changes |
| git diff --staged                                | See staged changes |
| git restore file.txt                             | Discard changes in file |
| git restore --staged file.txt                    | Unstage a file |

### Branching & Switching
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git branch                                       | List local branches |
| git branch -a                                    | List all branches |
| git branch feature/login                         | Create new branch |
| git checkout feature/login                       | Switch to branch |
| git checkout -b feature/api                      | Create + switch |
| git switch feature/login                         | Switch (modern) |
| git switch -c feature/api                        | Create + switch (modern) |
| git branch -d feature/old                        | Delete merged branch |
| git branch -D feature/old                        | Force delete branch |

### Remote & Sync
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git remote -v                                    | List remotes |
| git remote add origin url                        | Add remote |
| git fetch                                        | Download latest from remote |
| git fetch --prune                                | Remove deleted remote branches |
| git pull                                         | Fetch + merge |
| git pull --rebase                                | Fetch + rebase |
| git push                                         | Push current branch |
| git push -u origin feature/login                 | Push and set upstream |
| git push --force-with-lease                      | Safe force push |

### History & Inspection
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git log                                          | Full commit history |
| git log --oneline                                | One line per commit |
| git log --graph --all --decorate                 | Visual branch map |
| git log -p                                       | Show diffs in history |
| git show abc123                                  | Details of one commit |
| git blame file.py                                | Who changed each line |
| git reflog                                       | Recover lost commits |
| git shortlog -sn                                 | Commits per author |

### Stashing & Work-in-Progress
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git stash                                        | Save changes temporarily |
| git stash -m "WIP: login form"                   | Stash with message |
| git stash list                                   | List all stashes |
| git stash apply                                  | Re-apply latest stash |
| git stash pop                                    | Apply and remove stash |
| git stash drop                                   | Delete latest stash |
| git stash show -p                                | See what’s in latest stash |

### Undoing & Recovery
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git reset --soft HEAD~1                          | Undo commit, keep changes staged |
| git reset HEAD~1                                 | Undo commit, unstage changes |
| git reset --hard HEAD~1                          | Discard last commit completely |
| git revert abc123                                | Safely undo a commit (creates new one) |
| git clean -fd                                    | Remove untracked files/folders |
| git checkout HEAD -- file.txt                    | Restore file to last commit |

### Advanced Operations
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git merge feature                                | Merge branch |
| git merge --no-ff feature                        | Force merge commit |
| git merge --abort                                | Cancel conflicted merge |
| git rebase main                                  | Replay commits on top of main |
| git rebase -i HEAD~4                             | Interactive rebase (squash/edit) |
| git cherry-pick abc123                           | Apply one commit from elsewhere |
| git bisect start / bad / good v1.0 / reset       | Hunt down bugs fast |

### Tags & Releases
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git tag                                          | List tags |
| git tag v1.2.0                                   | Lightweight tag |
| git tag -a v1.2.0 -m "Stable release"           | Annotated tag |
| git push origin v1.2.0                           | Push single tag |
| git push --tags                                  | Push all tags |
| git tag -d v1.2.0                                 | Delete local tag |
| git push origin :v1.2.0                          | Delete remote tag |

### Bonus Power Tools
| Command                                          | Description |
|--------------------------------------------------|-------------|
| git worktree add ../bugfix bugfix                | Multiple folders, same repo |
| git archive --format=zip HEAD > project.zip      | Export clean zip |
| git gc --aggressive --prune=now                  | Optimize repo |
| git fsck                                         | Check for corruption |
| git bundle create backup.bundle --all            | Full repo backup file |
| git --version                                    | Show Git version |

**Total: 101 essential Git commands — now grouped and ready for daily use**

