# you use startx on Arch with no display manager, 
# the most common issue is the session not being registered
# Tell logind this will become an X11 session
# Must be set BEFORE startx — PAM reads it at session creation time
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=i3
export XDG_CURRENT_DESKTOP=i3

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export DEV="$HOME/dev"
export DOTFILES="$DEV/dotfiles"
export SCRIPTS="$DEV/scripts"
export NOTES="$HOME/Second-Brain"

export EDITOR=nvim
export VISUAL=nvim

#export GITUSER="srivastavavisek"

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

#redshift -x

# AUTO-START X ON TTY1
#if [[ -z "$DISPLAY" ]] && [[ "$XDG_VTNR" -eq 1 ]]; then
#    exec startx
#fi
if [[ -z $DISPLAY ]] && [[ "$(tty)" = /dev/tty1 ]]; then
    exec startx
fi
# systemd is technically bulletproof.
# configure this for systemd service: "~/.config/systemd/user/startx.service"
# else stick with .zprofile or .bash_profile
