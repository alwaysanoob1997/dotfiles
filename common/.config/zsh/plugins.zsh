bindkey -e

# thefuck for corrections
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# zoxide for good cd.
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

# FZF config
eval "$(fzf --zsh)"

# Load Completions
autoload -U compinit && compinit

# Load Plugins if found
[[ -n "$AUTOSUGGEST" && -f "$AUTOSUGGEST" ]] && source "$AUTOSUGGEST"
[[ -n "$HIGHLIGHTING" && -f "$HIGHLIGHTING" ]] && source "$HIGHLIGHTING"
# Search history first; if no match, fall back to tab completions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

