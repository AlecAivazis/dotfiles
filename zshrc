source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/bindkeys.zsh
fpath=(/Users/alec/.docker/completions $fpath)
source ~/.zsh/completion.zsh
_starship_cache="$HOME/.zsh/starship_init.zsh"
if [[ ! -f "$_starship_cache" || "$(command -v starship)" -nt "$_starship_cache" ]]; then
  starship init zsh > "$_starship_cache"
fi
source "$_starship_cache"
unset _starship_cache
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/secrets.zsh
[ -f ~/.zsh/local.zsh ] && source ~/.zsh/local.zsh
source ~/.zsh/syntax_highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin:/Users/alec/Library/Python/3.11/bin"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alec/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/alec/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alec/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/alec/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/alec/.bun/_bun" ] && source "/Users/alec/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# run completions
source <(run completion zsh)
