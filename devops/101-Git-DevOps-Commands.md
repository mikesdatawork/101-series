# 101 Git DevOps Commands

## Overview
Git is the distributed version control system at the heart of modern DevOps workflows. This cheat sheet covers advanced Git commands for branching strategies, rebasing, hooks, submodules, GitOps patterns, CI/CD integration, large repositories, and security practices essential for DevOps engineers and LPI DevOps Tools Engineer certification.

## Target Audience
- DevOps engineers managing code pipelines
- Developers collaborating on large projects
- Release managers handling versioning
- Platform engineers implementing GitOps
- Anyone preparing for LPI DevOps Tools Engineer

### 1. Configuration and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git config --global user.name "Name" | Set name | Identity | git config --global user.name "John Doe" |
| git config --global user.email "email" | Set email | Identity | git config --global user.email "john@example.com" |
| git config --global init.defaultBranch main | Default branch | Modern | git config --global init.defaultBranch main |
| git config --global core.editor vim | Set editor | Commit messages | git config --global core.editor nano |
| git config --global alias.st status | Create alias | Shortcuts | git config --global alias.co checkout |
| git config --global pull.rebase true | Rebase on pull | Clean history | git config --global pull.rebase true |
| git config --global credential.helper store | Credential storage | Auth | git config --global credential.helper cache |
| git config --global gpg.format ssh | SSH signing | Security | git config --global gpg.format ssh |
| git config --list | List config | Verify | git config --list |
| git config --global --unset key | Remove setting | Cleanup | git config --global --unset pull.rebase |

### 2. Repository Initialization and Cloning (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git init | Initialize repo | New project | git init myproject |
| git clone --depth 1 | Shallow clone | Faster | git clone --depth 1 url |
| git clone --mirror | Mirror clone | Backup | git clone --mirror url |
| git clone --bare | Bare repo | Server | git clone --bare url |
| git clone --single-branch | Single branch | Reduce size | git clone --single-branch -b main url |
| git remote add origin url | Add remote | Push/pull | git remote add origin git@server:repo.git |
| git remote -v | List remotes | Verify | git remote -v |
| git remote set-url origin newurl | Change URL | Migrate | git remote set-url origin https://new.url |
| git remote rename old new | Rename remote | Cleanup | git remote rename upstream origin |
| git remote remove name | Remove remote | Cleanup | git remote remove old |

### 3. Branching Strategies (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git branch feature/new | Create branch | New work | git branch feature/login |
| git checkout -b feature/new | Create & switch | Start | git checkout -b hotfix/bug |
| git switch -c feature/new | Modern create | Switch | git switch -c release/1.0 |
| git branch -d branch | Delete local | Cleanup | git branch -d old-feature |
| git branch -D branch | Force delete | Merged | git branch -D stale |
| git push -u origin branch | Push & track | Remote | git push -u origin feature/new |
| git push origin --delete branch | Delete remote | Cleanup | git push origin --delete old |
| git fetch --prune | Prune stale | Sync | git fetch --prune |
| git branch --merged | Merged branches | Cleanup | git branch --merged main |
| git branch --no-merged | Unmerged | Review | git branch --no-merged |
| git checkout main && git pull | Sync main | Before branch | git switch main && git pull |
| git branch -m old new | Rename branch | Update | git branch -m feature/old feature/new |

### 4. Committing and History (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git add -p | Interactive add | Selective | git add -p file.py |
| git commit --amend | Amend last | Fix message | git commit --amend -m "New message" |
| git commit --fixup=sha | Fixup commit | Rebase later | git commit --fixup=abc123 |
| git commit --squash=sha | Squash commit | Combine | git commit --squash=abc123 |
| git rebase -i --autosquash | Autosquash | Clean | git rebase -i --autosquash main |
| git log --oneline --graph --decorate | Pretty log | History | git log --oneline --graph |
| git log --author="Name" | Filter author | Search | git log --author="John" |
| git log --grep="text" | Search message | Find | git log --grep="fix bug" |
| git reflog | Reference log | Recover | git reflog |
| git reset --hard HEAD~1 | Undo commit | Dangerous | git reset --hard HEAD~1 |
| git revert sha | Revert commit | Safe | git revert abc123 |
| git cherry-pick sha | Pick commit | Apply | git cherry-pick def456 |

### 5. Rebasing and Merging (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git rebase main | Rebase feature | Clean history | git rebase main |
| git rebase -i HEAD~n | Interactive | Edit history | git rebase -i HEAD~5 |
| git rebase --continue | Continue | After resolve | git rebase --continue |
| git rebase --abort | Abort | Cancel | git rebase --abort |
| git merge main | Merge | Integrate | git merge main |
| git merge --no-ff | No fast-forward | Preserve branch | git merge --no-ff feature |
| git merge --squash | Squash merge | Combine | git merge --squash feature |
| git rebase --onto newbase oldbase branch | Advanced | Move branch | git rebase --onto main oldmain feature |
| git pull --rebase | Rebase pull | Clean | git pull --rebase origin main |
| git merge-base branch1 branch2 | Common ancestor | Diff | git merge-base main feature |

### 6. Stashing and Worktrees (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git stash | Stash changes | Temporary | git stash |
| git stash push -m "message" | Named stash | Descriptive | git stash push -m "WIP login" |
| git stash list | List stashes | View | git stash list |
| git stash apply | Apply latest | Restore | git stash apply |
| git stash apply stash@{n} | Specific stash | Select | git stash apply stash@{2} |
| git stash pop | Apply & drop | Cleanup | git stash pop |
| git stash drop stash@{n} | Drop stash | Cleanup | git stash drop stash@{1} |
| git worktree add ../parallel main | New worktree | Parallel | git worktree add ../fix-branch hotfix |

### 7. Submodules and Subtrees (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git submodule add url path | Add submodule | Dependency | git submodule add git://repo lib |
| git submodule init | Initialize | Setup | git submodule init |
| git submodule update | Update | Fetch | git submodule update |
| git submodule update --remote | Update remote | Latest | git submodule update --remote |
| git submodule foreach git pull | Run in each | Bulk | git submodule foreach git pull |
| git subtree add --prefix=path url branch | Subtree add | Alternative | git subtree add --prefix=lib url main |
| git subtree pull --prefix=path url branch | Pull subtree | Update | git subtree pull --prefix=lib url main |
| git submodule deinit path | Remove | Cleanup | git submodule deinit lib |
| git rm path | Remove from index | Cleanup | git rm lib |
| git submodule status | Status | View | git submodule status |

### 8. Git Hooks (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| .git/hooks/pre-commit | Pre-commit hook | Lint | Add script to .git/hooks/pre-commit |
| .git/hooks/commit-msg | Commit message | Validate | Enforce Conventional Commits |
| .git/hooks/pre-push | Pre-push | Tests | Run tests before push |
| git config core.hooksPath hooks/ | Shared hooks | Repo | git config core.hooksPath .githooks |
| husky | Node.js hooks | Modern | npm install husky |
| pre-commit | Python hooks | Framework | pre-commit install |
| git commit --no-verify | Bypass hooks | Skip | git commit -n |
| lefthook | Multi-lang hooks | Fast | lefthook install |
| commitlint | Message lint | Conventional | @commitlint/config-conventional |
| git push --no-verify | Bypass push | Skip | git push --no-verify |

### 9. Large File Storage (LFS) (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git lfs install | Install LFS | Setup | git lfs install |
| git lfs track "*.psd" | Track pattern | Large files | git lfs track "*.zip" |
| git lfs migrate import --include="*.bin" | Migrate existing | Convert | git lfs migrate import --include="*.zip" |
| git lfs ls-files | List tracked | View | git lfs ls-files |
| git lfs pull | Pull LFS | Fetch | git lfs pull |
| git lfs fetch --recent | Recent only | Bandwidth | git lfs fetch --recent |
| git lfs prune | Cleanup | Space | git lfs prune |
| git lfs status | Status | View | git lfs status |

### 10. GitOps Patterns (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git checkout main && git pull | Sync desired | Argo/Flux | In sync script |
| git push origin main | Apply changes | Trigger CD | After manifest update |
| git revert sha | Rollback | Safe | git revert bad-commit |
| git tag v1.0.0 | Release tag | Version | git tag -a v1.0.0 -m "Release" |
| git push --tags | Push tags | Trigger | git push --tags |
| git branch -r | Remote branches | Monitor | git branch -r |
| git fetch --all | Fetch all | Sync | git fetch --all |
| git log --oneline main..origin/main | Drift detection | Compare | git log --oneline main..origin/main |

### 11. Signing and Security (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git config commit.gpgsign true | Sign commits | Security | git config commit.gpgsign true |
| git config tag.gpgsign true | Sign tags | Releases | git config tag.gpgsign true |
| git commit -S | Sign commit | Manual | git commit -S -m "Signed" |
| git tag -s v1.0.0 | Signed tag | Release | git tag -s v1.0.0 -m "Signed release" |
| git verify-commit sha | Verify | Check | git verify-commit abc123 |
| git verify-tag tag | Verify tag | Release | git verify-tag v1.0.0 |
| ssh-keygen -t ed25519 | SSH key | Auth | ssh-keygen -t ed25519 -C "email" |
| git remote set-url origin git@... | SSH URL | Secure | git remote set-url origin git@github.com:user/repo.git |
| git config --global gpg.program gpg | GPG program | Config | Default |
| git log --show-signature | Show signature | Verify | git log --show-signature -1 |

### 12. Advanced History Manipulation (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git filter-branch --tree-filter | Rewrite history | Clean | Dangerous, use filter-repo |
| git filter-repo --path file --invert-paths | Remove file | History | git filter-repo --path secrets.txt --invert-paths |
| git replace --graft sha parent | Graft | Fix history | git replace --graft new old |
| git bisect start | Bisect | Find bug | git bisect start bad good |
| git bisect good/bad | Mark | Search | git bisect good |
| git bundle create file.bundle --all | Bundle | Offline | git bundle create repo.bundle --all |
| git bundle verify file.bundle | Verify bundle | Check | git bundle verify repo.bundle |
| git gc | Garbage collect | Optimize | git gc --aggressive |
| git fsck | Filesystem check | Integrity | git fsck |
| git maintenance run | Maintenance | Auto | git maintenance run |

### 13. Remote and Fetch Operations (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git fetch origin | Fetch remote | Sync | git fetch origin |
| git fetch --all | All remotes | Sync | git fetch --all |
| git fetch origin pull/ID/head:pr-ID | Fetch PR | Review | git fetch origin pull/123/head:pr-123 |
| git pull --ff-only | Fast-forward only | Safe | git pull --ff-only |
| git pull --rebase --autostash | Rebase stash | Clean | git pull --rebase --autostash |
| git remote show origin | Remote details | Info | git remote show origin |
| git remote prune origin | Prune gone | Cleanup | git remote prune origin |
| git push --force-with-lease | Safe force | Protected | git push --force-with-lease |
| git push --set-upstream origin branch | Track | First push | git push -u origin feature |
| git push --tags | Push tags | Release | git push --tags |

### 14. Patches and Collaboration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git format-patch -n | Create patches | Email | git format-patch -3 |
| git am *.patch | Apply patches | Mailbox | git am 000*.patch |
| git apply patch.file | Apply patch | Single | git apply fix.patch |
| git request-pull | Pull request | Summary | git request-pull main url branch |
| git send-email | Send patches | Email | git send-email *.patch |
| git bundle | Bundle repo | Transfer | git bundle create repo.bundle main |
| git archive --format=zip | Archive | Release | git archive --format=zip -o release.zip main |
| git shortlog | Contributor summary | Changelog | git shortlog -sn |

### 15. Performance and Large Repos (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git config --global pack.windowMemory 100m | Memory limit | Large | git config pack.windowMemory 100m |
| git config --global core.bigFileThreshold 100m | Large file | Threshold | git config core.bigFileThreshold 100m |
| git repack -adf --depth=50 --window=50 | Repack | Optimize | git repack -adf |
| git gc --aggressive --prune=now | Aggressive GC | Space | git gc --aggressive |
| git config --global fetch.fsckObjects true | Integrity | Fetch | git config fetch.fsckObjects true |
| git sparse-checkout init --cone | Sparse | Large repo | git sparse-checkout init --cone |
| git sparse-checkout set path/ | Limit paths | Mono-repo | git sparse-checkout set src/app |
| git clone --filter=blob:none | Partial clone | Speed | git clone --filter=blob:none url |

### 16. CI/CD Integration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git describe --tags | Version tag | Semantic | git describe --tags --abbrev=0 |
| git rev-parse HEAD | Commit SHA | Build ID | git rev-parse HEAD |
| git log --pretty=format:%H | Hashes | Scripts | git log --pretty=format:%H -n 1 |
| git diff --name-only HEAD~1 | Changed files | Cache | git diff --name-only HEAD~1 |
| git archive HEAD | Archive HEAD | Artifact | git archive HEAD -o app.tar |
| git clean -fdx | Clean workspace | Fresh | git clean -fdx |
| git checkout -f | Force checkout | Reset | git checkout -f main |
| git status --porcelain | Machine readable | Scripts | git status --porcelain |

### 17. Recovery and Forensics (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git reflog | Recover lost | References | git reflog |
| git fsck --lost-found | Find dangling | Recover | git fsck --lost-found |
| git cat-file -p sha | View object | Inspect | git cat-file -p abc123 |
| git show sha | Show commit | Details | git show abc123 |
| git branch recover sha | Recover branch | From commit | git branch recovered-branch abc123 |
| git checkout sha -- file | Recover file | Single | git checkout abc123 -- src/file.py |
| git reset --hard origin/main | Hard reset | Sync | git reset --hard origin/main |
| git clean -fd | Remove untracked | Clean | git clean -fd |

## Tips and Best Practices
* Use main as default branch name.
* Prefer rebase over merge for feature branches.
* Use --force-with-lease instead of --force.
* Sign commits and tags in production.
* Use Git LFS for binary assets.
* Implement meaningful commit messages (Conventional Commits).
* Use shared hooks via core.hooksPath or tools like husky.
* Clean up merged branches regularly.
* Use sparse-checkout in monorepos.
* Tag releases with semantic versions.
* Use protected branches and required status checks.
* Never commit secrets—use .gitignore and git secrets.
* Use pull --rebase --autostash for clean history.
* Prefer git switch and git restore (modern commands).
* Use git worktree for parallel work.
* Review git log --graph regularly.
* Backup with git bundle or mirror clones.
* Use git filter-repo for history rewriting.
* Enable credential caching or SSH keys.
* Document branching strategy in repo.

## Additional Resources
* [Official Git Documentation](https://git-scm.com/doc)
* [Git SCM Book](https://git-scm.com/book/en/v2)
* [Conventional Commits](https://www.conventionalcommits.org/)
* [Git LFS Documentation](https://git-lfs.com/)
* [Git Hooks Guide](https://git-scm.com/docs/githooks)
* [Git Filter-Repo](https://github.com/newren/git-filter-repo)
* [Atlassian Git Tutorials](https://www.atlassian.com/git)
* [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
* [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)
* [LPI DevOps Tools Engineer Objectives](https://www.lpi.org/our-certifications/devops-tools-engineer-overview)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Repository | Project with history |
| Commit | Snapshot of changes |
| Branch | Pointer to commit |
| HEAD | Current position |
| Remote | Remote repository |
| Origin | Default remote name |
| Upstream | Original repo |
| Reflog | Reference log |
| Object | Blob/tree/commit/tag |
| SHA | Commit hash |

### 2. Branching Models
| Term/Concept | Description |
| --- | --- |
| Main/Master | Stable branch |
| Feature | New work branch |
| Release | Pre-release branch |
| Hotfix | Urgent fix |
| Trunk-based | Short-lived branches |
| Git Flow | Feature/release/hotfix |
| GitHub Flow | Simple main + PRs |
| GitLab Flow | Environment branches |
| Pull Request | Code review |
| Merge Request | GitLab PR |

### 3. History Rewriting
| Term/Concept | Description |
| --- | --- |
| Rebase | Move commits |
| Interactive Rebase | Edit history |
| Amend | Change last commit |
| Fixup/Squash | Combine commits |
| Cherry-pick | Apply single |
| Revert | Safe undo |
| Reset | Move HEAD |
| Reflog | Recover lost |
| Filter-repo | Clean history |
| Graft | Join histories |

### 4. Collaboration
| Term/Concept | Description |
| --- | --- |
| Fork | Personal copy |
| Clone | Local copy |
| Pull | Fetch + merge |
| Push | Send commits |
| Fetch | Download only |
| Remote | Tracked repo |
| Upstream | Source repo |
| PR/MR | Review process |
| Code Owner | Required reviewer |
| Protected Branch | Restricted push |

### 5. Hooks
| Term/Concept | Description |
| --- | --- |
| Pre-commit | Before commit |
| Commit-msg | Validate message |
| Pre-push | Before push |
| Post-merge | After merge |
| Client-side | Local enforcement |
| Server-side | Remote enforcement |
| Husky | Node.js hooks |
| Lefthook | Fast hooks |
| Pre-commit | Python framework |
| Bypass | --no-verify |

### 6. Large Files
| Term/Concept | Description |
| --- | --- |
| LFS | Large File Storage |
| Pointer | Small file reference |
| Track | Pattern matching |
| Migrate | Convert history |
| Prune | Cleanup old |
| Lock | Prevent changes |
| Partial Clone | Filter blobs |
| Sparse Checkout | Limit paths |
| Shallow Clone | Limited history |
| Bundle | Offline transfer |

### 7. GitOps
| Term/Concept | Description |
| --- | --- |
| Declarative | Desired state in Git |
| Pull-based | Agent syncs |
| Push-based | CI applies |
| Drift | Actual vs desired |
| ArgoCD | Pull-based operator |
| Flux | GitOps toolkit |
| Manifest | K8s YAML |
| Helm Chart | Packaged app |
| Kustomize | Customization |
| Reconciliation | Sync loop |

### 8. Security
| Term/Concept | Description |
| --- | --- |
| Signed Commit | GPG/SSH signature |
| Verified | Green badge |
| Secret Scanning | GitHub feature |
| .gitignore | Exclude files |
| Git Crypt | Encrypt files |
| SOPS | Secrets ops |
| Credential Helper | Store tokens |
| SSH Agent | Key management |
| 2FA | Account security |
| Allowed Signers | SSH verify |

### 9. Performance
| Term/Concept | Description |
| --- | --- |
| Packfile | Compressed objects |
| GC | Garbage collection |
| Repack | Optimize packs |
| Shallow | Limited depth |
| Partial | Blobless/tree-less |
| Sparse | Selected paths |
| Worktree | Multiple checkouts |
| Maintenance | Auto tasks |
| Delta | Compression |
| Bitmap | Fast counts |

### 10. DevOps Integration
| Term/Concept | Description |
| --- | --- |
| CI Trigger | On push/PR |
| Cache Key | Commit SHA |
| Artifact | Build output |
| Environment | Deploy target |
| Tag Trigger | Release pipeline |
| Changelog | From commits |
| Version Bump | Semantic |
| Monorepo | Single repo |
| Polyrepo | Multiple repos |
| Trunk-based Dev | Frequent merge |

