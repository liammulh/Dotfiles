#=================================================
# Options
#=================================================

# Use Vi mode.
set -o vi

#=================================================
# Aliases
#=================================================

alias c="clear"
alias l="ls -ahl"
alias ..="cd .."

#=================================================
# Variables
#=================================================

# Set default editor.
export VISUAL="vim"
export EDITOR="vim"

#=================================================
# Prompt
#=================================================

source ~/.config/bash/git-prompt.sh

# Show:
# (1) basename of working directory
# (2) Git prompt
# (3) exit status of last command
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s)")'
PS1='\W ${PS1_CMD1} $? '

GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS="yes"

#=================================================
# PATH Setup
#=================================================

export PATH="$HOME/.local/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$PATH:/opt/homebrew/bin"
fi

case ":${PATH}:" in
*:"$HOME/.cargo/bin":*) ;;
*) export PATH="$HOME/.cargo/bin:$PATH" ;;
esac

#=================================================
# Node Version Manager
#=================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#=================================================
# zoxide
# https://github.com/ajeetdsouza/zoxide
#=================================================

eval "$(zoxide init bash)"
