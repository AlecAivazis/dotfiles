# add the user specific bin to the path
export PATH=~/bin:/usr/local/sbin:${PATH}
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

# virtualenv settings
export WORKON_HOME=${HOME}/dv/virtualenvs
export PROJECT_HOME=${HOME}/dv
source /usr/local/bin/virtualenvwrapper.sh
