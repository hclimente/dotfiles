HOSTNAME="$(hostname)"
DOTFILES_CFG=$HOME/.dotfiles-cfg/

# Determine HOSTTYPE based on hostname lists
if grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/slurm_hosts"; then
    source "$DOTFILES_CFG/env/slurm.sh"
    HOSTTYPE='cluster'
elif grep --quiet "$HOSTNAME" "$DOTFILES_CFG/env/server_hosts"; then
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
