# Auto correct mistakes
setopt correct
# Extended globbing. Allows using regular expressions with *
setopt extendedglob
# Case insensitive globbing
setopt nocaseglob
# Array expension with parameters
setopt rcexpandparam
# Don't warn about running processes when exiting
setopt nocheckjobs
# Sort filenames numerically when it makes sense
setopt numericglobsort
# No beep
setopt nobeep
# Immediately append history instead of overwriting
setopt appendhistory
# If a new command is a duplicate, remove the older one
setopt histignorealldups
# if only directory path is entered, cd there.
setopt autocd

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# automatically find new executables in path
zstyle ':completion:*' rehash true
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500

FPATH=$HOME/.zshrc.d:$FPATH

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Don't consider certain characters part of the word
WORDCHARS=${WORDCHARS//\/[&.;]}

bindkey -e
# Confirm before overwriting something
alias cp="cp -i"
# Human-readable sizes
alias df='df -h'
# Show sizes in MB
alias free='free -m'
# Switch to Neovim
alias vim=nvim

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Simple prompt
PROMPT='%B%F{white}λ%f%b %~ > '

# Add bin to PATH
PATH=$HOME/bin:"$PATH"

# Keychain
eval $(keychain --eval --agents ssh id_rsa)
