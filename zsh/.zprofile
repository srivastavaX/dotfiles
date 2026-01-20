export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR=nvim
export VISUAL=nvim

# Directories
#export GITUSER="srivastavavisek"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$REPOS/scripts"
export ZETTELKASTEN="$HOME/Zettelkasten"


# PATH-CONFIGURATION
typeset -U path
path+=(
    $SCRIPTS
    $HOME/bin
    $HOME/.local/bin
    $HOME/.local/share/fnm  # fnm
    #$HOME/dotnet
    #/home/vscode/.local/bin
    #
)
#export PATH
# zsh automatically exports PATH

# SOURCING
#[[ -f ~/.zshrc ]] && . ~/.zshrc
# This makes login shells behave like interactive shells by force.

# AUTO-START X ON TTY1
if [[ -z $DISPLAY ]] && [[ "$(tty)" = /dev/tty1 ]]; then
    exec startx
fi
# systemd is technically bulletproof.
# configure this for systemd service: "~/.config/systemd/user/startx.service"
# else stick with .zprofile or .bash_profile
