# Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GAhl'
alias la='ls -GAhl'

# Git-aware ls function that shows git status for files
function gls() {
    # First show regular ls output
    ls -GAhl "$@"

    # If we're in a git repo, show git status for context
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo ""
        echo "Git status:"
        git status --porcelain | head -10
        if [ -f .gitignore ]; then
            echo ""
            echo "Gitignored files in current directory:"
            git ls-files --others --ignored --exclude-standard | grep -v '/' | head -5
        fi
    fi
}

function unity {
    /Applications/Unity/Unity.app/Contents/MacOS/Unity "$@"
}


alias bfg="java -jar /usr/local/bin/bfg.jar"

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }
