# ============================================================================
# Completion System
# ============================================================================
#
# NOTE: This file must be sourced BEFORE plugins.zsh so that compinit runs
#       before zsh-users/zsh-completions is loaded. After plugins.zsh runs
#       cdreplay -q, the zstyles file can then style the completed system.

# Load completion system
autoload -Uz compinit

# Load completion list module (recommended for fzf-tab)
zmodload zsh/complist

# Create cache directory if it doesn't exist
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Initialize completion system using a cached dump file
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
