# ============================================================================
# Completion Styling (zstyles)
# ============================================================================
#
# NOTE: This file must be sourced AFTER plugins.zsh (i.e. after cdreplay -q)
#       so that fzf-tab and the completion system are fully initialised before
#       these styles are applied.

# Case-insensitive completion + partial/substring matching
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'

# Use LS_COLORS for colored completion menus
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable the traditional completion menu
# Pressing Tab repeatedly cycles through matches instead.
zstyle ':completion:*' menu no

# Show descriptions alongside completion candidates
zstyle ':completion:*:descriptions' format '[%d]'

# Group completion results
zstyle ':completion:*' group-name ''

# Sort completion results by name
zstyle ':completion:*' file-sort name

# Enable a cache for expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Preview directories while completing "cd"
zstyle ':fzf-tab:complete:cd:*' fzf-preview \
    'eza --color=always --group-directories-first --icons --no-quotes $realpath'

# Preview directories while completing zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview \
    'eza --color=always --group-directories-first --icons --no-quotes $realpath'
