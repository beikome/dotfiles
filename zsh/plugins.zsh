# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

# Syntax
zinit light zsh-users/zsh-syntax-highlighting

ZSH_HIGHLIGHT_STYLES[comment]='fg=#8f8f8f'

# Completion
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#b48ead'  # 落ち着いたピンク

# Git
zinit light paulirish/git-open

