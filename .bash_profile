#export PS1='\e[1;32m\W \t \e[1;31m\u \e[1;32m$ \e[0m'
#export PS1='\e[1;32m\W \t \e[1;31m\u \e[1;32m$ \e[0m'

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
#export PATH="/usr/local/opt/llvm/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

