# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf cp docker history pip node podman python conda pyenv poetry pre-commit ubuntu zsh-navigation-tools vscode ufw systemadmin repo man gitignore aliases conda-env systemd ssh ros npm helm eza fig command-not-found sudo rsync nvm git-lfs git-commit common-aliases git-auto-fetch uv tldr pylint copypath)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
 export ARCHFLAGS="-arch $(uname -m)"

####################################


#export LANGUAGE=(unset),                                                                                                                       │
#export LC_ALL=(unset),                                                                                                                         │
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US
export LANG=en_US.UTF-8


# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#echo ".zshrc[126] >>> ${PATH}"

#export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
alias nv="nvim"
alias glow="glow -p"


# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'


if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

alias lzv="nvim"
alias lzg="lazygit"
alias lzd="lazydocker"
#alias fd="fdfind"
#alias dirs="dirs -p"
alias rm="trash"

if [ -z ${TERMUX_VERSION} ]; then
  # enable PYENV
  export PATH="${HOME}/.pyenv/bin:${PATH}"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi 

# TODO: need to update dotfile scripts to update both .bashrc and .zshrc
# TODO need to push all .zshrc/.bashrc updates to the owning install scripts
 
##########################################
# [START] Add my custom scripts to the PATH
##########################################
my_script_path="${HOME}/dev/dotfiles/scripts"

# Check if the path is already in PATH
if [[ ":${PATH}:" != *":${my_script_path}:"* ]]; then
  # Add the path if it's not already there
  export PATH="${my_script_path}:${PATH}"
  echo "Added ${my_script_path} to PATH"
else
  echo "${my_script_path} is already in PATH"
fi
##########################################
# [END] Add my custom scripts to the PATH
##########################################

# initialize PYENV &/|| CONDA
if [ -z ${TERMUX_VERSION} ]; then
  #source init.conda
  source init.pyenv
fi

if [ -d ${HOME}/.cargo/env ]; then
  source ${HOME}/.cargo/env
fi
export PATH="/home/haysfamily/dev/dotfiles/scripts/programs/lua-5.4.7/bin:${PATH}"
export PATH="/home/haysfamily/apps/lua-5.4.7/bin:${PATH}"
export PATH="/home/haysfamily/apps/luarocks-3.11.1/bin:${PATH}"

# Make nvim the default text editor
export EDITOR=nvim
export VISUAL=nvim

# Make VI the default terminal navigation mode (options: -v, -e)
#
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
#
bindkey -e
bindkey '^R' history-incremental-search-backward

###############
alias l='ls -CF'
alias ls="ls --color"
alias ll='ls -alF'
alias la='ls -A'
#alias ll="ls -al"
alias turbo="/opt/TurboVNC/bin/vncserver -localhost"
alias du1="du -hx --max-depth=1 | sort -h --reverse"
alias dff="df --total -h | grep -v snap | grep -v tmpfs"
alias rm="trash"
alias docps="docker ps --format \"table {{.Names}}\" | grep -v NAMES"
alias active-users="ps -eo user | sort | uniq | grep -Ev \"USER|avahi|colord|gdm|kernoops|lp|messagebus|root|rtkit|syslog|systemd|whoopsie|xrdp|_rpc|daemon\""
###############

source /home/haysfamily/.cargo/env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias bat="batcat --color=always"
alias eza="eza --icons"
omz plugin load fzf

#EDITOR="nvim"
s() {
  fzf --ansi --disabled \
    --bind "change:reload:command \
          rg --line-number --no-heading --color=always --smart-case {q} \
          || :" \
    --bind "enter:execute(${EDITOR:-nvim} +{2} {1})" \
    --delimiter ":" \
    --preview "command batcat -p --color=always {1} --highlight-line {2}" \
    --preview-window 'up:80%,border-bottom,~3,+{2}+3/3'
}
