# Colors
# -------------------------------------
autoload colors
colors

# Prompt
# -------------------------------------
setopt prompt_subst # use colors in prompt
unsetopt promptcr

# Completion
# ----------------------------------------
autoload -U compinit
compinit -u
export LISTMAX=20

# Aliases
# ----------------------------------------
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
alias w3m='w3m -O ja_JP.UTF-8'

# ls colors in completion
export LS_COLORS='di=1;34:ln=1;35:so=32:pi=33:ex=1;31:bd=46;34:cd=43;34:su=41;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1 # C-P/C-N

# match upper case from lower case, search after -_./
# dir => Dir, _t => some_tmp, long.c => longfilename.c
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[-_./]=** r:|=*'

# Options
# -----------------------------------------------------
setopt no_beep          # 補完候補がないときにビープ音をならさない
setopt nolistbeep       # 曖昧補完でビープ音をならさない
setopt autolist         # 補完時にリスト表示
setopt listtypes
unsetopt menucomplete   # 最初から候補を循環する
setopt automenu         # 共通部分を補完しそれ以外を循環する準備
setopt extendedglob     # 展開で^とか使う
setopt numericglobsort  # 数字展開は数値順
setopt autoparamkeys    # 補完後の:,)を削除
fignore=(.o .swp lost+found) # 補完で無視する

# for Vim
# -----------------------------------------------------
set KEYTIMEOUT=1

source ~/.zshenv


