HOSTNAME="$(hostname)"
DOTFILES_CFG=$HOME/.dotfiles-cfg/

# Determine HOSTTYPE based on hostname lists
if grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/slurm_hosts"; then
    source "$DOTFILES_CFG/env/slurm.sh"
    HOSTTYPE='cluster'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/server_hosts"; then
    HOSTTYPE='server'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/sge_hosts"; then
    source "$DOTFILES_CFG/env/sge.sh"
    HOSTTYPE='cluster'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/gpu_hosts"; then
    source "$DOTFILES_CFG/env/gpu.sh"
    HOSTTYPE='server'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/laptop_hosts"; then
    if which java > /dev/null; then
        export JAVA_HOME=$(/usr/libexec/java_home)
    fi
    source "$DOTFILES_CFG/env/laptop.sh"
    HOSTTYPE='laptop'
else
    HOSTTYPE='unknown'
fi
export HOSTTYPE

# Determine HOSTLOC based on hostname lists
if grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/mines_hosts"; then
    source "$DOTFILES_CFG/env/mines.sh"
    HOSTLOC='mines'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/kyodai_hosts"; then
    source "$DOTFILES_CFG/env/kyodai.sh"
    HOSTLOC='kyodai'
elif [[ "$HOSTNAME" == "master01" ]]; then
    source "$DOTFILES_CFG/env/bio3.sh"
    HOSTLOC='bio3'
else
    HOSTLOC='unknown'
fi
export HOSTLOC