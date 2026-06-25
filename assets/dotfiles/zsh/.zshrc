
# ============================================================================
# Zinit Plugin Manager Setup
# ============================================================================

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ============================================================================
# ZSH Plugins
# ============================================================================

# Add in ZSH Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets (Oh My ZSH plugins)
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZP::extract
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# Load ZSH completions plugin
autoload -U compinit && compinit

# Replay any deferred completions (ensures all completions load correctly in turbo mode)
zinit cdreplay -q

# ============================================================================
# Oh My Posh Prompt
# ============================================================================

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# ============================================================================
# ZSH History
# ============================================================================

export HISTSIZE=5000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt appendhistory # Append commands to history file, not overwrite
setopt sharehistory # Share zsh history across all zsh sessions at the same time
setopt hist_ignore_space # Ignore saving commands starting with a space to history by adding space before it
setopt hist_ignore_all_dups # Remove all duplicates in history
setopt hist_save_no_dups # Avoid saving duplicate entries
setopt hist_ignore_dups # Ignore duplicates in the current session
setopt hist_find_no_dups # Prevent any duplicates to be shown in history search

# ============================================================================
# Completion Styling
# ============================================================================

# Case-insensitive + partial/substring matching for completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Color completion menu items using same colors as 'ls'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Disable interactive selection menu (cycle completions inline instead)
zstyle ':completion:*' menu no
# When completing 'cd', preview directory contents with eza
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --group-directories-first --no-quotes $realpath'
# When completing 'z' (zoxide), preview directory contents with eza
zstyle ':fzf-tab:complete:\_\_zoxide_z:\*' fzf-preview 'eza --color=always --group-directories-first --no-quotes $realpath'

# ============================================================================
# Default Editors
# ============================================================================

export EDITOR=nvim
export VISUAL=nvim


# ============================================================================
# Enable ZSH AUTO_CD
# ============================================================================

setopt autocd

# ============================================================================
# Aliases
# ============================================================================

alias ls='eza --icons --group-directories-first -G --no-quotes'
alias ll='eza --icons --group-directories-first -lG --no-quotes'
alias lt='eza --icons --group-directories-first --no-quotes -RTL'
alias cat='bat'
alias df='duf'
alias vim='nvim'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear'
alias mkdir='mkdir -p'

# ============================================================================
# Run fastfetch on terminal startup
# ============================================================================

if [ -f /usr/bin/fastfetch ]; then fastfetch; fi

# ============================================================================
# Setup Jetbrains products runtime
# ============================================================================

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# ============================================================================
# Setup Shell Integration for Kiro-CLI
# ============================================================================

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# ============================================================================
# Setup Shell Integration for NVM
# ============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ============================================================================
# Shell Integrations (fzf & zoxide)
# ============================================================================

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
