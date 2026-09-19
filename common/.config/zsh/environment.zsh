
export EDITOR="nvim"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH="$HOME/.local/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type=d --hidden --strip-cwd-prefix --exclude .git'

export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS="--ansi"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"

# Because the current setup is that there is a mac with brew and some installations in these locations, 
# this is being done. However this is fragile.
if [[ "$OSTYPE" == darwin* ]] && command -v brew &>/dev/null; then
  fpath+=($(brew --prefix)/share/zsh/site-functions)
  AUTOSUGGEST="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  HIGHLIGHTING="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# --- Linux Setup (Debian/Ubuntu/Arch default paths) ---
elif [[ "$OSTYPE" == linux* ]]; then

    fpath+=(/usr/share/zsh/vendor-completions /usr/share/zsh/site-functions)

    AUTOSUGGEST="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    HIGHLIGHTING="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    export PATH="/home/kevin/.local/share/pi-node/node-v22.23.2-linux-x64/bin:$PATH"
fi

