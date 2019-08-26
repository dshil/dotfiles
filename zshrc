[ -f ~/.bashrc.local ] && source ~/.bashrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

[ ! -f $HISTFILE ] && touch $HISTFILE

setopt HIST_FIND_NO_DUPS
setopt inc_append_history
setopt share_history

autoload -U compinit
compinit
