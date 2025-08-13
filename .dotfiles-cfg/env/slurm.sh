zsh_cluster_usage(){
    local myjobs=$(squeue -u $USER | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local jobs=$(squeue | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local color='%F{yellow}'
    [[ $jobs -lt 20 ]] && color='%F{green}'
    [[ $jobs -gt 30 ]] && color='%F{red}'
    echo -n "%{$color%}\uf0e4 $myjobs%{%f%}/$jobs%{%f%}"
}

export NXF_OPTS='-Xms1g -Xmx10g'
