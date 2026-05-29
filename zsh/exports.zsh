# patch zsh cache
export ZSH_CACHE_DIR=$HOME/.zsh
export SHELL=/bin/zsh

# go stuff
export GOPATH=~/dv/go
export GO111MODULE=on

# env vars for git
export GIT_PAGER="diff-so-fancy | less --tabs=4 -RFX"

# add the user specific bin to the path
export PATH=~/dv/dotfiles/bin/bash:~/bin/bash:~/.dotnet/tools:/usr/local/sbin:${GOPATH}/bin:${PATH}
export PYTHONPATH=~/bin/python

# Setup terminal, and turn on colors
export TERM=xterm-256color
# LSCOLORS is now set in colors.zsh to avoid conflicts

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

export NVM_DIR="$HOME/.nvm"

# Lazy-load NVM — only initialize when nvm/node/npm/etc are first used
function _nvm_load() {
  unfunction nvm node npm npx yarn pnpm 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}
function nvm()  { _nvm_load; nvm "$@"; }
function node() { _nvm_load; node "$@"; }
function npm()  { _nvm_load; npm "$@"; }
function npx()  { _nvm_load; npx "$@"; }
function yarn() { _nvm_load; yarn "$@"; }

# Put the active node version on PATH immediately (without loading nvm)
# so shebangs and scripts that call node directly still work
if [ -s "$NVM_DIR/alias/default" ]; then
  export PATH="$NVM_DIR/versions/node/$(cat "$NVM_DIR/alias/default")/bin:$PATH"
fi

export PNPM_HOME="/Users/alec/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

