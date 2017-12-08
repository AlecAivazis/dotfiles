# patch zsh cache
export ZSH_CACHE_DIR=$HOME/.zsh

# go stuff
export GOPATH=~/dv/go

# add the user specific bin to the path
export PATH=~/bin/bash:/usr/local/sbin:${GOPATH}/bin:${PATH}
export PYTHONPATH=~/bin/python

# Setup terminal, and turn on colors
export TERM=xterm-256color
export LSCOLORS=Gxfxcxdxbxegedabagacad

# default editor settings
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vi

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='most'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

# setup virtualenv if its present
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=${HOME}/dv/virtualenvs
    export PROJECT_HOME=${HOME}/dv
    source /usr/local/bin/virtualenvwrapper.sh
fi

# make sure opam is enabled
. /Users/alec/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
