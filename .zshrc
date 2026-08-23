
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kevin.chacko/.lmstudio/bin"
# End of LM Studio CLI section

# For Yazi - change directory based on movement in yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
# End Yazi Configuration

# Starship initialization
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"


# FZF config
eval "$(fzf --zsh)"

# Engine Overrides (using ripgrep)
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type=d --hidden --strip-cwd-prefix --exclude .git'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS="--ansi"


# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza -a --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}



# eza for ls.
alias ls='eza -al --color=always --long --no-permissions --no-filesize --no-user --icons=auto --no-time'
alias tree='eza -a --color=always --long --no-permissions --no-filesize --no-user --icons=always --tree --level=2 --no-time'


# thefuck for corrections
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# --- macOS / Homebrew Setup ---
if type brew &>/dev/null; then
  fpath+=($(brew --prefix)/share/zsh/site-functions)
  AUTOSUGGEST="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  HIGHLIGHTING="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# --- Linux Setup (Debian/Ubuntu/Arch default paths) ---
else
    fpath+=(/usr/share/zsh/vendor-completions /usr/share/zsh/site-functions)

    AUTOSUGGEST="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    HIGHLIGHTING="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

fi

# Remove old duplicates so your most frequent recent command stays at the top
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Search history first; if no match, fall back to tab completions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Load Completions
autoload -U compinit && compinit

# Load Plugins if found
[[ -n "$AUTOSUGGEST" && -f "$AUTOSUGGEST" ]] && source "$AUTOSUGGEST"
[[ -n "$HIGHLIGHTING" && -f "$HIGHLIGHTING" ]] && source "$HIGHLIGHTING"

# zoxide for good cd.
eval "$(zoxide init zsh)"
alias cd="z"
alias cdi="zi"

