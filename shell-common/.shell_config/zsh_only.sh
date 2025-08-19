# --- FZF Core (BEFORE Oh My Zsh) ---
# Keep this if you want fzf's Ctrl+T or other keybindings, just not fzf-tab
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ${HOME}/.ignore --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# --- Zsh Completion System (compinit) & Custom Completion Styles ---
# Load compinit and set up custom styles BEFORE Oh My Zsh,
# so plugins don't override them.
autoload -U compinit
compinit
_comp_options+=(globdots) # Include dotfiles in globbing patterns by default

# Enable case-insensitive completion globally (often desired)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=** r:|=*' # Added aggressive matching

# Crucial for aggressive path matching:
zstyle ':completion:*' file-completion-style 'globbed'
zstyle ':completion:*' ambiguous 'single-match' # Auto-complete if only one unambiguous match

# Other custom completion styles (your existing ones)
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes


# --- Oh My Zsh (OMZ) Configuration ---
export ZSH="${HOME}/.oh-my-zsh"

# OMZ Settings
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# OMZ Plugins - IMPORTANT: Removed 'fzf-tab' here!
plugins=(git brew common-aliases vi-mode history macos wd F-Sy-H zsh-autosuggestions tmux)

# Plugin-specific settings
export ZSH_TMUX_ITERM2=true

# Source OMZ
source "$ZSH/oh-my-zsh.sh"

# --- iTerm2 Integration ---
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- Prompt ---
eval "$(starship init zsh)"
