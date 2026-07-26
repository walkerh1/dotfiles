export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR=nvim
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$GOPATH/mod"
export PATH="$PATH:$GOBIN:$HOME/.local/bin"

# Pagers
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# MAC specific environment variables
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
