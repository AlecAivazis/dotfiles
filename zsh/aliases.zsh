# Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GAhl'

## mm aliases

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

## authorea aliases

alias au-start-thin='thin start'
alias au-start-redis='bundle-1.9 exec redis-server'
alias au-start-foreman='bundle-1.9 exec foreman start'
# start each of the services in their own tab
alias au-start='tab au-start-thin ; tab au-start-redis ; tab au-start-foreman'

alias au-kill-foreman='ps -ef |grep foreman|awk '"'"'NR==1{print $2}'"'"'|xargs kill'
alias au-kill-faye='lsof -i:9292 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs kill -9'
alias au-kill-redis='lsof -i:6379 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs kill'
alias au-kill-thin='lsof -i:3000 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs kill'
alias au-kill='au-kill-redis ; au-kill-foreman ; au-kill-thin ; au-kill-faye'