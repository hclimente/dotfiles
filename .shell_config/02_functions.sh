# Create an alias only if the target command exists
alias_if_exists() {
    if command -v $2 >/dev/null; then
        alias $1=$2
    fi
}