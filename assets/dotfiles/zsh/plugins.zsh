# ============================================================================
# ZSH Plugins
# ============================================================================
#
# NOTE: Zinit must already be bootstrapped before this file is sourced.
#       compinit must also have run before these declarations so that
#       zsh-completions are captured correctly and cdreplay can replay them.

# Load all plugins asynchronously for faster shell startup
zinit ice wait lucid

# Additional completion definitions
zinit light zsh-users/zsh-completions

# Fish-style autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Better completion menu (fzf-powered)
zinit light Aloxaf/fzf-tab

# Syntax highlighting
#
# NOTE:
# This should always be the last plugin loaded.
zinit light zsh-users/zsh-syntax-highlighting

# Replay any completions that zsh-completions registered during async loading
zinit cdreplay -q
