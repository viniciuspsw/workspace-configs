export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/vinicius/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
export GPG_TTY=$(tty)

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  line_sep
  char
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=cyan

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# For Windows with WSL
# alias smerge="smerge.exe"
