alias_if_exists() {
    # Check if the target command (first part of $2) exists
    # We use awk to extract only the command name before any spaces
    local target_command=$(echo "$2" | awk '{print $1}')
    if command -v "$target_command" >/dev/null; then
        alias "$1=$2" # Quote the entire alias assignment
    fi
}
