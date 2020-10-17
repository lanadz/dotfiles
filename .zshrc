source ~/.bash_aliases

# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz colors && colors
autoload -Uz vcs_info 
autoload -Uz compinit && compinit

precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'

setopt PROMPT_SUBST
PROMPT='%F{040}%n%f%{$fg_bold[yellow]%}@%{$fg_no_bold[red]%}${PWD/#$HOME/~}%f%{$fg[magenta]%}${vcs_info_msg_0_}%f %{$fg_bold[yellow]%}$%{$reset_color%}'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

