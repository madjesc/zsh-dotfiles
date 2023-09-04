# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/maurd/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt autocd beep extendedglob nomatch
# bindkey -v
# End of lines configured by zsh-newuser-install

# Set VTE terminal
source /etc/profile.d/vte.sh

# Enviroment variables definitions
PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/golang/bin:$HOME/.cargo/bin
EDITOR=nvim
export BAT_THEME='Visual Studio Dark+'
export GIT_PS1_SHOWDIRTYSTATE=1
export GOPATH=$HOME/.local/share/golang

# Aliases
alias ncfg="(cd ~/.config/nvim; nvim .)"
alias ls="ls --group-directories-first --color"
alias la="ls -la"
alias cat="bat -pp"

# Add plugins
source $HOME/.opt/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# source $HOME/.opt/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/git-core/contrib/completion/git-prompt.sh

# Set the prompt
autoload -U colors && colors
# autoload -Uz promptinit && promptinit
function precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
	GIT_THING=`__git_ps1 " \uF157 %s"`
	VENV_THING="%{$fg[cyan]%}"`[ -n $VIRTUAL_ENV ] && echo $VIRTUAL_ENV_PROMPT`"%{$reset_color%}"
  # VTE_PWD_THING=`__vte_osc7`
	PROMPT_ICON="%{$fg_bold[gray]%}["$'\uF253'" ]%{$reset_color%} "
	PROMPT=$PROMPT_ICON$VENV_THING"%{$fg_bold[cyan]%}%M@%n%{$reset_color%} %{$fg_bold[white]%}%%:%{$reset_color%} "
	RPROMPT="%{$fg_bold[gray]%}%~%{$reset_color%} %{$fg_bold[green]%}"$GIT_THING"%{$reset_color%}"
}


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
