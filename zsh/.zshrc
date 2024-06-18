# load Oh My Zsh
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"

# load plugins from sheldon
eval "$(sheldon source)"

# prompt theme
ZSH_THEME=cloud

# Alias
if [[ -e $HOME/.alias ]]; then
    source $HOME/.alias
fi
