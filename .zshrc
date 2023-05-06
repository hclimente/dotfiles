# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM='xterm-256color'
export DOTFILES_CFG=$HOME/.dotfiles-cfg/
alias dit='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# brew
## disable brew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

## disable system curl and git
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1

# set PATH
export PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf-tab git brew common-aliases vi-mode history macos wd F-Sy-H zsh-autosuggestions tmux)

export ZSH_TMUX_ITERM2=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor
export EDITOR='vi'
export VISUAL="$EDITOR"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases
unalias rm

# my scripts
export PYTHONPATH=$HOME/projects/spada:${PYTHONPATH}
export PATH=${HOME}/projects/gwas-tools/bin:${PATH}

# programming languages envs

## perl
export PATH=$HOME/perl5/bin:$PATH
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

## python
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if conda info --envs | grep -q general
then
    conda activate general
fi

## r
alias R='R --no-save'
alias Rscript='Rscript --vanilla'

## faster defaults 
alias_if_exists() {
    if command -v $2 >/dev/null; then
        alias $1=$2
    fi
}

alias_if_exists grep rg
alias_if_exists cat "bat -p"
alias_if_exists less "bat"
alias_if_exists ls "exa -ll"
alias_if_exists vi "nvim"

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ${HOME}/.ignore --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# autocomplete
## make with targets
zstyle ':completion:*:*:make:*' tag-order 'targets'

## dvc
### Case insensitive match
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

### Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

autoload -U compinit && compinit

# host specific functions
HOSTNAME="$(hostname)"  # Conda clobbers HOST, so we save the real hostname into another variable.

precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
}

preexec() {
    HOST="${OLDHOST}"
}

if grep --quiet $HOST $DOTFILES_CFG/env/slurm_hosts; then
    source $DOTFILES_CFG/env/slurm.sh
    HOSTTYPE='cluster'
elif grep --quiet $HOST $DOTFILES_CFG/env/server_hosts; then
    HOSTTYPE='server'
elif grep --quiet $HOST $DOTFILES_CFG/env/sge_hosts; then
    source $DOTFILES_CFG/env/sge.sh
    HOSTTYPE='cluster'
elif grep --quiet $HOST $DOTFILES_CFG/env/gpu_hosts; then
    source $DOTFILES_CFG/env/gpu.sh
    HOSTTYPE='server'
elif grep --quiet $HOST $DOTFILES_CFG/env/laptop_hosts; then
    if which java > /dev/null; then
        export JAVA_HOME=$(/usr/libexec/java_home)
    fi
    
    # iterm integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    source $DOTFILES_CFG/env/laptop.sh
    HOSTTYPE='laptop'
else
    HOSTTYPE='unknown'
fi
export HOSTTYPE

if grep --quiet $HOST $DOTFILES_CFG/env/mines_hosts; then
    source $DOTFILES_CFG/env/mines.sh
    HOSTLOC='mines'
elif grep --quiet $HOST $DOTFILES_CFG/env/kyodai_hosts; then
    source $DOTFILES_CFG/env/kyodai.sh
    HOSTLOC='kyodai'
elif [[ $HOST == "master01" ]]; then
    source $DOTFILES_CFG/env/bio3.sh
    HOSTLOC='bio3'
else
    HOSTLOC='unknown'
fi
export HOSTLOC

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

