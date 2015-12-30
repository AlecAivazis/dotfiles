source ~/.zsh/antigen.zsh

# node completions
antigen bundle coffee
antigen bundle node
antigen bundle npm

# python completions
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# zsh addons
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zaw
antigen bundle zsh-users/zsh-syntax-highlighting

# tell antigen we're done
antigen apply