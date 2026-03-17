alias gl='git pull'
alias gp='git push'
alias gcl='git clean -f'
alias gd='git diff'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias gsiu='git submodule init && git submodule update'
alias gsu='git submodule foreach git pull'

alias lg='lazygit'

# merge a worktree branch into current branch, then clean up
gmwt() {
  local branch
  branch=$(git worktree list | grep -v '(bare)' | grep "$HOME/.claude/worktrees/" | awk '{print $3}' | tr -d '[]' | fzf --prompt="merge worktree> ") || return

  local wt_path
  wt_path=$(git worktree list | grep "\[$branch\]" | awk '{print $1}')

  git merge "$branch" && \
    git worktree remove "$wt_path" && \
    git branch -D "$branch"
}
