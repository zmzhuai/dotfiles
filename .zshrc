# Path to your oh-my-zsh installation.
export ZSH=/Users/zhangmin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="zhangmin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx brew gem zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig='vi ~/.zshrc'
alias vimconfig='vi ~/.vimrc'
alias sz='source ~/.zshrc'     # Easily source your ~/.zshrc file.
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias grep='grep --color=auto'
alias subl='open -a "Sublime Text"'
alias -s txt='vi'
alias -s lua='vi'
alias -s cpp='vi'
alias -s c='vi'
alias -s h='vi'
alias -s zip='unzip'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'

alias nls='npm ls -g --depth=0'
alias nup='npm update -g'

alias ssh="TERM=xterm-256color ssh"
alias tmux="TERM=screen-256color-bce tmux"

# Proxy
PORT=1087
alias hp="http_proxy=http://127.0.0.1:${PORT}/ https_proxy=http://127.0.0.1:${PORT}/"
gp=" --config http.proxy=localhost:${PORT}"

alias -g 'serveralias=serveralias -t zsh'

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=$PATH:/Users/zhangmin/depot_tools

# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export PROJECT_HOME="$HOME/.virtualenvs"
# export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/zhangmin/Developer/cocos2d-x-3.7.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/zhangmin/Developer/cocos2d-x-3.7.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=/Users/zhangmin/.sdkbox
export PATH=${SDKBOX_HOME}/bin:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/zhangmin/cocos2d-x-3.16/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/zhangmin"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/zhangmin/cocos2d-x-3.16/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export TERM=xterm-256color-italic
export THEOS="/Users/zhangmin/theos"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

