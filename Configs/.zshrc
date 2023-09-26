#zsh configuration

#configure the prompt
#https://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text
autoload -U colors && colors
PROMPT="%{$fg[magenta]%}%n:%1/%%%{$reset_color%} "

#run aliases
. ~/.aliases

#use git tab complete
autoload -Uz compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kaplannp/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kaplannp/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kaplannp/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kaplannp/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.Tools/bin:$PATH"
