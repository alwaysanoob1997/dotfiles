
alias vim="nvim"

alias ls='eza -al --color=always --long --no-permissions --no-filesize --no-user --icons=auto --no-time'
alias tree='eza -a --color=always --long --no-permissions --no-filesize --no-user --icons=always --tree --level=2 --no-time'

alias cd="z"
alias cdi="zi"


if [[ "$OSTYPE" == linux* ]]; then
    alias start_sun="systemctl --user start sunshine.service"
    alias stop_sun="systemctl --user stop sunshine.service"
fi


