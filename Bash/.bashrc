#=================================================
# Options
#=================================================

# Use Vi mode.
set -o vi

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
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s)")'; PS1='\W ${PS1_CMD1} $? '

GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS="yes"

#=================================================
# Neovim Linux Config
#=================================================

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
