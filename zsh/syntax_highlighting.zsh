# make sure its using the correct syntax for specifying options
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# configure highlighting
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[path]=none
