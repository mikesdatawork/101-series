# 101 GitHub CLI (gh) Commands

Master GitHub entirely from the terminal — no browser needed.  
Requires: `gh` installed (`brew install gh` · `winget install --id GitHub.cli`)

### Authentication & Setup
| Command                              | Description |
|--------------------------------------|-------------|
| gh auth login                        | Log in to GitHub |
| gh auth login --web                  | Login via browser |
| gh auth logout                       | Log out |
| gh auth status                       | Show authentication status |
| gh auth refresh                      | Refresh credentials |
| gh config set editor code            | Set default editor |

### Repository Management
| Command                              | Description |
|--------------------------------------|-------------|
| gh repo create myproject             | Create new repo (public) |
| gh repo create myproject --private   | Create private repo |
| gh repo create --source=. --remote=origin | Create from current folder |
| gh repo clone owner/repo             | Clone a repo |
| gh repo fork owner/repo              | Fork a repo |
| gh repo view                         | View repo in browser |
| gh repo view owner/repo              | View any repo |
| gh repo delete owner/repo            | Delete a repo |
| gh repo rename new-name              | Rename current repo |
| gh repo set-default                  | Set default repo for gh |

### Pull Requests
| Command                              | Description |
|--------------------------------------|-------------|
| gh pr create                         | Create PR from current branch |
| gh pr create --title "Fix bug" --body "Details" | Create with title/body |
| gh pr create --draft                | Create as draft |
| gh pr list                           | List open PRs |
| gh pr list --author @me              | Your PRs |
| gh pr list --state merged            | Merged PRs |
| gh pr view 123                       | View PR #123 |
| gh pr view 123 --web                 | Open PR in browser |
| gh pr checkout 123                   | Checkout PR locally |
| gh pr merge 123                      | Merge PR |
| gh pr merge 123 --squash             | Squash and merge |
| gh pr merge 123 --rebase             | Rebase and merge |
| gh pr close 123                      | Close PR |
| gh pr reopen 123                     | Reopen PR |
| gh pr review 123 --approve           | Approve PR |
| gh pr review 123 --comment "LGTM"    | Add comment |
| gh pr review 123 --request-changes   | Request changes |

### Issues
| Command                              | Description |
|--------------------------------------|-------------|
| gh issue create                      | Create new issue |
| gh issue create --title "Bug" --body "Details" | With title/body |
| gh issue list                        | List open issues |
| gh issue list --author @me           | Your issues |
| gh issue list --label bug            | Issues with label |
| gh issue view 42                     | View issue #42 |
| gh issue view 42 --web               | Open in browser |
| gh issue close 42                    | Close issue |
| gh issue reopen 42                   | Reopen issue |
| gh issue comment 42 --body "Fixed"   | Add comment |

### GitHub Actions & Workflows
| Command                              | Description |
|--------------------------------------|-------------|
| gh workflow list                     | List workflows |
| gh workflow view workflow.yml        | View workflow details |
| gh workflow enable workflow.yml      | Enable workflow |
| gh workflow disable workflow.yml     | Disable workflow |
| gh run list                          | List recent runs |
| gh run view 12345                    | View run details |
| gh run watch 12345                   | Live watch run |
| gh run rerun 12345                   | Rerun failed run |
| gh run cancel 12345                  | Cancel running workflow |

### Gists
| Command                              | Description |
|--------------------------------------|-------------|
| gh gist create file.txt              | Create gist from file |
| gh gist create --public file.txt     | Public gist |
| gh gist list                         | List your gists |
| gh gist view gist-id                 | View gist |
| gh gist clone gist-id                | Clone gist locally |

### Releases & Codespaces
| Command                              | Description |
|--------------------------------------|-------------|
| gh release create v1.0.0             | Create release |
| gh release create v1.0.0 --draft     | Draft release |
| gh release upload v1.0.0 asset.zip   | Upload asset |
| gh release list                      | List releases |
| gh release view v1.0.0               | View release |
| gh codespace create --repo owner/repo | Create codespace |
| gh codespace list                    | List your codespaces |
| gh codespace ssh                     | SSH into codespace |

### Search & Discovery
| Command                              | Description |
|--------------------------------------|-------------|
| gh search repos kubernetes           | Search repositories |
| gh search issues "label:bug is:open" | Search issues |
| gh search prs is:open reviewer:@me   | PRs awaiting your review |

### Bonus Power Commands
| Command                              | Description |
|--------------------------------------|-------------|
| gh browse                            | Open repo in browser |
| gh browse --issues                   | Open issues tab |
| gh browse --pulls                    | Open PRs tab |
| gh api repos/octocat/hello-world     | Raw GitHub API call |
| gh alias set prc 'pr create'         | Create shortcut |
| gh alias list                        | List aliases |
| gh extension install owner/gh-ext    | Install community extension |
| gh --version                         | Show gh version |

**Total: 101 GitHub CLI commands — work faster than the browser**

