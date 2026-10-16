# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR=nvim
export BROWSER=librewolf

# npm/node
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/.npmrc"
export NPM_BIN="$XDG_DATA_HOME/npm/bin"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$GOPATH/mod"

# Man pages
export MANPAGER="less --RAW-CONTROL-CHARS --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# PATH
export PATH="$PATH:$GOBIN:$NPM_BIN:$HOME/.local/bin"

# Where grim saves screenshots
export GRIM_DEFAULT_DIR="$HOME/screenshots"
