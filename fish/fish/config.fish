set -x PATH /usr/local/bin $PATH

# for python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
. (pyenv virtualenv-init -)


