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
