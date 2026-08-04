# ============================================================================
# Key Bindings
# ============================================================================

# Automatically change into directories without typing "cd"
setopt AUTO_CD

# Treat "/" as a word separator so Ctrl+Left / Ctrl+Right
# moves through path components instead of the entire path.
WORDCHARS=${${WORDCHARS//\/}//-}

# Use Emacs-style key bindings (default Zsh behavior)
bindkey -e

# Home
bindkey '^[[H'  beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[OH'  beginning-of-line

# End
bindkey '^[[F'  end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[OF'  end-of-line

# Delete
bindkey '^[[3~' delete-char

# Ctrl + Left
bindkey '^[[1;5D' backward-word
bindkey '^[[5D'   backward-word
bindkey '^[^[[D'  backward-word

# Ctrl + Right
bindkey '^[[1;5C' forward-word
bindkey '^[[5C'   forward-word
bindkey '^[^[[C'  forward-word

# Ctrl + Backspace
bindkey '^H' backward-kill-word
bindkey '^?' backward-delete-char

# Ctrl + Delete
bindkey '^[[3;5~' kill-word

# Ctrl + R (fzf will override this later via shell integration, but this is a fallback)
bindkey '^R' history-incremental-search-backward

# Search history with Up / Down arrows using the current command prefix
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Press Esc twice to prepend "sudo" to the current command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    BUFFER="sudo $BUFFER"
    CURSOR=${#BUFFER}
}

zle -N sudo-command-line
bindkey '\e\e' sudo-command-line
