# display cluster usage and number of running jobs
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon host  dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_cluster_usage)
POWERLEVEL9K_CUSTOM_CLUSTER_USAGE="zsh_cluster_usage"

zsh_cluster_usage(){
    local myjobs=$(squeue -u $USER | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local jobs=$(squeue | sed -E 's/ +/\t/g' | cut -f 6 | grep ^R$ | wc -l)
    local color='%F{yellow}'
    [[ $jobs -lt 20 ]] && color='%F{green}'
    [[ $jobs -gt 30 ]] && color='%F{red}'
    echo -n "%{$color%}\uf0e4 $myjobs%{%f%}/$jobs%{%f%}"
}

export NXF_OPTS='-Xms1g -Xmx10g'
