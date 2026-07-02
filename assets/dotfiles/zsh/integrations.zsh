# ============================================================================
# Shell Integrations
# ============================================================================

# Fast Node Manager (fnm)
eval "$(fnm env --use-on-cd)"

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# direnv
eval "$(direnv hook zsh)"

# ============================================================================
# JetBrains Runtime Options
# ============================================================================

JETBRAINS_VMOPTIONS="$HOME/.jetbrains.vmoptions.sh"

[[ -f "$JETBRAINS_VMOPTIONS" ]] && source "$JETBRAINS_VMOPTIONS"

# ============================================================================
# Kiro CLI Shell Integration
# ============================================================================

if [[ "$TERM_PROGRAM" == "kiro" ]]; then
    source "$(kiro --locate-shell-integration-path zsh)"
fi
