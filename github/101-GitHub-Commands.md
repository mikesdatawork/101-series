# 101 GitHub Commands

## Overview
GitHub commands are essential for effective version control, collaboration, and project management. This cheat sheet covers the most useful commands for working with GitHub, including Git commands, GitHub CLI commands, and GitHub-specific workflows. These commands help developers manage repositories, branches, pull requests, issues, and integrate with various CI/CD tools.

## Target Audience
- Software developers and engineers
- DevOps professionals
- Open source contributors
- Project managers
- Technical writers and documentation specialists

## Command Categories

### 1. Repository Management (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git init` | Initialize a new Git repository | Starting a new project | `git init my-project` |
| `git clone` | Clone a repository | Getting a copy of an existing project | `git clone https://github.com/user/repo.git` |
| `git remote add` | Add a remote repository | Connecting to GitHub | `git remote add origin https://github.com/user/repo.git` |
| `git remote -v` | List remote repositories | Viewing configured remotes | `git remote -v` |
| `gh repo create` | Create a new repository | Setting up a new project on GitHub | `gh repo create my-new-repo --public` |
| `gh repo fork` | Fork a repository | Contributing to open source | `gh repo fork owner/repo` |
| `gh repo view` | View repository details | Getting repository information | `gh repo view owner/repo` |
| `gh repo list` | List repositories | Seeing all your repositories | `gh repo list --limit 10` |
| `gh repo delete` | Delete a repository | Removing unwanted projects | `gh repo delete my-repo` |
| `gh repo archive` | Archive a repository | Preserving inactive projects | `gh repo archive owner/repo` |
| `gh repo clone` | Clone a repository | Getting repository code | `gh repo clone owner/repo` |
| `gh secret set` | Set a repository secret | Configuring secrets for CI/CD | `gh secret set API_TOKEN` |
| `gh api` | Make a REST API call | Custom API requests | `gh api repos/owner/repo` |
| `git archive` | Create an archive of files | Exporting project versions | `git archive --format=zip HEAD > project.zip` |
| `git fetch --all` | Fetch all remotes | Updating remote tracking branches | `git fetch --all` |

### 2. Committing and Pushing Changes (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git add` | Add files to staging | Preparing files for commit | `git add file.js` or `git add .` |
| `git commit` | Create a commit | Recording changes | `git commit -m "Add feature"` |
| `git commit --amend` | Edit the last commit | Fixing commit messages or adding changes | `git commit --amend -m "New message"` |
| `git push` | Push changes to remote | Uploading commits to GitHub | `git push origin main` |
| `git push -u` | Push and set upstream | First push to a branch | `git push -u origin feature-branch` |
| `git push --force` | Force push changes | Overwriting remote history (use cautiously) | `git push --force origin main` |
| `git push --force-with-lease` | Safer force push | Force push with safety check | `git push --force-with-lease origin main` |
| `git status` | Check working tree status | Viewing changed files | `git status` |
| `git diff` | Show changes | Viewing differences | `git diff file.js` |
| `git diff --staged` | Show staged changes | Viewing staged differences | `git diff --staged` |
| `git stash` | Stash changes temporarily | Saving uncommitted changes | `git stash save "WIP feature"` |
| `git stash pop` | Apply and remove stash | Retrieving stashed changes | `git stash pop` |
| `git stash list` | List all stashes | Viewing saved stashes | `git stash list` |
| `git stash apply` | Apply stash without removing | Using stashed changes | `git stash apply stash@{0}` |
| `git restore` | Discard changes | Reverting files to previous state | `git restore file.js` |

### 3. Branching and Merging (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git branch` | List branches | Viewing all branches | `git branch` |
| `git branch -a` | List all branches | Viewing local and remote branches | `git branch -a` |
| `git branch new-branch` | Create a branch | Making a new branch | `git branch feature` |
| `git checkout` | Switch branches | Moving to a different branch | `git checkout develop` |
| `git checkout -b` | Create and switch to branch | Starting a new feature | `git checkout -b feature` |
| `git switch` | Switch branches (new command) | Moving to a different branch | `git switch develop` |
| `git switch -c` | Create and switch to branch | Starting a new feature | `git switch -c feature` |
| `git merge` | Merge branches | Combining branch changes | `git merge feature` |
| `git rebase` | Reapply commits on top of another branch | Maintaining linear history | `git rebase main` |
| `git rebase -i` | Interactive rebase | Cleaning up commit history | `git rebase -i HEAD~3` |
| `git cherry-pick` | Apply specific commits | Selecting individual changes | `git cherry-pick commit-hash` |
| `git branch -d` | Delete branch | Removing merged branches | `git branch -d feature` |
| `git branch -D` | Force delete branch | Removing unmerged branches | `git branch -D feature` |
| `git branch --merged` | List merged branches | Finding completed branches | `git branch --merged` |
| `git branch -m` | Rename branch | Changing branch names | `git branch -m old-name new-name` |

### 4. Pull Requests and Issues (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `gh pr create` | Create a pull request | Starting a code review | `gh pr create --title "New feature"` |
| `gh pr list` | List pull requests | Viewing open PRs | `gh pr list` |
| `gh pr checkout` | Check out a pull request | Reviewing PR code | `gh pr checkout 123` |
| `gh pr view` | View pull request details | Getting PR information | `gh pr view 123` |
| `gh pr merge` | Merge a pull request | Completing a PR | `gh pr merge 123` |
| `gh pr close` | Close a pull request | Rejecting a PR | `gh pr close 123` |
| `gh pr comment` | Comment on a pull request | Providing feedback | `gh pr comment 123 -b "Looks good!"` |
| `gh pr diff` | View pull request diff | Seeing changes in a PR | `gh pr diff 123` |
| `gh issue create` | Create an issue | Reporting bugs or features | `gh issue create --title "Bug report"` |
| `gh issue list` | List issues | Viewing open issues | `gh issue list` |
| `gh issue view` | View issue details | Getting issue information | `gh issue view 456` |
| `gh issue close` | Close an issue | Resolving issues | `gh issue close 456` |
| `gh issue reopen` | Reopen a closed issue | Continuing work on an issue | `gh issue reopen 456` |
| `gh issue comment` | Comment on an issue | Adding information | `gh issue comment 456 -b "More details"` |
| `gh issue transfer` | Transfer issue to another repository | Moving issues | `gh issue transfer 456 owner/repo` |

### 5. History and Logs (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git log` | Show commit history | Viewing project history | `git log` |
| `git log --oneline` | Show compact history | Quick overview of commits | `git log --oneline` |
| `git log --graph` | Show branch graph | Visualizing branch history | `git log --graph --oneline` |
| `git log -p` | Show changes in commits | Viewing detailed changes | `git log -p file.js` |
| `git log --author` | Filter by author | Finding specific contributions | `git log --author="username"` |
| `git shortlog` | Summarize git log | Seeing contribution summary | `git shortlog -sn` |
| `git blame` | Show who changed each line | Identifying code authors | `git blame file.js` |
| `git reflog` | Reference logs | Viewing all actions in repo | `git reflog` |
| `git show` | Show commit details | Viewing specific commit | `git show commit-hash` |
| `git rev-parse` | Get commit hash | Finding specific commits | `git rev-parse HEAD` |

### 6. Collaboration and Workflows (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git fetch` | Fetch from remote | Getting remote updates | `git fetch origin` |
| `git pull` | Fetch and merge changes | Updating local branch | `git pull origin main` |
| `git pull --rebase` | Pull with rebase | Clean linear history | `git pull --rebase origin main` |
| `gh gist create` | Create a gist | Sharing code snippets | `gh gist create file.js` |
| `gh gist list` | List gists | Viewing your gists | `gh gist list` |
| `gh gist view` | View gist content | Reading a gist | `gh gist view gist-id` |
| `gh release create` | Create a release | Publishing versions | `gh release create v1.0.0` |
| `gh release list` | List releases | Viewing project releases | `gh release list` |
| `gh workflow list` | List workflows | Viewing GitHub Actions | `gh workflow list` |
| `gh workflow run` | Run a workflow | Triggering CI/CD | `gh workflow run workflow-name` |
| `gh workflow view` | View workflow details | Checking workflow configuration | `gh workflow view workflow-name` |
| `gh codespace create` | Create a codespace | Development environments | `gh codespace create` |
| `gh codespace list` | List codespaces | Viewing development environments | `gh codespace list` |
| `gh auth login` | Authenticate with GitHub | Setting up authentication | `gh auth login` |
| `gh config set` | Set configuration | Configuring GitHub CLI | `gh config set editor vim` |

### 7. Configuration and Setup (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git config` | Configure Git | Setting user information | `git config --global user.name "Your Name"` |
| `git config --list` | List all settings | Viewing configuration | `git config --list` |
| `git config --global core.editor` | Set default editor | Configuring tools | `git config --global core.editor "code --wait"` |
| `git config --global alias.co` | Create Git aliases | Creating shortcuts | `git config --global alias.co checkout` |
| `git config --global init.defaultBranch` | Set default branch name | Modern branch naming | `git config --global init.defaultBranch main` |
| `git config --global pull.rebase` | Set pull behavior | Configuring workflows | `git config --global pull.rebase true` |
| `git config --global core.autocrlf` | Set line ending behavior | Cross-platform compatibility | `git config --global core.autocrlf input` |
| `git config --global merge.tool` | Set merge tool | Configuring merging | `git config --global merge.tool kdiff3` |
| `git config --global credential.helper` | Set credential helper | Managing passwords | `git config --global credential.helper cache` |
| `git config --global core.excludesfile` | Set global gitignore | Ignoring files globally | `git config --global core.excludesfile ~/.gitignore_global` |

### 8. Advanced Git Operations (6)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `git bisect` | Binary search for bugs | Finding bug introductions | `git bisect start; git bisect bad; git bisect good commit-hash` |
| `git submodule` | Manage submodules | Working with linked repositories | `git submodule add https://github.com/user/repo.git` |
| `git worktree` | Manage multiple working trees | Working on multiple branches | `git worktree add ../path branch-name` |
| `git filter-branch` | Rewrite history | Removing sensitive data | `git filter-branch --tree-filter 'rm -f password.txt' HEAD` |
| `git rerere` | Reuse recorded resolution | Handling repeated conflicts | `git config --global rerere.enabled true` |
| `git hooks` | Use Git hooks | Automating workflows | Script files in `.git/hooks/` directory |

## Tips and Best Practices
* Always pull before pushing to avoid conflicts
* Use descriptive commit messages (present tense, imperative form)
* Create branches for new features and bug fixes
* Keep commits small and focused on a single change
* Use pull requests for code review
* Regularly rebase feature branches on main/master
* Use semantic versioning for releases
* Set up .gitignore files to avoid committing unnecessary files
* Use GitHub Actions for CI/CD automation
* Document your project with a good README

## Additional Resources
* [GitHub Documentation](https://docs.github.com/)
* [GitHub CLI Documentation](https://cli.github.com/manual/)
* [Pro Git Book](https://git-scm.com/book/en/v2)
* [GitHub Skills](https://skills.github.com/)
* [GitHub Learning Lab](https://lab.github.com/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to GitHub.

### Common Terms

| Term | Description |
|------|-------------|
| `repository` | A storage location for a project containing all files and version history |
| `commit` | A snapshot of changes to files at a specific point in time |
| `branch` | A parallel version of the repository that doesn't affect the main branch |
| `merge` | Combining changes from one branch into another |
| `clone` | Creating a local copy of a repository |
| `pull request` | Proposed changes to a repository that can be reviewed |
| `fork` | A personal copy of another user's repository |
| `HEAD` | Pointer to the current branch or commit you're working on |
| `working tree` | Files in your current directory |
| `staging area` | Files marked for commit but not yet committed |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `--global` | Apply setting globally | `git config --global user.name "Name"` |
| `-m` | Add a message | `git commit -m "Fix bug"` |
| `-b` | Create and switch to branch | `git checkout -b feature` |
| `-f` | Force operation | `git push -f origin main` |
| `-a` | Include all changes | `git commit -a -m "Update"` |
| `--amend` | Modify last commit | `git commit --amend` |
| `--rebase` | Apply commits on top of another base | `git pull --rebase` |
| `-p` | Patch mode (interactive) | `git add -p` |
| `-v` | Verbose output | `git branch -v` |
| `--dry-run` | Simulate an operation | `git clean -n` (dry run) |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `PR` | Pull Request | Code review and merging process |
| `CI/CD` | Continuous Integration/Continuous Deployment | Automated testing and deployment |
| `LGTM` | Looks Good To Me | Code review approval |
| `WIP` | Work In Progress | Unfinished feature or PR |
| `CODEOWNERS` | Code Owners | File defining who owns what code |
| `SSH` | Secure Shell | Secure connection protocol |
| `2FA` | Two-Factor Authentication | Security feature |
| `CLI` | Command Line Interface | Terminal commands |
| `API` | Application Programming Interface | Programmatic access |
| `YAML` | YAML Ain't Markup Language | Configuration file format |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `@username` | Mention | Notify a GitHub user in comments |
| `#issue-number` | Issue/PR reference | Link to an issue or PR |
| `user/repo#issue` | Cross-repository reference | Reference issues in other repos |
| `SHA` | Commit hash | Unique identifier for commits |
| `HEAD~n` | Relative commit reference | Reference n commits before HEAD |
| `branch..branch` | Commit range | Compare differences between branches |
| `origin/main` | Remote branch reference | Reference to a branch on remote |
| `:emoji:` | Emoji code | Add emoji to comments and descriptions |
| `fix #123` | Closing keyword | Automatically close issues |
| `[text](url)` | Markdown link | Create hyperlinks |

### Command Syntax

Basic syntax pattern for Git/GitHub commands:
```
git <command> [options] [arguments]
gh <command> <subcommand> [options] [arguments]
```

* **Command**: The operation to perform (e.g., commit, push, pull)
* **Options**: Flags that modify command behavior (e.g., --global, -m)
* **Arguments**: What the command acts on (e.g., branch names, files)

Example with breakdown:
```
git commit -m "Fix navigation bug"
```
* `git` is the program
* `commit` is the command
* `-m` is the option (message flag)
* `"Fix navigation bug"` is the argument (commit message)
