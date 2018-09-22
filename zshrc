source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/secrets.zsh
source ~/.zsh/syntax_highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alec/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/alec/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alec/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/alec/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

PATH="/Users/alec/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/alec/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alec/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alec/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alec/perl5"; export PERL_MM_OPT;

# added by travis gem
[ -f /Users/alec/.travis/travis.sh ] && source /Users/alec/.travis/travis.sh
