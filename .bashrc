# Only run these commands in interactive shells
if [[ $- == *i* ]]; then
  # source all common settings
  source ${HOME}/.common_shrc
  #source .common_home_shrc
  #source .common_work_shrc
  #source .work_bashrc
  #source .home_bashrc
fi

# History control (append to the history file instead of overwrite)
shopt -s histappend

# Set history file and size
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Make EMACS the default terminal navigation mode (options: -v, -e)
set -o emacs
#  Emacs Mode (Default)
#
#  Ctrl + A → Move to the beginning of the line
#  Ctrl + E → Move to the end of the line
#  Alt + B → Move back one word
#  Alt + F → Move forward one word
#
#  Vi Mode
#
#  Press Esc to enter command mode
#  h / l → Move left / right
#  b / w → Move back / forward one word
#  0 / $ → Jump to the start / end of the line
#  i → Switch to insert mode (to type normally)

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
#txtpur='\[\e[0;35m\]' # Purple/Magenta
#txtpur='\[\e[38;5;219m\]' # Light Purple
#txtpur='\[\e[38;5;216m\]' # Thistle (Light Purple)
#txtpur='\[\e[38;5;213m\]' # Light Purple
txtpur='\[\e[38;5;183m\]' # Plum
#txtpur='\[\e[38;5;177m\]' # Violet
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

# change terminal colors
# xrdb -merge -I$HOME ~/.Xresources

##########################################
# FzF Support
##########################################
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
alias rm=trash
export PS1='\u@\h:\w$ '
alias duf=~/apps/duf/duf
alias rm=trash
export PS1='\u@\h:\w$ '
alias duf=~/apps/duf/duf
