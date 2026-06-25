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
	- [Oh My Posh Prompt Configuration](#oh-my-posh-prompt-configuration)
		- [Installing Oh My Posh](#installing-oh-my-posh)
		- [Creating a Custom Theme](#creating-a-custom-theme)
	- [Zinit Plugin Manager](#zinit-plugin-manager)
		- [Installing Zinit](#installing-zinit)
		- [Verifying Zinit Installation](#verifying-zinit-installation)
	- [Zsh Plugins Configuration](#zsh-plugins-configuration)
		- [Plugin Descriptions \& Keybindings](#plugin-descriptions--keybindings)
	- [Activate the Oh My Posh Prompt](#activate-the-oh-my-posh-prompt)
	- [Zsh History Configuration](#zsh-history-configuration)
		- [History Settings Explained](#history-settings-explained)
	- [Completion Styling \& fzf-tab Preview](#completion-styling--fzf-tab-preview)
	- [Setting Default Editors](#setting-default-editors)
	- [Enable Auto CD](#enable-auto-cd)
	- [Optional Aliases](#optional-aliases)
		- [Alias Descriptions](#alias-descriptions)
	- [Optional: Run fastfetch on Terminal Startup](#optional-run-fastfetch-on-terminal-startup)
	- [Shell Integrations (fzf \& zoxide)](#shell-integrations-fzf--zoxide)
	- [NVM Compatibility Warning](#nvm-compatibility-warning)
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

Add the following lines to your `~/.zshrc` file:

```bash
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
```

Save the file. To verify everything is working, open a new terminal and run:

```bash
zinit zstatus
```

### Verifying Zinit Installation

Successful output will show Zinit version and status information, confirming the plugin manager is properly initialized.

---

## Zsh Plugins Configuration

After setting up Zinit, add the following plugins to your `~/.zshrc`. These plugins enhance Zsh with syntax highlighting, completions, autosuggestions, and more.

```bash
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
```

### Plugin Descriptions & Keybindings

| Plugin                       | Description                                                                                                | Keybindings / Activation                                                                                                   |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **zsh-syntax-highlighting**  | Real-time syntax highlighting for commands as you type. Valid commands appear green, invalid ones red.     | Activates automatically when you type; no keybinding required.                                                             |
| **zsh-completions**          | Enhanced tab-completion for various commands (Docker, kubectl, git-flow, etc.).                            | Press `Tab` while typing a command to see completions.                                                                     |
| **zsh-autosuggestions**      | Suggests commands based on your history and completions, displayed in muted gray.                          | Type any command – suggestions appear automatically. Press `→` (right arrow) to accept, or `End` to accept to end-of-line. |
| **fzf-tab**                  | Replaces default tab completion with fzf's fuzzy-finder interface.                                         | Press `Tab` to trigger fuzzy completion. Use arrow keys or `Ctrl+N`/`Ctrl+P` to navigate, `Enter` to select.               |
| **fzf integration**          | Provides shell-wide fuzzy finder capabilities.                                                             | `Ctrl+T` – fuzzy find files; `Ctrl+R` – fuzzy search command history; `Alt+C` – cd into selected directory.                |
| **functions.zsh**            | General‑purpose Zsh utility functions (e.g., `take` to create a directory and `cd` into it, `mkcd`, `md`). | No keybinding – use functions like `take myfolder`, `mkcd myfolder`, etc.                                                  |
| **clipboard.zsh**            | Platform-agnostic clipboard helpers.                                                                       | `clipcopy` – copy stdin/argument to clipboard; `clippaste` – paste from clipboard to stdout.                               |
| **termsupport.zsh**          | Sets terminal window/tab titles and provides helper functions.                                             | Automatically updates title with current command or directory. Also provides `title` function for manual setting.          |
| **git snippets (OMZL)**      | Git library with aliases and convenience functions (e.g., `gst` for `git status`).                         | `gst`, `gaa`, `gcmsg`, etc. Type `alias \| grep git` to see all.                                                           |
| **git plugin (OMZP)**        | Adds many more Git aliases and completions (complements OMZL::git.zsh).                                    | Same as above – combined with the library, you get a full set of Git shortcuts.                                            |
| **sudo plugin**              | Press `Esc` twice to add `sudo` before the current command.                                                | `Esc` `Esc` (double press) prefixes current command with `sudo`.                                                           |
| **command-not-found**        | Suggests packages to install when a command isn't found.                                                   | Type any non-existent command – suggestions appear automatically.                                                          |
| **extract plugin**           | Extract various archive types with a single `extract` command.                                             | `extract <filename>` – automatically detects and extracts zip, tar, gz, bz2, rar, 7z, etc.                                 |
| **key-bindings.zsh**         | Oh My Zsh's default key bindings (history search, line editing fixes).                                     | Up/down arrows – search history based on current prefix; `Ctrl+R` – reverse history search; Home/End/Delete work properly. |
| **spectrum.zsh**             | Color functions and arrays for easy ANSI color usage in prompts or scripts.                                | Defines `$fg[color]`, `$bg[color]`, `$reset_color`. Use like `echo "${fg[red]}Error${reset_color}"`.                       |
| **theme-and-appearance.zsh** | Sets `LS_COLORS`, enables terminal title (via termsupport), and other appearance defaults.                 | No keybinding – automatically applies settings. Only relevant if you occasionally use plain `ls` instead of `eza`.         |

---

## Activate the Oh My Posh Prompt

Add the following line to your `~/.zshrc` to load the theme:

```bash
# Initialize Oh My Posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
```

Place this line **after** the Zinit plugin manager setup but **before** the aliases or shell integrations (the exact order can be seen in the complete `.zshrc` reference file).

---

## Zsh History Configuration

Add these lines to your `~/.zshrc` to configure command history behavior:

```bash
# History
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
```

### History Settings Explained

| Setting                       | What it does                                                       |
| ----------------------------- | ------------------------------------------------------------------ |
| `HISTSIZE=5000`               | Maximum number of commands stored in memory                        |
| `HISTFILE`                    | File where history is persisted                                    |
| `setopt appendhistory`        | Commands are appended to the history file (not overwritten)        |
| `setopt sharehistory`         | All open Zsh sessions share the same history                       |
| `setopt hist_ignore_space`    | Commands starting with a space won't be saved (useful for secrets) |
| `setopt hist_ignore_all_dups` | Removes duplicate commands from history                            |

---

## Completion Styling & fzf-tab Preview

Add these lines to your `~/.zshrc` to customize completion styling and enable live previews for `cd` and `zoxide` commands:

```bash
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
```

**What each line does:**

- `matcher-list`: Makes completion case-insensitive and treats hyphens/underscores as word separators.
- `list-colors`: Applies `LS_COLORS` colors to completion listings.
- `fzf-tab preview lines`: When tab-completing a directory or using `z`, shows a live preview using `eza` of the target directory.

---

## Setting Default Editors

Add these lines to your `~/.zprofile` file to set your default command-line editors. This example uses `nvim` (Neovim), but you can replace it with any editor of your choice (`vim`, `nano`, `code`, etc.):

```bash
# Default Editors
export EDITOR=nvim
export VISUAL=nvim
```

> **💡 Tip:** `VISUAL` is used for interactive editors, while `EDITOR` is used for non-interactive commands like `crontab -e`. Both are set here for full compatibility.

---

## Enable Auto CD

Add this line to your `~/.zshrc` to allow changing directories by simply typing the directory name (no `cd` needed):

```bash
# Auto CD - type directory name to enter it
setopt autocd
```

---

## Optional Aliases

Add these aliases before the `# Shell integrations` section in your `~/.zshrc` to create convenient shortcuts:

```bash
# Aliases
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
```

### Alias Descriptions

| Alias   | Command                                                | Description                                               |
| ------- | ------------------------------------------------------ | --------------------------------------------------------- |
| `ls`    | `eza --icons --group-directories-first -G --no-quotes` | Colorful file listing with icons, directories shown first |
| `ll`    | `eza ... -lG`                                          | Long format (detailed) listing with icons                 |
| `lt`    | `eza ... -RTL`                                         | Recursive tree listing sorted by modification time        |
| `cat`   | `bat`                                                  | Replaces `cat` with syntax-highlighting `bat`             |
| `df`    | `duf`                                                  | Replaces `df` with colorful `duf`                         |
| `vim`   | `nvim`                                                 | Uses Neovim when you type `vim`                           |
| `cp`    | `cp -i`                                                | Interactive copy (prompts before overwriting)             |
| `mv`    | `mv -i`                                                | Interactive move (prompts before overwriting)             |
| `cls`   | `clear`                                                | Simple screen clearing                                    |
| `mkdir` | `mkdir -p`                                             | Creates parent directories automatically (`-p` flag)      |

---

## Optional: Run fastfetch on Terminal Startup

Add this line **before** the `# Shell integrations` section (but after aliases) to display system information every time you open a terminal:

```bash
# Run fastfetch on terminal startup
if [ -f /usr/bin/fastfetch ]; then fastfetch; fi
```

---

## Shell Integrations (fzf & zoxide)

Add these lines to your `~/.zshrc` **after** the Oh My Posh activation but **before** aliases:

```bash
# fzf shell integration
eval "$(fzf --zsh)"

# zoxide - smarter cd with 'z' command
eval "$(zoxide init --cmd cd zsh)"
```

---

## NVM Compatibility Warning

> **⚠️ Warning for Node Version Manager (NVM) Users**

If you have `nvm` (Node Version Manager) installed, you must add the following **before** the Oh My Posh initialization and shell integrations in your `~/.zshrc`:

```bash
# NVM configuration (if installed)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

**Why this matters:** NVM modifies your `PATH` and sets up shell functions. If initialized after Oh My Posh or fzf integrations, it may cause conflicts where Node commands are not found or prompt segments fail to display correctly. Place it **before** the "Shell integrations" section.

---

## Complete `.zshrc` Reference

You can find a complete `.zshrc` file content for reference in [.zshrc](../assets/dotfiles/zsh/.zshrc)

---

## Final Steps

After completing all configuration steps:

1. **Close and reopen your terminal** (or run `source ~/.zshrc`) for all changes to take effect.

2. **Verify the prompt appears correctly** with the Oh My Posh theme.

3. **Test plugins:**
   - Type `pacman` and press `Up` arrow to search history
   - Type a partial command and press `Tab` to see fuzzy completions
   - Type `cd Docu` and press `Tab` – fzf-tab should show file previews

4. **Test aliases:**

   ```bash
   ll          # Should show detailed file listing with icons
   bat ~/.zshrc   # Should show syntax-highlighted file
   duf         # Should show colorful disk usage
   ```

5. **If something isn't working:**
   - Ensure fonts are properly installed and set in your terminal emulator
   - Check that all packages were installed successfully
   - Verify the Oh My Posh config file exists at `~/.config/ohmyposh/zen.toml`

Your terminal is now fully configured with a powerful, modern setup!
