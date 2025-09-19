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
  # SSH into a host and immediately attach to or create a tmux session.
  # The first argument is the hostname, the second is the session suffix.

  if [ -z "$1" ]; then
    echo "Usage: tssh <hostname> [session_suffix] [ssh_args...]"
    return 1
  fi

  local host="$1"
  local session_suffix="$2"

  # A simple check for a "valid word" is to ensure the argument is not empty.
  local session_name="tssh_session"
  if [ -n "$session_suffix" ]; then
    session_name="${session_name}_${session_suffix}"
  fi

  # Shift the first two arguments out of the way to pass the rest to ssh.
  shift 2

  ssh "$host" -t "tmux -CC new -As \"$session_name\" || tmux -CC attach -t \"$session_name\"" "$@"
}
