# Terminal Setup Guide

A well-configured terminal can dramatically improve your workflow. This guide will walk you through installing essential terminal utilities, setting up Zsh as your default shell, and customizing it for maximum productivity.

> **ℹ️ Note:** This guide assumes you're using **Arch Linux** or an **Arch-based distribution** (like EndeavourOS). Package manager commands (`pacman`, `yay`) are specific to Arch.
>
> **💡 Tip:** This guide is based on the excellent work from two YouTube videos that served as primary references:
>
> - [The Linux Experience: Terminal Setup](https://www.youtube.com/watch?v=ud7YxC33Z3w)
> - [Linux Terminal Setup Guide](https://www.youtube.com/watch?v=9U8LCjuQzdc)

---

## Table of Contents

- [Terminal Setup Guide](#terminal-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites: System Update \& Git](#prerequisites-system-update--git)
  - [Essential Terminal Utilities](#essential-terminal-utilities)
    - [bat – A Better `cat`](#bat--a-better-cat)
    - [eza – A Modern `ls` Replacement](#eza--a-modern-ls-replacement)
    - [bpytop – Resource Monitor](#bpytop--resource-monitor)
    - [fzf – Fuzzy Finder](#fzf--fuzzy-finder)
    - [zoxide – Smarter `cd`](#zoxide--smarter-cd)
    - [duf – Better `df` Alternative](#duf--better-df-alternative)
    - [fastfetch – System Information Tool](#fastfetch--system-information-tool)
    - [pkgfile – Command-Not-Found Handler](#pkgfile--command-not-found-handler)
  - [Fonts Installation](#fonts-installation)
    - [Fira Code – Ligatures for Coding](#fira-code--ligatures-for-coding)
      - [Install via Arch Linux Package Manager (Recommended)](#install-via-arch-linux-package-manager-recommended)
      - [Manual Installation](#manual-installation)
    - [JetBrains Mono Nerd Font – Coding Font with Icons](#jetbrains-mono-nerd-font--coding-font-with-icons)
      - [Install via Arch Linux Package Manager (Recommended)](#install-via-arch-linux-package-manager-recommended-1)
      - [Manual Installation](#manual-installation-1)
    - [Optional: Fira Code Nerd Font](#optional-fira-code-nerd-font)
    - [Refresh Font Cache](#refresh-font-cache)
    - [Verify Installation](#verify-installation)
  - [Zsh Installation \& Setup](#zsh-installation--setup)
    - [Installing Zsh](#installing-zsh)
    - [Making Zsh the Default Shell](#making-zsh-the-default-shell)
      - [Verify Installation](#verify-installation-1)
    - [Backing Up Existing Configurations](#backing-up-existing-configurations)
  - [Modular Configuration Layout](#modular-configuration-layout)
    - [File Structure](#file-structure)
    - [Deploying with GNU Stow](#deploying-with-gnu-stow)
  - [Oh My Posh Prompt Configuration](#oh-my-posh-prompt-configuration)
    - [Installing Oh My Posh](#installing-oh-my-posh)
    - [Creating a Custom Theme](#creating-a-custom-theme)
  - [Zinit Plugin Manager](#zinit-plugin-manager)
    - [Installing Zinit](#installing-zinit)
    - [Verifying Zinit Installation](#verifying-zinit-installation)
  - [Environment Variables \& PATH](#environment-variables--path)
    - [Default Editors](#default-editors)
    - [Android SDK (Optional)](#android-sdk-optional)
    - [Truecolor Support](#truecolor-support)
  - [Zsh History Configuration](#zsh-history-configuration)
  - [Completion System](#completion-system)
    - [Optimized Completion Initialization](#optimized-completion-initialization)
  - [Zsh Plugins Configuration](#zsh-plugins-configuration)
    - [Async Loading with Zinit](#async-loading-with-zinit)
    - [Plugin Descriptions \& Keybindings](#plugin-descriptions--keybindings)
  - [zstyles](#zstyles)
  - [Key Bindings](#key-bindings)
  - [Native Utility Functions](#native-utility-functions)
  - [Arch Linux Command-Not-Found](#arch-linux-command-not-found)
  - [Prompt (oh-my-posh)](#prompt-oh-my-posh)
  - [Aliases](#aliases)
  - [Shell Integrations](#shell-integrations)
    - [Fast Node Manager (fnm)](#fast-node-manager-fnm)
    - [Mise (One tool that manages dev tools)](#mise-one-tool-that-manages-dev-tools)
    - [fzf Integration](#fzf-integration)
    - [zoxide Integration](#zoxide-integration)
    - [direnv](#direnv)
  - [JetBrains Runtime Options (Optional)](#jetbrains-runtime-options-optional)
  - [Kiro CLI Integration (Optional)](#kiro-cli-integration-optional)
  - [Startup Application: fastfetch](#startup-application-fastfetch)
  - [Complete `.zshrc` Reference](#complete-zshrc-reference)
  - [Final Steps](#final-steps)

---

## Prerequisites: System Update & Git

Before starting, ensure your system is up to date and Git is installed (required for cloning plugin repositories).

```bash
# Update system packages
sudo pacman -Syu

# Install Git if not already installed
sudo pacman -S --needed git
```

---

## Essential Terminal Utilities

### bat – A Better `cat`

`bat` is a modern alternative to the classic `cat` command, providing syntax highlighting and Git integration. It supports a large number of programming and markup languages, making it ideal for developers.

```bash
sudo pacman -S bat
```

**Key Features:**

- Syntax highlighting for hundreds of languages
- Git integration showing file modifications
- Automatic paging for large files
- Line numbers and grid support

**Usage Example:**

```bash
# Display file with syntax highlighting
bat ~/.zshrc

# Show hidden files and git status
bat -A --git ~/myproject/
```

**Customization – Set a Permanent Theme (Nordic‑style):**

`bat` can be configured to use a specific syntax highlighting theme permanently, independent of your shell. We'll set the `base16-256` theme, which matches the Nordic palette used elsewhere in this guide.

```bash
# Create the bat config directory
mkdir -p ~/.config/bat

# Write the theme setting to the config file
echo '--theme="base16-256"' > ~/.config/bat/config
```

> **💡 Tip:** If you already have an existing `bat` config file, the command above will overwrite it. To keep existing settings, you can manually add the line `--theme="base16-256"` to the file using an editor.

**Verify the Theme:**

```bash
bat --list-themes | grep base16-256    # Should show the theme name
bat ~/.zshrc                            # See the syntax colors change
```

You can list all available themes with `bat --list-themes` and choose a different one if desired.

---

### eza – A Modern `ls` Replacement

`eza` is a modern, maintained replacement for the traditional `ls` command. It uses colors by default to distinguish file types and includes Git status information for directories.

```bash
sudo pacman -S eza
```

**Key Features:**

- Color-coded file listings
- Git repository status display
- Tree view, extended attributes, and icons support
- Filesystem information (inodes, blocks, mount points)

**Usage Examples:**

```bash
# Standard listing with icons
eza --icons --group-directories-first

# Detailed long format with Git status
eza -l --git

# Recursive tree listing
eza -T
```

---

### bpytop – Resource Monitor

`bpytop` is a beautiful and resourceful terminal-based system monitor.

```bash
sudo pacman -S bpytop
```

**Usage:** Simply run `bpytop` to launch the interactive system monitor. Use `?` for help, arrows to navigate, and `q` to quit.

---

### fzf – Fuzzy Finder

`fzf` is a general-purpose command-line fuzzy finder that can be integrated with various tools.

```bash
sudo pacman -S fzf
```

**Key Features:**

- Fuzzy file and command searching
- Keyboard shortcuts (Ctrl+T for files, Ctrl+R for history)
- Integration with vim/neovim

**Usage:** After installation, we'll integrate it with Zsh using the shell integration command shown later in this guide.

---

### zoxide – Smarter `cd`

`zoxide` is a blazing fast replacement for the `cd` command. It tracks the directories you visit most frequently and uses a ranking algorithm to navigate to the best match with just a few keystrokes.

```bash
sudo pacman -S zoxide
```

**Key Features:**

- Jump to frequently used directories with `z <partial-name>`
- Automatic learning of your directory usage patterns
- Integration with all major shells

**Usage:** After installation and shell integration, you can use `z` instead of `cd`. For example, typing `z down` will take you to `/home/user/Downloads` if that's your most frequently accessed matching directory.

---

### duf – Better `df` Alternative

`duf` is a user-friendly, colorful disk usage utility that provides a clear overview of disk space.

```bash
sudo pacman -S duf
```

**Key Features:**

- Colorful, easy-to-read output
- Adjusts to your terminal's theme and width
- Sortable results
- Support for filtering specific devices

**Usage Examples:**

```bash
# Show all mounted filesystems
duf

# Show disk usage for a specific directory
duf /home

# View help for more options
duf --help
```

---

### fastfetch – System Information Tool

`fastfetch` is a feature-rich, performance-oriented system information tool, written in C for speed. It's a modern replacement for the now-unmaintained `neofetch`.

```bash
sudo pacman -S fastfetch
```

**Key Features:**

- Fast system information display
- Highly customizable appearance
- Supports logos and various output styles

**Initial Configuration:**

```bash
# Generate default configuration
fastfetch --gen-config

# Backup the default config
cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc-backup

# Edit the file and make it your own
nvim ~/.config/fastfetch/config.jsonc
```

> **💡 Tip:** You can download a [custom configuration file](../assets/dotfiles/fastfetch/fastfetch-config.jsonc) to get a pre-configured, Nordic-themed layout.

---

### pkgfile – Command-Not-Found Handler

`pkgfile` is a tool that searches the Arch Linux package file database. When combined with its Zsh hook, it suggests the package to install whenever you run a command that isn't found on your system.

```bash
sudo pacman -S pkgfile
sudo pkgfile --update
```

The `--update` step downloads the file database and is required before first use. You should re-run it periodically to keep the database current.

**Key Features:**

- Tells you which package provides a missing command
- Hooks into Zsh's `command_not_found_handler` automatically
- Covers all packages in the official Arch repositories

**Usage Examples:**

```bash
# Find which package provides a specific file or command
pkgfile convert      # → imagemagick

# Update the package file database
sudo pkgfile --update
```

The shell hook is activated in `~/.config/zsh/functions.zsh` and runs automatically — no manual invocation needed. See the [Arch Linux Command-Not-Found](#arch-linux-command-not-found) section for the activation snippet.

---

## Fonts Installation

Custom fonts greatly improve your terminal and coding experience.

### Fira Code – Ligatures for Coding

Fira Code is a free monospaced font containing ligatures for common programming multi-character combinations (e.g., `->`, `=>`, `!=` are displayed as single glyphs).

#### Install via Arch Linux Package Manager (Recommended)

```bash
sudo pacman -S ttf-fira-code
```

#### Manual Installation

Download Fira Code from GitHub and install the font files manually:

[https://github.com/tonsky/FiraCode](https://github.com/tonsky/FiraCode)

---

### JetBrains Mono Nerd Font – Coding Font with Icons

JetBrains Mono Nerd Font combines the popular JetBrains Mono typeface with Nerd Font patches, providing thousands of additional icons and glyphs used by modern terminal tools such as Neovim, Starship, LazyVim, Oh My Posh, and many others.

#### Install via Arch Linux Package Manager (Recommended)

```bash
sudo pacman -S ttf-jetbrains-mono-nerd
```

#### Manual Installation

Download a Nerd Font (such as JetBrainsMono Nerd Font) from:

[https://www.nerdfonts.com/](https://www.nerdfonts.com/)

and install the font files manually.

---

### Optional: Fira Code Nerd Font

If you prefer Fira Code and also want Nerd Font icons included, install the Nerd Font patched version:

```bash
sudo pacman -S ttf-firacode-nerd
```

---

### Refresh Font Cache

Normally Arch updates the cache automatically, but you can force a refresh:

```bash
fc-cache -fv
```

---

### Verify Installation

Check that the fonts are installed correctly:

```bash
fc-list | grep -i "Fira"
fc-list | grep -i "JetBrains"
```

To see all available Nerd Fonts:

```bash
fc-list | grep -i nerd
```

---

> **⚠️ Note:** After installing fonts, you need to set them as your terminal's font. This is done within your terminal emulator's settings (Konsole, GNOME Terminal, Kitty, WezTerm, Ghostty, etc.), not via command line.
>
> For most modern developer setups on Arch Linux, **JetBrains Mono Nerd Font** is recommended because it provides both an excellent programming font and all required Nerd Font icons in a single package.

---

## Zsh Installation & Setup

Zsh (Z Shell) is a powerful and highly customizable shell with advanced features like spell correction, theme support, and plugin ecosystems.

### Installing Zsh

```bash
sudo pacman -S zsh
```

### Making Zsh the Default Shell

```bash
chsh -s $(which zsh)
```

The system will ask for your password. **Important:** Log out and log back in for this change to take effect.

#### Verify Installation

```bash
echo $SHELL          # Should show /usr/bin/zsh or similar
zsh --version        # Should show version number
```

### Backing Up Existing Configurations

If you have existing Zsh configurations, back them up before proceeding:

```bash
mv ~/.zshrc ~/.zshrc.bak
```

Create a new configuration file:

```bash
touch ~/.zshrc
```

---

## Modular Configuration Layout

Instead of one large `~/.zshrc`, the configuration is split into focused modules stored under `~/.config/zsh/`. The main `~/.zshrc` simply sources them in the correct order via a small `_load` helper.

### File Structure

```plaintext
~/.config/zsh/
├── env.zsh           – Environment variables & PATH
├── history.zsh       – History settings
├── completion.zsh    – Completion system (compinit only)
├── plugins.zsh       – Plugin declarations & cdreplay
├── zstyles.zsh       – Completion styling & fzf-tab config
├── keybindings.zsh   – Key bindings
├── functions.zsh     – Utility functions & command-not-found
├── aliases.zsh       – Aliases
└── integrations.zsh  – Shell integrations (fnm, mise, fzf, zoxide, direnv)
```

The `~/.zshrc` itself handles the Zinit bootstrap (which must run before any module), then sources the modules in the exact order that satisfies all inter-module dependencies. The Oh My Posh prompt init and the fastfetch startup block remain inline in `.zshrc` since they sit between modules and don't belong to any single file.

> **⚠️ Load order matters:** `completion.zsh` must run before `plugins.zsh` so that `compinit` initialises the completion system before `zsh-completions` registers its definitions. `zstyles.zsh` must run after `plugins.zsh` so that `cdreplay -q` has already replayed any asynchronously captured completions before the styles are applied.

### Deploying with GNU Stow

[GNU Stow](https://www.gnu.org/software/stow/) manages dotfile symlinks by mirroring a source tree into a target directory. With the layout used in this repo, deployment is a single command.

**Install Stow:**

```bash
sudo pacman -S stow
```

**Recommended source layout** (mirrors the home directory structure):

```plaintext
dotfiles/
└── zsh/
    ├── .zshrc
    └── .config/
        └── zsh/
            ├── env.zsh
            ├── history.zsh
            ├── completion.zsh
            ├── plugins.zsh
            ├── zstyles.zsh
            ├── keybindings.zsh
            ├── functions.zsh
            ├── aliases.zsh
            └── integrations.zsh
```

**Stow the package:**

```bash
# Run from the dotfiles directory – stow symlinks everything into $HOME
cd ~/dotfiles
stow zsh
```

Stow creates `~/.zshrc → ~/dotfiles/zsh/.zshrc` and `~/.config/zsh/ → ~/dotfiles/zsh/.config/zsh/`. To remove the symlinks, run `stow -D zsh`.

> **💡 Tip:** The dotfiles in this repo live under `assets/dotfiles/zsh/`. You can copy or reorganise them into any `dotfiles/` directory that suits your workflow before running Stow.

---

## Oh My Posh Prompt Configuration

[Oh My Posh](https://ohmyposh.dev/) is a cross-platform prompt theme engine that renders customizable shell prompts using configurable segments for Git status, language versions, execution time, and more.

### Installing Oh My Posh

```bash
yay -S oh-my-posh-bin
```

### Creating a Custom Theme

```bash
mkdir -p ~/.config/ohmyposh
touch ~/.config/ohmyposh/zen.toml
```

> **💡 Tip:** You can refer to the [Oh My Posh documentation](https://ohmyposh.dev/docs) to create a fully personalized prompt. Alternatively, use [this configuration file](../assets/dotfiles/ohmyposh/zen.toml) to implement a prompt that maintains consistency with the Nordic theme.

---

## Zinit Plugin Manager

[Zinit](https://github.com/zdharma-continuum/zinit) is a flexible and fast Zsh plugin manager that supports Turbo mode for deferred loading, dramatically reducing shell initialization time – up to 5 times faster than traditional plugin managers.

### Installing Zinit

In the modular layout the bootstrap lives at the top of `~/.zshrc`, before any module is sourced. If you are not using the modular layout, place it at the very top of `~/.zshrc` instead:

```bash
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
```

### Verifying Zinit Installation

Open a new terminal and run:

```bash
zinit zstatus
```

Successful output will show Zinit version and status information, confirming the plugin manager is properly initialized.

---

## Environment Variables & PATH

Set up your default editors and any development SDK paths. In the modular layout these go in `~/.config/zsh/env.zsh`.

### Default Editors

```bash
# ============================================================================
# Environment Variables
# ============================================================================

# Default editors
export EDITOR="nvim"
export VISUAL="$EDITOR"
```

### Android SDK (Optional)

If you do Android development, add the SDK path:

```bash
# Android SDK (optional)
export ANDROID_HOME="$HOME/Android/Sdk"
```

### Truecolor Support

Ensure your terminal displays 24‑bit colors correctly:

```bash
# Enable truecolor (supported by most modern terminals)
export COLORTERM=truecolor
```

Now, set up the `PATH` so that it stays clean and duplicate‑free:

```bash
# ============================================================================
# PATH
# ============================================================================

# Keep PATH entries unique
typeset -U path PATH

# Android SDK (optional) – add the relevant sub‑directories
path+=(
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/tools"
    "$ANDROID_HOME/tools/bin"
    "$ANDROID_HOME/platform-tools"
    "$ANDROID_HOME/cmdline-tools/latest/bin"
)

export PATH="${(j/:/)path}"
```

> **💡 Tip:** If you don't use Android development, simply omit the `ANDROID_HOME` and `path+=` lines.

---

## Zsh History Configuration

Keep a shared, deduplicated history that is saved immediately:

```bash
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
```

---

## Completion System

A fast completion system with a cached dump file is essential for snappy tab‑completion.

### Optimized Completion Initialization

Add this block **after** the `History` section:

```bash
# ============================================================================
# Completion System
# ============================================================================

# Load completion system
autoload -Uz compinit

# Load completion list module (recommended for fzf-tab)
zmodload zsh/complist

# Create cache directory if it doesn't exist
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Initialize completion system using a cached dump file
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
```

---

## Zsh Plugins Configuration

Now we load the core plugins. All except syntax highlighting are loaded **asynchronously** to keep startup times low.

### Async Loading with Zinit

This block goes in `~/.config/zsh/plugins.zsh`. It must be sourced **after** `completion.zsh` (so `compinit` has already run) and the `cdreplay -q` call at the end must come **before** `zstyles.zsh` loads:

```bash
# ============================================================================
# ZSH Plugins
# ============================================================================

# Load most plugins asynchronously for faster shell startup
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

# Replay any deferred completions loaded by Zinit
zinit cdreplay -q
```

### Plugin Descriptions & Keybindings

| Plugin                      | Description                                                                                            | Keybindings / Activation                                                                                                   |
| --------------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| **zsh-syntax-highlighting** | Real-time syntax highlighting for commands as you type. Valid commands appear green, invalid ones red. | Activates automatically when you type; no keybinding required.                                                             |
| **zsh-completions**         | Enhanced tab-completion for various commands (Docker, kubectl, git-flow, etc.).                        | Press `Tab` while typing a command to see completions.                                                                     |
| **zsh-autosuggestions**     | Suggests commands based on your history and completions, displayed in muted gray.                      | Type any command – suggestions appear automatically. Press `→` (right arrow) to accept, or `End` to accept to end-of-line. |
| **fzf-tab**                 | Replaces default tab completion with fzf's fuzzy-finder interface.                                     | Press `Tab` to trigger fuzzy completion. Use arrow keys or `Ctrl+N`/`Ctrl+P` to navigate, `Enter` to select.               |

The fzf shell integration (providing `Ctrl+T`, `Ctrl+R`, `Alt+C`) is set up later in the Shell Integrations section.

---

## zstyles

Fine‑tune the look and behaviour of completions, and configure fzf-tab directory previews. In the modular layout this goes in `~/.config/zsh/zstyles.zsh`, sourced after `plugins.zsh` (i.e. after `cdreplay -q`) so that fzf-tab is fully initialised before the styles are applied:

```bash
# ============================================================================
# Completion Styling (zstyles)
# ============================================================================

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
```

---

## Key Bindings

Enable auto-cd, configure word separators, and set up all key bindings in one block:

```bash
# ============================================================================
# Key Bindings
# ============================================================================

# Automatically change into directories without typing "cd"
setopt AUTO_CD

# Treat "/" as a word separator so Ctrl+Left / Ctrl+Right
# moves through path components instead of the entire path.
WORDCHARS=${WORDCHARS//\/}

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
```

---

## Native Utility Functions

The `extract` function replaces external plugins. It detects the archive type and calls the right tool:

```bash
# ============================================================================
# Native Utility Functions
# ============================================================================

# Extract almost any archive using a single command
extract() {
    if [[ ! -f "$1" ]]; then
        echo "extract: '$1' is not a valid file"
        return 1
    fi

    case "$1" in
        *.tar.bz2|*.tbz2) tar xjf "$1" ;;
        *.tar.gz|*.tgz) tar xzf "$1" ;;
        *.tar.xz|*.txz) tar xJf "$1" ;;
        *.tar.zst|*.tzst) tar --zstd -xf "$1" ;;
        *.tar) tar xf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.gz) gunzip "$1" ;;
        *.xz) unxz "$1" ;;
        *.zst) unzstd "$1" ;;
        *.zip) unzip "$1" ;;
        *.rar) unrar x "$1" ;;
        *.7z) 7z x "$1" ;;
        *.Z) uncompress "$1" ;;
        *) echo "extract: unsupported archive type: $1" ;;
    esac
}
```

---

## Arch Linux Command-Not-Found

With `pkgfile` installed and its database updated (see [pkgfile – Command-Not-Found Handler](#pkgfile--command-not-found-handler)), activate the Zsh hook in `~/.config/zsh/functions.zsh`:

```bash
# ============================================================================
# Arch Linux Command-Not-Found
# ============================================================================

if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
```

---

## Prompt (oh-my-posh)

Now that all plugins and settings are loaded, initialise the prompt:

```bash
# ============================================================================
# Oh My Posh Prompt
# ============================================================================

eval "$(oh-my-posh init zsh --config "$HOME/.config/ohmyposh/zen.toml")"
```

Place this line **after** the `pkgfile` block and **before** the aliases.

---

## Aliases

This expanded set of aliases covers file management, git, package management, and more. Add it after the Oh My Posh prompt initialisation:

```bash
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
```

You can safely remove any alias that doesn't apply to your workflow (e.g., `ytdl`, `spdl`, or custom VPN aliases you may have added separately).

---

## Shell Integrations

All shell integrations are grouped here and loaded after the aliases, in the order: fnm → mise → fzf → zoxide → direnv.

### Fast Node Manager (fnm)

`fnm` is a speedy Node.js version manager that auto‑switches based on `.nvmrc` or `.node-version` files. You can find the installation in:

- [fnm (Fast Node Manager)](../applications/development/nodejs/fnm.md)

Add its initialisation at the top of the shell integrations block:

```bash
# Fast Node Manager (fnm)
eval "$(fnm env --use-on-cd)"
```

### Mise (One tool that manages dev tools)

`mise` installs the tools your project needs, loads its env vars, and runs its tasks. You can find the installation in:

- [Mise (Go Version Manager)](../applications/development/golang/mise.md)

Add its initialisation right after fnm in the shell integrations block:

```bash
# Mise
eval "$(mise activate zsh)"
```

### fzf Integration

```bash
# fzf
eval "$(fzf --zsh)"
```

### zoxide Integration

```bash
# zoxide
eval "$(zoxide init --cmd cd zsh)"
```

This lets `cd` benefit from zoxide's directory ranking while keeping the familiar command.

### direnv

`direnv` loads per‑directory environment variables from `.envrc` files.

```bash
sudo pacman -S direnv
```

Add the hook:

```bash
# direnv
eval "$(direnv hook zsh)"
```

---

## JetBrains Runtime Options (Optional)

If you use JetBrains IDEs and have a custom `vmoptions` file, source it here:

```bash
# ============================================================================
# JetBrains Runtime Options
# ============================================================================

JETBRAINS_VMOPTIONS="$HOME/.jetbrains.vmoptions.sh"

[[ -f "$JETBRAINS_VMOPTIONS" ]] && source "$JETBRAINS_VMOPTIONS"
```

---

## Kiro CLI Integration (Optional)

If you're using the Kiro terminal, add its shell integration:

```bash
# ============================================================================
# Kiro CLI Shell Integration
# ============================================================================

if [[ "$TERM_PROGRAM" == "kiro" ]]; then
    source "$(kiro --locate-shell-integration-path zsh)"
fi
```

---

## Startup Application: fastfetch

Display system information each time you open an interactive terminal. Add this at the very end:

```bash
# ============================================================================
# Startup Applications
# ============================================================================

# Display system information when opening an interactive shell
if [[ $- == *i* ]] && command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi
```

---

## Complete `.zshrc` Reference

The full set of ready‑to‑use files that match this guide lives under [`assets/dotfiles/zsh/`](../assets/dotfiles/zsh/):

| File                                                          | Contents                                                          |
| ------------------------------------------------------------- | ----------------------------------------------------------------- |
| [`.zshrc`](../assets/dotfiles/zsh/.zshrc)                     | Main entry point — Zinit bootstrap + sources all modules in order |
| [`env.zsh`](../assets/dotfiles/zsh/env.zsh)                   | Environment variables & PATH                                      |
| [`history.zsh`](../assets/dotfiles/zsh/history.zsh)           | History settings                                                  |
| [`completion.zsh`](../assets/dotfiles/zsh/completion.zsh)     | Completion system (`compinit` only)                               |
| [`plugins.zsh`](../assets/dotfiles/zsh/plugins.zsh)           | Plugin declarations & `cdreplay -q`                               |
| [`zstyles.zsh`](../assets/dotfiles/zsh/zstyles.zsh)           | Completion styling & fzf-tab config                               |
| [`keybindings.zsh`](../assets/dotfiles/zsh/keybindings.zsh)   | Key bindings                                                      |
| [`functions.zsh`](../assets/dotfiles/zsh/functions.zsh)       | Utility functions & command-not-found                             |
| [`aliases.zsh`](../assets/dotfiles/zsh/aliases.zsh)           | Aliases                                                           |
| [`integrations.zsh`](../assets/dotfiles/zsh/integrations.zsh) | Shell integrations (fnm, mise, fzf, zoxide, direnv)               |

---

## Final Steps

After completing all configuration steps:

1. **Close and reopen your terminal** (or run `exec zsh`) for all changes to take effect.

2. **Verify the prompt appears correctly** with the Oh My Posh theme.

3. **Test plugins:**
   - Type `pacman` and press `Up` arrow to search history
   - Type a partial command and press `Tab` to see fuzzy completions
   - Type `cd Docu` and press `Tab` – fzf-tab should show file previews

4. **Test key bindings:**
   - Press `Ctrl+Left`/`Ctrl+Right` to jump between path segments
   - Press `Esc` twice quickly to prepend `sudo` to the current command
   - Use `Ctrl+R` for fzf-powered history search

5. **Test aliases:**

   ```bash
   ll          # Should show detailed file listing with icons
   bat ~/.zshrc   # Should show syntax-highlighted file
   duf         # Should show colorful disk usage
   ```

6. **If something isn't working:**
   - Ensure fonts are properly installed and set in your terminal emulator
   - Check that all packages were installed successfully
   - Verify the Oh My Posh config file exists at `~/.config/ohmyposh/zen.toml`
   - Run `zinit zstatus` to confirm Zinit loaded correctly

Your terminal is now fully configured with a powerful, modern, and lightning-fast setup!
