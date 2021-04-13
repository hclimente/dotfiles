zsh_cluster_usage(){
    local myjobs=$(squeue -u $USER | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local jobs=$(squeue | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local color='%F{yellow}'
    [[ $jobs -lt 20 ]] && color='%F{green}'
    [[ $jobs -gt 30 ]] && color='%F{red}'
    echo -n "%{$color%}\uf0e4 $myjobs%{%f%}/$jobs%{%f%}"
}

export NXF_OPTS='-Xms1g -Xmx10g'

if [[ $(hostname -s) == "master01" ]]; then

    SHORT_Q='urtgen_24hrs'
    SHORT_Q_MEM='20GB'
    SHORT_Q_OPTS=''

    LONG_Q='urtgen_5days'
    LONG_Q_MEM='60GB'
    LONG_Q_OPTS=''

elif [[ $(hostname -s) == "thalassa" ]]; then

    SHORT_Q='cpu'
    SHORT_Q_MEM='20GB'
    SHORT_Q_OPTS='--exclude=node[11-13]'

    LONG_Q='cpu'
    LONG_Q_MEM='60GB'
    LONG_Q_OPTS='--exclude=node[11-13]'

    GPU_Q='gpu_cbio'
    GPU_Q_MEM='40GB'
    GPU_Q_OPTS='--gres=gpu:1'

fi

export EXECUTOR='slurm'
export SHORT_Q
export SHORT_Q_MEM
export SHORT_Q_OPTS
export LONG_Q
export LONG_Q_MEM
export LONG_Q_OPTS
export GPU_Q
export GPU_Q_MEM
export GPU_Q_OPTS
