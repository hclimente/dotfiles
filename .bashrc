# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source all common configuration files
SHELL_CONFIG_DIR="$HOME/.shell_config"
if [ -d "$SHELL_CONFIG_DIR" ]; then
  for file in "$SHELL_CONFIG_DIR"/[0-9]*.sh; do
    [ -r "$file" ] && . "$file"
  done
fi

# Source Bash-specific configurations
if [ -r "$SHELL_CONFIG_DIR/bash_only.sh" ]; then
    . "$SHELL_CONFIG_DIR/bash_only.sh"
fi

# Clean up
unset file SHELL_CONFIG_DIR