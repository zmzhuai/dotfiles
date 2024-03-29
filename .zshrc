# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER="mactool"
# ZSH_THEME="spaceship"

 export EDITOR='vim'
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
plugins=(git macos brew gem)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/opt/spaceship/spaceship.zsh

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
# alias ssh="TERM=xterm-256color ssh"
# alias tmux="TERM=screen-256color-bce tmux"
# alias tmux="env TERM=xterm-256color-italic tmux"
alias ssh-keygen="ssh-keygen -t ed25519 -a 100"
alias ssh-keygen-origin="ssh-keygen"
alias sha256sum="shasum -a 256"

alias -g 'serveralias=serveralias -t zsh'

# export PATH="/usr/local/bin:$PATH"
# export N_PREFIX="$HOME/util/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


# export PATH="$HOME/.fastlane/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python@3.7/bin:$PATH"
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# export PATH=$PATH:$HOME/depot_tools

# export PROJECT_HOME="$HOME/.virtualenvs"
# source /usr/local/bin/virtualenvwrapper.sh

# export TERM=xterm-256color
# export THEOS="$HOME/theos"

# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# one dark terminal scheme
# Add colors to Terminal
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_121`
# export JAVA_HOME=`/usr/libexec/java_home -v 11.0.9`

# Go development
# export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec" # slow operate
# export GOROOT="/usr/local/opt/go/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
# libffi
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# export PATH="/usr/local/sbin:$PATH"

# flutter
# export PATH="$PATH:${HOME}/flutter/bin"

# export PATH="/usr/local/opt/php@7.4/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(brew --prefix)/bin:$PATH"
# export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
export PATH="$(brew --prefix)/opt/php@8.2/bin:$PATH"
export PATH="$(brew --prefix)/opt/php@8.2/sbin:$PATH"
export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include"

eval "$(starship init zsh)"
