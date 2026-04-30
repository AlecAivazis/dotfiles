function zsh_recompile {
  autoload -U zrecompile
  rm -f ~/.zsh/*.zwc
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

# Detect empty enter, execute git status if in git dir
magic-enter () {
        if [[ -z $BUFFER ]]; then
          if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
            echo -ne '\n'
            git status 
          fi
          zle accept-line
        else
          zle accept-line
        fi
}
zle -N magic-enter
bindkey "^M" magic-enter

# Enhanced git-aware file listing function
function gll() {
    echo "📁 Directory listing with git status:"
    echo "=================================="

    # Show regular ls output with colors
    ls -GAhl "$@"

    # If we're in a git repo, show additional git information
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo ""
        echo "🔍 Git status overview:"
        echo "======================"

        # Show git status with colors
        git status --short

        # Show gitignored files in current directory
        local ignored_files=$(git ls-files --others --ignored --exclude-standard 2>/dev/null | grep -E '^[^/]*$' | head -5)
        if [[ -n "$ignored_files" ]]; then
            echo ""
            echo "🚫 Gitignored files (showing first 5):"
            echo "$ignored_files" | while read file; do
                echo "   $file (ignored)"
            done
        fi

        # Show untracked files
        local untracked_files=$(git ls-files --others --exclude-standard 2>/dev/null | grep -E '^[^/]*$' | head -5)
        if [[ -n "$untracked_files" ]]; then
            echo ""
            echo "❓ Untracked files (showing first 5):"
            echo "$untracked_files" | while read file; do
                echo "   $file (untracked)"
            done
        fi
    fi
}
