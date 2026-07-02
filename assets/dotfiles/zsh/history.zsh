# ============================================================================
# ZSH History
# ============================================================================

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE

# Append history instead of overwriting it
setopt APPEND_HISTORY

# Share history across all running shells
setopt SHARE_HISTORY

# Ignore commands beginning with a space
setopt HIST_IGNORE_SPACE

# Remove duplicate history entries
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Save each command immediately
setopt INC_APPEND_HISTORY
