export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR=nvim

# npm/node
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/.npmrc"
export NPM_BIN="$XDG_DATA_HOME/npm/bin"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$GOPATH/mod"

# Pagers
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Colours (MAC_ONLY)
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Homebrew (MAC_ONLY)
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# PATH: append bin directories
export PATH="$PATH:$GOBIN:$NPM_BIN:$HOME/.local/bin"
