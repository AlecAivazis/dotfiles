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

alias au-start-redis='redis-server'
alias au-start-foreman='rvm use "1.9.3-p125@sampleGollum" --create -- && bundle exec foreman start'
alias au-start-thin='rvm use "1.9.3-p125@sampleGollum" --create -- && bundle exec thin start'
alias au-start-thin-test='rvm use "1.9.3-p125@sampleGollum" --create -- && bundle exec thin start -e test -p 3001'
alias au-start-webpack='npm install && webpack --watch --colors'
alias au-start='au-start-webpack; au-start-redis ; au-start-foreman ; au-start-thin'

alias au-kill-foreman='ps -ef |grep foreman|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill'
alias au-kill-faye='lsof -i:9292 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill -9'
alias au-kill-redis='lsof -i:6379 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill'
alias au-kill-thin='lsof -i:3000 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill'
alias au-kill-thin-test='lsof -i:3001 |grep LISTEN|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill'
alias au-kill-webpack='ps -ef |grep node|grep webpack|awk '"'"'{print $2}'"'"'|xargs -r kill'
alias au-kill-spork='ps -ef |grep spork|awk '"'"'NR==1{print $2}'"'"'|xargs -r kill'
alias au-kill='au-kill-spork; au-kill-webpack ; au-kill-redis ; au-kill-foreman ; au-kill-thin ; au-kill-thint-est; au-kill-faye'

alias au-spork='bundle exec spork -p 8988'
alias au-foreman-test='bundle exec foreman start -f Procfile.test'
alias au-test-setup='bundle exec rake db:test:prepare; au-kill; au-start-redis; au-foreman-test'
alias au-test-up='au-test-setup; au-spork; au-thin-test'
alias au-test='testdrb -I test $(find . -name "*_test.rb")'
