# ============================================================================
# Aliases
# ============================================================================

# ----------------------------------------------------------------------------
# File Management
# ----------------------------------------------------------------------------

alias ls='eza --icons --group-directories-first -G --no-quotes'
alias ll='eza --icons --group-directories-first -lhG --no-quotes'
alias la='eza --icons --group-directories-first -aG --no-quotes'
alias lla='eza --icons --group-directories-first -lahG --no-quotes'
alias lt='eza --icons --group-directories-first --no-quotes -RTL'

alias cat='bat'
alias df='duf'

# Safer file operations
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'

# Misc
alias cls='clear'
alias c='clear'

# ----------------------------------------------------------------------------
# Editors
# ----------------------------------------------------------------------------

alias vim='nvim'

# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------

alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch -a'

alias gc='git commit'
alias gca='git commit --amend'

alias gco='git checkout'
alias gcb='git checkout -b'

alias gs='git status'

alias gd='git diff'
alias gds='git diff --staged'

alias gl='git pull'
alias gp='git push'

alias glog='git log --oneline --graph --decorate --all'

# ----------------------------------------------------------------------------
# Downloads
# ----------------------------------------------------------------------------

alias ytdl='yt-dlp --js node -f "bestvideo+bestaudio/best" --merge-output-format mkv'
alias spdl='spotdl'

# ----------------------------------------------------------------------------
# MechSim
# ----------------------------------------------------------------------------

alias tms="$HOME/.cscripts/toggle_mechsim.sh"
alias tmsstat="$HOME/.cscripts/toggle_mechsim.sh --status"
alias tmsoff='sudo pkill mechsim && echo "🔇 MechSim killed"'

# ----------------------------------------------------------------------------
# VPN
# ----------------------------------------------------------------------------

alias kstart='sudo systemctl start kvpnc.service'
alias kstop='sudo systemctl stop kvpnc.service'

# ----------------------------------------------------------------------------
# Package Management (Arch Linux)
# ----------------------------------------------------------------------------

alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacss='pacman -Ss'
alias pacqi='pacman -Qi'
alias pacfiles='pkgfile'

# ----------------------------------------------------------------------------
# Shell
# ----------------------------------------------------------------------------

alias reload='exec zsh'
alias zshrc='$EDITOR ~/.zshrc'
alias aliases='$EDITOR ~/.aliases'

# ----------------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------------

alias path='printf "%s\n" "${path[@]}"'
alias now='date "+%Y-%m-%d %H:%M:%S"'
