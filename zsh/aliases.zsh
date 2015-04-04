# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

# mm aliases
alias mm='python3 ${HOME}/dv/config/make/mm.py'
alias mm.env='mm --env=sh'
alias mm.show='mm --show --dry'
alias mm.bldroot='mm --dry --quiet --show=BLD_ROOT'

mm.paths() {
    # the temp filename
    tmpfile=${HOME}/tmp/mm-setup.sh
    # get {mm} to print out the path variables
    python3 ${HOME}/dv/config/make/mm.py --quiet --paths=sh $* > ${tmpfile}
    # source it
    source ${tmpfile}
    # and remove the temporary
    rm -f ${tmpfile}
}
