# ~/.zshrc

# Source all common configuration files
SHELL_CONFIG_DIR="$HOME/.shell_config"
if [ -d "$SHELL_CONFIG_DIR" ]; then
  for file in "$SHELL_CONFIG_DIR"/[0-9]*.sh; do
    [ -r "$file" ] && . "$file"
  done
fi

# Source Zsh-specific configurations
if [ -r "$SHELL_CONFIG_DIR/zsh_only.sh" ]; then
    . "$SHELL_CONFIG_DIR/zsh_only.sh"
fi

# Clean up
unset file SHELL_CONFIG_DIR

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
