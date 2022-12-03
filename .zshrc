export CLICOLOR=1
export LSCOLORS=fxxxxxxxxxxxxxxxxxxxxx

export PATH="$HOME/code/go/bin:$PATH"
export PATH="$HOME/code/bin:$PATH"

alias c="clear"
alias v="nvim"
alias y="yarn"
alias g="git"

alias sshk="kitty +kitten ssh"

# Zsh history
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

source ~/.config/zinit/.zinitrc

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
