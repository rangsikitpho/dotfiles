# bash aliases for Git
# included by .bashrc
# I still all of this shit from jqr/Elijah Miller

alias gi='git init; printf "*.swp\n.DS_Store\nThumbs.db\n" >> .gitignore'

# http://www.jukie.net/~bart/blog/pimping-out-git-log
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%an %cr)%Creset' --abbrev-commit --date=relative"
alias glp='gl -p'

alias gs='git status'
alias gd='git diff'
alias gds='git diff --cached'
alias gdh='git diff HEAD'

alias ga='git add'
alias gc='git commit -v'
alias gca='gc -a'

alias gp='git pull --rebase'
alias gpp='gp && git push origin `current_git_branch`'
alias gprp='gp && rake && gpp'
alias gri='git rebase -i origin/master^'
alias grc='git rebase --continue'

alias gb='git branch'
complete -o default -o nospace -F _git_branch gb

alias gcb='git checkout -b'
complete -o default -o nospace -F _git_branch gcb

alias grma='git ls-files --deleted | xargs git rm'

function ggc() {
  set -- `du -ks`
  before=$1
  git reflog expire --expire=1.minute refs/heads/master && git fsck --unreachable && git prune && git gc
  set -- `du -ks`
  after=$1
  echo "Cleaned up $((before-after)) kb."
}

function grb() {
  git push origin `current_git_branch`:refs/heads/$1
  git fetch origin &&
  git checkout -b $1 --track origin/$1
}

function current_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
