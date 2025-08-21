alias_if_exists() {
    # Check if the target command (first part of $2) exists
    # We use awk to extract only the command name before any spaces
    local target_command=$(echo "$2" | awk '{print $1}')
    if command -v "$target_command" >/dev/null; then
        alias "$1=$2" # Quote the entire alias assignment
    fi
}

gitinit() {
    # Initialize a new git repository and set up pre-commit hooks
    git init
    if [ ! -f ./.pre-commit-config.yaml ]; then
        cp ~/.dotfiles/git/pre-commit-template.yaml ./.pre-commit-config.yaml
        pre-commit install
        echo "✅ New git repo created with pre-commit hooks."
    else
        echo "⚠️ Git repo initialized, but .pre-commit-config.yaml already exists. Hooks not installed."
    fi
}

tssh() {
    # SSH into a host and immediately attach to or create a tmux session
    if [ -z "$1" ]; then
        echo "Usage: tssh <hostname>"
        return 1
    fi
    ssh "$1" -t "tmux -CC new -As main || tmux -CC attach -t main"
}
