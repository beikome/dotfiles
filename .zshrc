# Colors
autoload colors
colors

# Here are the colours from Textmate's Monokai theme:
#
# Black: 0, 0, 0
# Red: 229, 34, 34
# Green: 166, 227, 45
# Yellow: 252, 149, 30
# Blue: 196, 141, 255
# Magenta: 250, 37, 115
# Cyan: 103, 217, 240
# White: 242, 242, 242
#
# Thanks to Steve Losh: http://stevelosh.com/blog/2009/03/candy-colored-terminal/
 
# -------------------------------------
# Prompt
 zsh_prompt_color='blue'
function prompt {
  if [ $UID -eq 0 ]; then
    local C_USERHOST="%{$bg[white]$fg[magenta]%}"
    local C_PROMPT="%{$fg[magenta]%}"
  else
    local C_USERHOST="%{$bg[black]$fg[$zsh_prompt_color]%}"
    local C_PROMPT="%{$fg[$zsh_prompt_color]%}"
  fi
  local C_PRE="%{$reset_color%}%{$fg[$zsh_prompt_color]%}"
  local C_CMD="%{$reset_color%}%{$fg[white]%}"
  local C_RIGHT="%{$bg[black]%}%{$fg[white]%}"
  local C_DEFAULT="%{$reset_color%}"
  PROMPT=$C_USERHOST"%S%n@%m:%~ %s$C_PRE "$1"
"$C_PROMPT"✫ "$C_CMD
  RPROMPT="%S"$C_RIGHT" %D{%d %a} %* %s"$C_CMD
  # keep a few blank lines at the bottom
  echo -n -e "\n\n\n\033[3A"
}

prompt ""
POSTEDIT=`echotc se`
setopt prompt_subst # use colors in prompt
unsetopt promptcr

# ----------------------------------------
# completion
autoload -U compinit
compinit -u

export LISTMAX=20

 # ----------------------------------------
# aliases
setopt completealiases
if [ $TERM = "cygwin" ]; then
  alias ls='ls --show-control-chars --color=auto -F'
  alias l='ls --show-control-chars --color=auto -FAl'
  export LV='-Os -c'
else
  case $(uname) in
  'Linux')
    alias ls='ls --color=auto -Fh'
    alias l='ls --color=auto -FAlh'
    ;;
  'FreeBSD'|'Darwin')
    alias ls='ls -GFh'
    alias l='ls -GFAlh'
    export LSCOLORS='exfxcxdxbxegedabagacad'
    ;;
  esac
  export LV='-Ou8 -c'
fi
alias mv='mv -i'
alias rm='rm -i'
alias quit='exit'
alias ':q'='exit'
alias w3m='w3m -O ja_JP.UTF-8'

# ls, colors in completion
export LS_COLORS='di=1;34:ln=1;35:so=32:pi=33:ex=1;31:bd=46;34:cd=43;34:su=41;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1 # C-P/C-N
# match upper case from lower case, search after -_./
# dir => Dir, _t => some_tmp, long.c => longfilename.c
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[-_./]=** r:|=*'
setopt nolistbeep # 曖昧補完でビープしない
setopt autolist # 補完時にリスト表示
setopt listtypes
unsetopt menucomplete # 最初から候補を循環する
setopt automenu # 共通部分を補完しそれ以外を循環する準備
setopt extendedglob # 展開で^とか使う
setopt numericglobsort # 数字展開は数値順
setopt autoparamkeys # 補完後の:,)を削除
fignore=(.o .swp lost+found) # 補完で無視する

# -----------------------------------------------------
source ~/.zshenv
