# Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GAhl'

function unity {
    /Applications/Unity/Unity.app/Contents/MacOS/Unity "$@"
}


## mm aliases
alias mm='python3 ${HOME}/dv/dad/mm//make/mm.py'
alias mm.env='mm --env=sh'
alias mm.show='mm --show --dry'
alias mm.bldroot='mm --dry --quiet --show=BLD_ROOT'

mm.paths() {
    # get {mm} to print out the path variables
    eval $(python3 ${HOME}/dv/dad/mm/make/mm.py --quiet --paths=sh $*)
}

alias bfg="java -jar /usr/local/bin/bfg.jar"

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }
