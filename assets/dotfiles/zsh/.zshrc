# ============================================================================
# ~/.zshrc
#
# Modular Zsh configuration. Each concern lives in its own file under
# ~/.config/zsh/. This file bootstraps Zinit, then sources the modules in
# the order that satisfies all inter-module dependencies.
#
# Load order and rationale:
#
#   1. Zinit bootstrap   – must be first so `zinit` is available to plugins.zsh
#   2. env.zsh           – exports must be set before anything reads them
#   3. history.zsh       – pure options, no dependencies
#   4. completion.zsh    – runs compinit BEFORE plugins so zsh-completions
#                          can register its definitions in time
#   5. plugins.zsh       – declares plugins; cdreplay -q replays completions
#                          captured during async loading
#   6. zstyles.zsh       – styles the now-fully-initialised completion system
#                          and fzf-tab (must come after cdreplay)
#   7. keybindings.zsh   – key bindings (after completion widgets are ready)
#   8. functions.zsh     – utility functions & command-not-found handler
#   9. Prompt            – oh-my-posh init (inline, between functions & aliases)
#  10. aliases.zsh       – aliases (after prompt so $EDITOR etc. are set)
#  11. integrations.zsh  – fnm, fzf, zoxide, direnv, JetBrains, Kiro
#  12. Startup           – fastfetch (last, only in interactive shells)
#
# File layout (deploy to ~/.config/zsh/ or manage with GNU Stow):
#
#   ~/.config/zsh/
#   ├── env.zsh           – Environment variables & PATH
#   ├── history.zsh       – History settings
#   ├── completion.zsh    – Completion system (compinit)
#   ├── plugins.zsh       – Plugin declarations & cdreplay
#   ├── zstyles.zsh       – Completion styling & fzf-tab config
#   ├── keybindings.zsh   – Key bindings
#   ├── functions.zsh     – Utility functions & command-not-found
#   ├── aliases.zsh       – Aliases
#   └── integrations.zsh  – Shell integrations (fnm, fzf, zoxide, direnv)
# ============================================================================

# ============================================================================
# Zinit Plugin Manager Setup
# ============================================================================

# Directory where Zinit and its plugins are stored
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Install Zinit if it is not already installed
if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "$ZINIT_HOME/zinit.zsh"

# ============================================================================
# Load modules in order
# ============================================================================

# Directory that holds all config modules
ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Helper: source a module, warn if missing
_load() {
    local file="$ZSH_CONFIG_DIR/$1"
    if [[ -r "$file" ]]; then
        source "$file"
    else
        print -u2 "zshrc: module not found: $file"
    fi
}

_load env.zsh           # Environment variables & PATH
_load history.zsh       # History settings
_load completion.zsh    # compinit  (before plugins so completions register)
_load plugins.zsh       # Plugin declarations + cdreplay -q
_load zstyles.zsh       # Completion styling & fzf-tab  (after cdreplay)
_load keybindings.zsh   # Key bindings
_load functions.zsh     # Utility functions & command-not-found

# ============================================================================
# Prompt (oh-my-posh)
# ============================================================================

eval "$(oh-my-posh init zsh --config "$HOME/.config/ohmyposh/zen.toml")"

_load aliases.zsh       # Aliases
_load integrations.zsh  # Shell integrations (fnm, fzf, zoxide, direnv)

# ============================================================================
# Startup Applications
# ============================================================================

# Display system information when opening an interactive shell
if [[ $- == *i* ]] && command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi
