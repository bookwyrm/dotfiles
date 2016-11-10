# Colors
autoload -U colors
colors
setopt prompt_subst

# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# Show the relative path on one line, then the smiley.
PROMPT='
%m:%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/.dotfiles/bin/git-cwd-info.rb)%{$reset_color%}'

