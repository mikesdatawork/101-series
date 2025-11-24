# 101 Git Commands

The 101 most essential and widely used Git commands for version control, collaboration, branching, merging, and daily development workflows.

1. git init                           Initialize a new Git repository
2. git clone url                      Clone a repository from remote
3. git clone url dir                  Clone into specific directory
4. git config --global user.name "Name"  Set global username
5. git config --global user.email "email" Set global email
6. git config --list                  List all Git configuration
7. git status                         Check repository status
8. git add file                       Stage a specific file
9. git add .                          Stage all changes
10. git add -A                        Stage all changes including deletions
11. git rm file                       Unstage and remove file
12. git rm --cached file              Remove from index but keep file
13. git commit -m "Message"           Commit staged changes
14. git commit -a -m "Message"        Stage and commit tracked files
15. git log                           View commit history
16. git log --oneline                 Compact commit history
17. git log --graph --all --decorate  Visual branch history
18. git log --author "Name"           Commits by author
19. git log -p                        Commits with full diff
20. git diff                          Show unstaged changes
21. git diff --staged                 Show staged changes
22. git diff HEAD                     Show all changes since last commit
23. git diff branch1..branch2         Diff between branches
24. git show commit                   Show details of a commit
25. git branch                        List local branches
26. git branch -a                     List all branches
27. git branch new-branch             Create new branch
28. git branch -d branch              Delete branch (safe)
29. git branch -D branch              Force delete branch
30. git checkout branch               Switch to existing branch
31. git checkout -b new-branch        Create and switch to new branch
32. git switch branch                 Switch branch (modern command)
33. git switch -c new-branch          Create and switch (modern)
34. git merge branch                  Merge branch into current
35. git merge --no-ff branch          Force merge commit
36. git merge --abort                 Abort current merge
37. git stash                         Stash current changes
38. git stash apply                   Re-apply latest stash
39. git stash pop                     Apply and remove latest stash
40. git stash list                    List all stashes
41. git stash drop                    Drop latest stash
42. git rebase branch                 Rebase current branch onto another
43. git rebase -i HEAD~3              Interactive rebase last 3 commits
44. git cherry-pick commit            Apply a specific commit
45. git remote -v                     List remote repositories
46. git remote add origin url         Add remote
47. git remote remove name            Remove remote
48. git fetch                         Fetch from remote
49. git fetch --all                   Fetch all remotes
50. git pull                          Fetch + merge
51. git pull --rebase                 Fetch + rebase
52. git push                          Push current branch
53. git push origin branch            Push specific branch
54. git push -u origin branch         Push and set upstream
55. git push --force-with-lease       Safe force push
56. git push --tags                   Push all tags
57. git tag                           List tags
58. git tag v1.0.0                    Create lightweight tag
59. git tag -a v1.0.0 -m "Release"    Create annotated tag
60. git tag -d v1.0.0                 Delete local tag
61. git push origin :v1.0.0           Delete remote tag
62. git checkout -- file              Discard changes in file
63. git restore file                  Discard changes (modern)
64. git restore --staged file         Unstage file (modern)
65. git reset --soft HEAD~1           Undo last commit, keep changes staged
66. git reset HEAD~1                  Undo commit, unstage changes
67. git reset --hard HEAD~1           Undo commit and discard changes
68. git clean -fd                     Remove untracked files and dirs
69. git blame file                    Show who changed each line
70. git bisect start                  Start bug hunting
71. git bisect bad                    Mark current commit bad
72. git bisect good v1.0              Mark known good commit
73. git bisect reset                  End bisect
74. git grep "pattern"                Search codebase
75. git grep -n "pattern"             Search with line numbers
76. git log --grep="fix"              Search commit messages
77. git reflog                        Show reference log
78. git rev-parse --abbrev-ref HEAD   Current branch name
79. git remote show origin            Show remote details
80. git fetch --prune                 Remove deleted remote branches
81. git submodule init                Initialize submodules
82. git submodule update              Update submodules
83. git config --global alias.co checkout   Create alias
84. git config --global alias.br branch
85. git config --global alias.ci commit
86. git config --global alias.st status
87. git shortlog -sn                  Commits per author
88. git count-objects -vH             Repository size info
89. git gc --aggressive --prune=now   Clean and optimize repo
90. git fsck                          Check repository integrity
91. git archive --format=zip HEAD > archive.zip   Export repo
92. git bundle create repo.bundle --all   Bundle entire repo
93. git worktree add ../feature-work feature   Multiple working dirs
94. git worktree list                 List worktrees
95. git worktree remove path          Remove worktree
96. git revert commit                 Create new commit that undoes changes
97. git revert -n commit              Revert but don't commit
98. git config --global core.editor "code --wait"   Set VS Code as editor
99. git config --global init.defaultBranch main   Default branch name
100. git config --global pull.rebase true        Always rebase on pull
101. git --version                    Show Git version

