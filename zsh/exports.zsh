# add the user specific bin to the path
export PATH=~/bin:/usr/local/bin:${PATH}

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# default editor settings
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='most'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

# virtualenv settings
export WORKON_HOME=${HOME}/dv/virtualenvs
export PROJECT_HOME=${HOME}/dv