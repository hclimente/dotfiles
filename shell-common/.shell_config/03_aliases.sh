# Safety first
unalias rm mv cp >/dev/null 2>/dev/null

# R aliases
alias R='R --no-save'
alias Rscript='Rscript --vanilla'

# Use faster/better alternatives if installed
alias_if_exists grep rg
alias_if_exists cat "bat -p"
alias_if_exists less "bat"
alias_if_exists ls "eza -ll"
alias_if_exists vi "nvim"

# useful aliases
alias gh="history | grep"
alias rs="screen -r"
alias ss="screen -S"

# Tmux aliases
alias tm="tmux"                               # General tmux command
alias tml="tmux list-sessions"                # List sessions
alias tls="tmux list-sessions"                # Another common one for listing
alias ta="tmux attach-session -t"             # Attach to a specific session
alias tn="tmux new -s"                        # Create a new named session
alias tks="tmux kill-session -t"              # Kill a specific session
alias tksv="tmux kill-server"                 # Kill all tmux sessions/server

# Git aliases
alias gi="gitinit"
alias gc="git commit"
alias gl="git pull"
alias gp="git push"
alias gst='git status'
