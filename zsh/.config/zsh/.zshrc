if (( ${+DEBUG_ZSH_PERF} )); then
  zmodload zsh/zprof
fi

# Create required XDG-*-HOME/* directories if they don't already exist.
[[ -d "$XDG_CONFIG_HOME"/zsh ]] || mkdir -p "$XDG_CONFIG_HOME"/zsh
[[ -d "$XDG_CACHE_HOME"/zsh ]] || mkdir -p "$XDG_CACHE_HOME"/zsh

# (MAC_ONLY)
# Add completions for brew and for packages installed with brew. Prepending
# this path to fpath means the brew version of a tool's completions will be
# preferred over the system's ones, if the system has any.
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath) # see `brew info zsh-completions`

# Aliases
alias ll="ls -lAh"
alias git="noglob git" # so git can use glob pattern without the shell expanding it.
alias cdp="cd $OLDPWD" # cd into previous working directory

# Persist zsh command history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
LESSHISTFILE="$XDG_CACHE_HOME/less/less_history"

# Useful history options. See HIST* options in `man zshoptions`.
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS 

# Emacs keybindings
bindkey -e

# Useful keybindings for zsh line editor (zle). See `man zshzle` and 
# `man zshcontrib` for available widgets and functions.
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end

# Edit command line in $EDITOR. See `man zshcontrib`.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Custom prompt with last exit_status and git info.
__update_prompt() {
  local exit_status=$?
  arrow='➜'
  [[ $EUID == 0 ]] && arrow='#' # use '#' for root
  if [[ $exit_status == 0 ]]; then
    arrow="%F{green}${arrow}%f"
  else
    arrow="%F{red}${arrow}%f" # use red for error
  fi
  git=''
  local gstatus='' branch='' dirty=''
  gstatus=$(
    GIT_OPTIONAL_LOCKS=0 git status --porcelain=v2 -b --no-ahead-behind 2>/dev/null
  ) || return
  branch=${gstatus#*branch.head }
  branch=${branch%%$'\n'*}
  [[ -z $branch || $branch == "# "* ]] && return
  [[ $gstatus == *$'\n'[^#]* ]] && dirty=' *'
  git="%F{blue}git:(%f%F{red}${branch}%f%F{blue})%f%F{yellow}${dirty}%f "
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd __update_prompt # precmd functions run before PROMPT is displayed
setopt PROMPT_SUBST # enable shell variable expansion in PROMPT
PROMPT='${arrow} %F{cyan}%B${PWD:t}%b%f ${git}'

# Defer compinit to when the zsh line editor is first started. See
# zle-line-init in `man zshzle`.
autoload -Uz compinit
zle-line-init() { 
  # Sets the path where files of dumped completion data are stored. See
  # cache-path in `man zshcompsys`.
  zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
  # This pattern means zcompdump needs to be cleared whenever completion
  # scripts are added, updated, or deleted. The -C option means if there's a
  # zcompdump cache, compinit will blindly use it. See 'Use of compinit' in
  # `man zshcompsys`.
  local dump="$XDG_CACHE_HOME/zsh/zcompdump"
  if [[ ! -f $dump ]]; then
    compinit -d "$dump"
  else
    compinit -C -d "$dump"
  fi
  FZF_TAB_PATH=/opt/homebrew/opt/fzf-tab/share/fzf-tab # MAC_ONLY
  source ${FZF_TAB_PATH}/fzf-tab.zsh # Use fzf-tab plugin for interacting with completion results.
  zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing `git checkout`
  zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
  zstyle ':completion:*' menu no # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
  zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept # custom fzf flags
  zstyle ':fzf-tab:*' switch-group '<' '>' # switch group using `<` and `>`
  zle -D zle-line-init
  unfunction zle-line-init
}
zle -N zle-line-init

if (( ${+DEBUG_ZSH_PERF} )); then
  zprof
fi

# References:
# https://github.com/smallwat3r/dotfiles/tree/26a4859c3665f4f3ef97a0d755c0e54cb822fe52/base/.zsh
# https://github.com/BreadOnPenguins/dots/tree/master/.config/zsh
# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
