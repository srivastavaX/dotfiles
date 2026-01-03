# autoload is a lazy loader
#
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

setopt autocd extended_glob notify
#setopt beep
#unsetopt beep

#
# _______ HISTORY _____________________________________________________________
#
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY      # Share history between sessions
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# for aliases better to focus on HIST_IGNORE_SPACE and prefix a space

export HISTTIMEFORMAT="%F "

#
# _______ ENV-VARIABLES _______________________________________________________
#
export EDITOR=nvim
export VISUAL=nvim

# Directories
export GITUSER="srivastavavisek"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$REPOS/scripts"
export ZETTELKASTEN="$HOME/Zettelkasten"

# Path-Configuration
typeset -U path
path+=(
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
    #$HOME/dotnet
    #/home/vscode/.local/bin
    #
)
# export PATH
# zsh automatically exports PATH


#
# _______ BINDKEYS ____________________________________________________________
#
#bindkey -v
bindkey -e  # force emacs mode everywhere

#
# _______ COMPLETION___________________________________________________________
#
autoload -Uz compinit
compinit -d ~/.cache/zsh/compdump


#
# _______ SOURCING ____________________________________________________________
#
. ~/.zsh_aliases


#
# _______ MISC ________________________________________________________________
#
FASTFETCH="/tmp/fastfetch_shown"
if [[ ! -f "$FASTFETCH" && "$TERM" == "alacritty" ]]; then
    fastfetch
    touch "$FASTFETCH"
fi
