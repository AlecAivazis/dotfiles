# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^K"     kill-whole-line                       # ctrl-k
bindkey "^R"     history-incremental-search-backward   # ctrl-r
bindkey "^I"     beginning-of-line                     # ctrl-a  
bindkey "^A"     end-of-line                           # ctrl-e
bindkey "[B"     history-search-forward                # down arrow
bindkey "[A"     history-search-backward               # up arrow
bindkey "^I"     complete-word                         # tab         
