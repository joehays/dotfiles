# History control
# don't use duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file instead of overwrite
shopt -s histappend

# Aliases
alias cp='cp -Rv'
alias dff="df --total -h | grep -v snap | grep -v tmpfs"
alias dun='function dun(){ du -h --max-depth="${1:-1}" | sort -h --reverse; }; dun'
alias h='history'
alias ls='ls --color=auto -ACF'
alias l='ls'
alias la='ls -A'
alias ll='ls -alFh'
alias grep='grep --color=auto'
alias grepw='grep --color=auto -Hrnwi'
alias mkcd='function mkcd(){ mkdir -pv "$1"; cd "$1"; }; mkcd'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias nv='nvim'
alias pdf="xdg-open" #"gio open", or "evince"
alias wget='wget -c'
alias tree="tree -aI 'test*|.git|node_modules|resources'"
alias tldr="tldr -t ocean"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete goto _git_checkout
fi

alias gadd='git add -u'
alias gcom='git commit'
alias gsup='git status'
alias goto='git checkout'
alias branches='git branch -v'
alias firewood='for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done'
alias remotes='git remote -v'
alias forgotsubmodules='git submodule update --init --recursive'
alias checkgit='~/.git-rundown.sh'
alias wsl-vpnkit="sudo VMEXEC_PATH=${HOME}/apps/wsl-vpnkit/wsl-vm GVPROXY_PATH=${HOME}/apps/wsl-vpnkit/wsl-gvproxy.exe ${HOME}/apps/wsl-vpnkit/wsl-vpnkit"

alias g.a='git add -u'
alias g.c='git commit'
alias g.s='git status'
alias g.co='git checkout'
alias g.b='git branch -v'
alias g.ps='git push'
alias g.pd='git pull'
alias g.r='git remote -v'
alias g.subup='git submodule update --init --recursive'
alias g.lo="git log --oneline --format=\"%h %as [%an] -- %s\""
#  a      = commit --amend
#  br     = branch -av
#  ca     = !git add -A && git commit                # Commit all changes.
#  ci     = commit
#  co     = checkout
#  cp     = cherry-pick
#  d      = diff
#  dc     = diff --cached
#  df     = diff --word-diff
#  g      = log --graph --pretty=custom              # Show custom graph.
#  l      = log --pretty=custom                      # Show custom log.
#  ls     = log --pretty=custom                      # Show custom log.
#  lc     = shortlog --summary --numbered            # List contributors.
#  ll     = log --pretty=custom --decorate --numstat
#  p      = push
#  r      = rebase
#  rlc    = reset --hard HEAD~1                      # Remove last commit.
#  sa     = stash apply
#  sc     = stash clear
#  sd     = stash drop
#  sl     = stash list
#  sp     = stash pop
#  ss     = stash save
#  sw     = stash show
#  st     = status
#  tags   = tag -l
#  ulc    = reset --soft HEAD~1                      # Undo last commit.
#  un     = reset HEAD --
#  up     = pull upstream master
#  screwit = !git reset --hard HEAD && git clean -df

alias turbo="/opt/TurboVNC/bin/vncserver -localhost"
alias docps="docker ps --format \"table {{.Names}}\" | grep -v NAMES"
alias active-users="ps -eo user | sort | uniq | grep -Ev \"USER|avahi|colord|gdm|kernoops|lp|messagebus|root|rtkit|syslog|systemd|whoopsie|xrdp|_rpc|daemon\""

################
# TODO: move to scripts that install these tools
################
#alias ov=/opt/ov/omniverse-launcher-linux.AppImage
if [ ! -z ${TERMUX_VERSION} ]; then
  alias rm="trash"
fi
################

# Show contents of dir after action
#function cd () {
#   dir="$1"
#   # cd with no argument should go to ~
#   if [[ -z "$dir" ]]; then
#       builtin cd
#   else
#       builtin cd "$dir"
#   fi
#   ls -ACF
#}

# Golang install or upgrade
function getgolang() {
  if [ $# -eq 0 ]; then
    firefox https://go.dev/doc/install
    echo "Please provide the latest version!"
    return 1
  fi
  sudo rm -rf /usr/local/go
  wget -q -P tmp/ https://dl.google.com/go/go"$@".linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf tmp/go"$@".linux-amd64.tar.gz
  rm -rf tmp/
  go version
}

# GHCLI install or upgrade
function getghcli() {
  wget -q -P tmp/ https://github.com/cli/cli/releases/download/v"$@"/gh_"$@"_linux_amd64.deb
  cd tmp/ && sudo dpkg -i gh_"$@"_linux_amd64.deb
  cd .. && rm -rf tmp/
  gh --version
}

# Hugo install or upgrade
function gethugo() {
  wget -q -P tmp/ https://github.com/gohugoio/hugo/releases/download/v"$@"/hugo_extended_"$@"_Linux-64bit.tar.gz
  tar xf tmp/hugo_extended_"$@"_Linux-64bit.tar.gz -C tmp/
  sudo mv -f tmp/hugo /usr/local/bin/
  rm -rf tmp/
  hugo version
}

# Hugo site from exampleSite in themes/
function hugotheme() {
  HUGO_THEME="$1" hugo "${@:2}" --themesDir ../.. -v
}

# Markdown link check in a folder, recursive
function mlc() {
  find $1 -name \*.md -exec markdown-link-check -p {} \;
}

# Go
export GOPATH=~/go
export PATH=$PATH:/usr/local/bin:/usr/local/go/bin:~/.local/bin:$GOPATH/bin

# Vim for life
export EDITOR=/usr/bin/vim

# Bash completion
source ~/.git-completion.bash # DUP

# Color prompt
export TERM=xterm-256color

# Colours have names too. Stolen from @tomnomnom who stole it from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
#txtylw='\[\e[0;93m\]' # Yellow
#txtylw='\[\e[0;33m\]' # Yellow
#txtylw='\[\e[38;5;229m\]' # Light Yellow
#txtylw='\[\e[38;5;228m\]' # Light Yellow
#txtylw='\[\e[38;5;226m\]' # Light Yellow
txtylw='\[\e[38;5;222m\]' # Pale Gold
#txtblu='\[\e[0;34m\]' # Blue
#txtblu='\[\e[0;36m\]' # Light Blue
txtblu='\[\e[1;34m\]' # Bright Blue
#txtblu='\[\e[38;5;117;34m\]' # Light Sky Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;96m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtblu}"
hostC="${txtpur}"
#pathC="${txtcyn}"
pathC="${txtylw}"
#pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtwht}"
normalC="${txtrst}"

# Red pointer for root
if [ "${UID}" -eq "0" ]; then
  pointerC="${txtred}"
fi

gitBranch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="${pathC}\u@\h${nameC}:\w ${gitC}\$(gitBranch)${pointerC}\$${normalC}"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Ruby Gems to ~/gems
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"

# enable PYENV
export PATH="${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export JAVA_HOME=/usr/local/openjdk-17
export PATH=$JAVA_HOME/bin:$PATH
alias gant=ganttproject

export PATH="/usr/local/cuda-12.4/bin:${PATH}"
export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64:${LD_LIBRARY_PATH}"

export PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"
export MANPATH="/usr/local/texlive/texmf-dist/doc/man:${MANPATH}"
export INFOPATH="/usr/local/texlive/texmf-dist/doc/info:${INFOPATH}"
export PATH="${PATH}:/opt/nvim-linux64/bin"
alias lzg="lazygit"
alias lzd="lazydocker"
alias nv="nvim"
export PATH="${HOME}/.local/kitty.app/bin:${PATH}"
alias lzv="nvim"
#alias fd="fdfind"
alias dirs="dirs -p"

# change terminal colors
# xrdb -merge -I$HOME ~/.Xresources

#. "$HOME/.cargo/env"

# LC_COLLATE defines how 'ls' will sortt it's ooutput. Using 'en_US' separates .dotfiles and upper and lower case files.
export LC_COLLATE=en_US
alias wt="wezterm"
export PATH="${PATH}:/opt/nvim-linux-x86_64/bin"

export TERMUX_FONT_SIZE=24
