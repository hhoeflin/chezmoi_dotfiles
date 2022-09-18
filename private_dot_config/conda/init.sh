# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hhoeflin/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hhoeflin/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/hhoeflin/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/hhoeflin/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/hhoeflin/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/hhoeflin/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
