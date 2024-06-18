# load Oh My Zsh
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"

# prompt theme
ZSH_THEME=cloud

# load plugins from sheldon
eval "$(sheldon source)"


# Alias
if [[ -e $HOME/.alias ]]; then
    source $HOME/.alias
fi
