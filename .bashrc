alias ll='ls -alFh --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias code='code-server'
alias pn="pnpm"
alias pnx="pnpm exec"
alias compose="docker compose"
alias diffo="diff -rq"
alias ports="lsof -i -P | grep -i 'listen'"
alias reload="source ~/.zshrc"
alias folder-size="du -h --max-depth=1"
alias rsync-folder="rsync -avzch"
alias rsync-check="rsync -avzchi --dry-run"
alias setup-sync="/workspace/setup-sync.sh"
alias disk-usage="du -sh /*"

# TODO:
# docker inspect volume docker run -rm -v darc_stacks:/inspect alpine ls -la
# docker start crashing container with bash attached to it

export EDITOR="code"

repo () {
  # --committer-date-is-author-date 
  if [[ "${1}" == "rebase" ]]; then
    git rebase --reapply-cherry-picks --no-keep-empty --rerere-autoupdate --ignore-whitespace --autosquash --autostash --update-refs ${2} ${3} --onto=${4}
  fi

  if [[ "${1}" == "clone" ]]; then
    git clone --depth=1 --progress --no-single-branch --no-checkout --filter=blob:none --filter=tree:0 ${2} ${3}
  fi
}

export PATH=$PATH:/root/.cargo/bin
export PATH="$PNPM_HOME:$PATH"
