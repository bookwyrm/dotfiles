
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.git-prompt.sh
export PS1='\h:\W \u $(__git_ps1 "(%s)")\$ '

