HOSTNAME="$(hostname)"
ENVS_PATH=$HOME/.dotfiles-cfg/environments

# Determine HOSTTYPE based on hostname lists
if grep --quiet "$HOSTNAME" "$ENVS_PATH/slurm_hosts"; then
    source "$ENVS_PATH/slurm.sh"
    HOSTTYPE='cluster'
elif grep --quiet "$HOSTNAME" "$ENVS_PATH/server_hosts"; then
    HOSTTYPE='server'
elif grep --quiet "$HOSTNAME" "$ENVS_PATH/laptop_hosts"; then
    source "$ENVS_PATH/laptop.sh"
    HOSTTYPE='laptop'
else
    HOSTTYPE='unknown'
fi
export HOSTTYPE
