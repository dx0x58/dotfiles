# it makes path items uniq
typeset -U PATH path

export ZDOTDIR="$HOME/.config/zsh"


# XDG configs
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export PATH="$PATH:/Users/user/.local/bin"
. "$HOME/.cargo/env"
