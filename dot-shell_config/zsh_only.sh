# --- Oh My Zsh (OMZ) Configuration ---
export ZSH="${HOME}/.oh-my-zsh"

# OMZ Settings
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# OMZ Plugins
plugins=(fzf-tab git brew common-aliases vi-mode history macos wd F-Sy-H zsh-autosuggestions tmux)

# Plugin-specific settings
export ZSH_TMUX_ITERM2=true

# Source OMZ
source "$ZSH/oh-my-zsh.sh"

# --- Fuzzy Search (FZF) ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ${HOME}/.ignore --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# --- Zsh Completion System (compinit) ---
autoload -U compinit && compinit

# Custom completion styles
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# --- iTerm2 Integration ---
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- Prompt ---
eval "$(starship init zsh)"
