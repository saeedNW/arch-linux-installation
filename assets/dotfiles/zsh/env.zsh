# ============================================================================
# Environment Variables
# ============================================================================

# Default editors
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"

# Enable truecolor (supported by most modern terminals)
export COLORTERM=truecolor

# ============================================================================
# PATH
# ============================================================================

# Keep PATH entries unique
typeset -U path PATH

# Android SDK
path+=(
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/tools"
    "$ANDROID_HOME/tools/bin"
    "$ANDROID_HOME/platform-tools"
    "$ANDROID_HOME/cmdline-tools/latest/bin"
)

export PATH="${(j/:/)path}"
