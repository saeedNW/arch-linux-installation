# Essential Applications Guide

In this guide, I'll walk you through the installation process of essential applications that I personally use and recommend for enhancing your daily workflow. Feel free to review and install the ones that best suit your needs. Let's dive in!

## Table of Contents

- [Essential Applications Guide](#essential-applications-guide)
	- [Table of Contents](#table-of-contents)
	- [Installing bat](#installing-bat)
	- [Installing eza](#installing-eza)
	- [Installing duf](#installing-duf)
	- [Installing gdu](#installing-gdu)
	- [Installing yt-dlp](#installing-yt-dlp)
	- [Installing python-spotdl](#installing-python-spotdl)
	- [Installing Neovim](#installing-neovim)
		- [Setting Up Neovim Configuration](#setting-up-neovim-configuration)
		- [Add Neovim core configs](#add-neovim-core-configs)
		- [Add Neovim Custom keybinding](#add-neovim-custom-keybinding)
		- [Add Neovim Lazy Plugin Manager](#add-neovim-lazy-plugin-manager)
		- [Install Neovim Plugins](#install-neovim-plugins)
			- [nord.nvim Theme](#nordnvim-theme)
			- [Neo-tree](#neo-tree)
			- [bufferline](#bufferline)
			- [lualine](#lualine)
			- [treesitter](#treesitter)
			- [telescope](#telescope)
			- [lsp](#lsp)
			- [autocompletion](#autocompletion)
			- [alpha](#alpha)
			- [indent-blankline](#indent-blankline)
			- [gitsigns](#gitsigns)
			- [misc](#misc)
	- [Installing Zsh](#installing-zsh)
		- [Installing Oh My Zsh](#installing-oh-my-zsh)
			- [Installing Zsh Plugins](#installing-zsh-plugins)
				- [zsh-autosuggestions](#zsh-autosuggestions)
				- [zsh-syntax-highlighting](#zsh-syntax-highlighting)
				- [zsh-completions](#zsh-completions)
				- [Enabling Plugins](#enabling-plugins)
		- [ZSH profile file](#zsh-profile-file)
		- [ZSH History Configuration](#zsh-history-configuration)
		- [Default Editors](#default-editors)
		- [Custom Aliases](#custom-aliases)
			- [Recommended Aliases](#recommended-aliases)
			- [Apply changes](#apply-changes)
	- [Installing direnv](#installing-direnv)
		- [Setup](#setup)
		- [Quick demo](#quick-demo)
		- [Key Notes](#key-notes)
	- [Installing Git](#installing-git)
		- [Create SSH Key and Add it to GitHub](#create-ssh-key-and-add-it-to-github)
	- [sshuttle VPN](#sshuttle-vpn)
	- [Installing Mission Center](#installing-mission-center)
	- [Installing LibreOffice](#installing-libreoffice)
	- [Installing GIMP](#installing-gimp)
		- [Change Gimp's Look](#change-gimps-look)
	- [Installing VLC Media Player](#installing-vlc-media-player)
		- [Change VLC's Look](#change-vlcs-look)
	- [Installing qBittorrent](#installing-qbittorrent)
		- [Change qBittorrent's Look](#change-qbittorrents-look)
	- [Installing OBS Studio](#installing-obs-studio)
	- [Video Editor](#video-editor)
		- [Installing Kdenlive](#installing-kdenlive)
		- [Installing DaVinci Resolve](#installing-davinci-resolve)
	- [Installing Discord](#installing-discord)
	- [Installing Telegram Desktop](#installing-telegram-desktop)
	- [Installing lazygit](#installing-lazygit)
	- [Installing Docker](#installing-docker)
		- [Installing Docker Compose](#installing-docker-compose)
	- [Installing Portainer](#installing-portainer)
	- [Installing RabbitMQ](#installing-rabbitmq)
	- [Installing Zookeeper and Kafka](#installing-zookeeper-and-kafka)
		- [Installing Zookeeper](#installing-zookeeper)
		- [Installing Kafka](#installing-kafka)
	- [Installing Redis](#installing-redis)
		- [Option 1: Install via Pacman](#option-1-install-via-pacman)
		- [Option 2: Run via Docker](#option-2-run-via-docker)
	- [Installing RedisInsight](#installing-redisinsight)
	- [Installing MongoDB](#installing-mongodb)
		- [Option 1: Install via AUR (`mongodb-bin`)](#option-1-install-via-aur-mongodb-bin)
		- [Option 2: Run MongoDB via Docker](#option-2-run-mongodb-via-docker)
	- [Installing MongoDB Compass](#installing-mongodb-compass)
	- [MySQL and phpMyAdmin](#mysql-and-phpmyadmin)
	- [Installing Elasticsearch and Kibana](#installing-elasticsearch-and-kibana)
	- [installing PostgreSQL and pgAdmin](#installing-postgresql-and-pgadmin)
	- [Installing FastFetch](#installing-fastfetch)
		- [Running FastFetch on Terminal Startup](#running-fastfetch-on-terminal-startup)
	- [Installing Google Chrome](#installing-google-chrome)
	- [Installing Visual Studio Code (VS Code)](#installing-visual-studio-code-vs-code)
		- [Recommended Plugins](#recommended-plugins)
		- [Theme](#theme)
		- [Recommended Settings](#recommended-settings)
		- [VSCode Custom CSS \& JS](#vscode-custom-css--js)
			- [Steps to Enable Custom CSS \& JS in VS Code](#steps-to-enable-custom-css--js-in-vs-code)
			- [Example Files](#example-files)
		- [Custom Shortcuts](#custom-shortcuts)
	- [Installing Postman](#installing-postman)
	- [Installing Amberol Music Player](#installing-amberol-music-player)
	- [Image Viewer](#image-viewer)
		- [Installing qview (Recomended)](#installing-qview-recomended)
		- [Installing Loupe](#installing-loupe)
		- [Installing nomacs](#installing-nomacs)
	- [Installing GNOME Boxes](#installing-gnome-boxes)
	- [Installing Blanket](#installing-blanket)
	- [Installing HandBrake](#installing-handbrake)
	- [Installing Albert Application Launcher](#installing-albert-application-launcher)
		- [Albert Recommended Configs](#albert-recommended-configs)
	- [Installing Rclone \& Rclone Browser](#installing-rclone--rclone-browser)
	- [Installing AnyDesk](#installing-anydesk)
	- [Installing Droidcam](#installing-droidcam)
	- [Install Spot Player](#install-spot-player)
	- [Installing Flatpak](#installing-flatpak)
	- [Setting Up Timeshift for System Snapshots](#setting-up-timeshift-for-system-snapshots)

## Installing bat

`bat` is a modern alternative to the classic `cat` command, with syntax highlighting and Git integration. Here's how to install it on your Linux system:

1. **Update System Repositories**:

   Ensure your system's package repositories are up-to-date by running the following command in the terminal:

   ```shell
   sudo pacman -Syu
   ```

2. **Install bat**:

   You can install `bat` directly from the Arch Linux repositories using the following command:

   ```shell
   sudo pacman -S bat
   ```

3. **Verify Installation**:

   Once the installation is complete, you can verify that `bat` is installed correctly by checking its version:

   ```shell
   bat --version
   ```

## Installing eza

`eza` is a modern replacement for the traditional `ls` command, providing more features and a more visually appealing output. Here's how to install it on your system:

```shell
sudo pacman -S eza
```

Once installed, you can use `eza` just like you would use `ls`, but with additional features and options. For example, to list files and directories in the current directory, simply type:

```shell
eza
```

But if you want to improce the visually appealing you can add `--icon` option to it:

```shell
eza --icon
```

You can also make it to show directories first:

```shell
eza --icons --group-directories-first
```

`eza` provides many more options and features. You can explore them further by checking out the official documentation or by running `eza --help` in your terminal.

## Installing duf

`duf` is a modern replacement for the traditional `df` command, offering enhanced features and a more user-friendly interface for disk usage analysis. Here's how to install it on your system:

```shell
sudo pacman -S duf
```

Once installed, you can use `duf` to quickly and easily check disk usage information. For example, to display disk usage for all mounted filesystems, simply type:

```shell
duf
```

You can also specify a specific directory or filesystem to analyze. For instance, to check disk usage for the `/home` directory, use:

```shell
duf /home
```

Additionally, `duf` provides various options and flags for customizing its output. To explore these options, you can run `duf --help` in your terminal.

With `duf`, managing disk space and analyzing storage usage becomes more intuitive and efficient.

## Installing gdu

gdu (Go Disk Usage) is a command-line disk usage analyzer written in Go. It provides a fast and efficient way to visualize disk usage on your system. Here's how to install gdu:

```shell
sudo pacman -S gdu
```

## Installing yt-dlp

`yt-dlp` is a command-line program to download videos from YouTube and other video platforms. It's an enhanced version of `youtube-dl` with additional features and improvements. Here's how to install it on your system:

```shell
sudo pacman -S yt-dlp
```

Once installed, you can use `yt-dlp` to download videos by providing the video URL as an argument. For example:

```shell
yt-dlp https://www.youtube.com/watch?v=your_video_id
```

This command will download the video specified by the URL to your current directory.

`yt-dlp` offers many options and features for customizing your downloads. You can explore these options further by running `yt-dlp --help` in your terminal or by checking out the official documentation.

## Installing python-spotdl

python-spotdl is a command-line tool that allows you to download music from various streaming platforms such as Spotify. Here's how to install python-spotdl:

```shell
paru -S python-spotdl
```

## Installing Neovim

`Neovim` is a modern, extensible, and highly customizable text editor, serving as an enhanced version of Vim. It is perfect for developers and system administrators who seek efficiency and flexibility in text editing. Here's how to install it on your system:

```shell
sudo pacman -S neovim
```

### Setting Up Neovim Configuration

source: [Full Neovim Setup from Scratch in 2025](https://www.youtube.com/watch?v=KYDG3AHgYEs)

After installing Neovim, you'll want to customize it to suit your preferences. The primary configuration file for Neovim is located at `~/.config/nvim`. The configurations we are going to implement are based on the [**kickstart.nvim**](https://github.com/nvim-lua/kickstart.nvim) project.

**Step 1**: Create the `init.lua` File and directory

```shell
mkdir -p ~/.config/nvim
cd ~/.config/nvim
touch init.lua
```

**Step 2**: Clone [**kickstart.nvim**](https://github.com/nvim-lua/kickstart.nvim) project.

```shell
cd ~
git clone https://github.com/nvim-lua/kickstart.nvim
```

open kickstart's `init.lau` and you neovim `init.lau`. (Note: If you know how to use neovim hotkeys you can open the files in neovim otherwise it's better to use an editor that you art familiar with):

```shell
nvim ~/.config/nvim/init.lua
```

```shell
nvim ~/kickstart.nvim/init.lua
```

**Step 3**: Create neovim configurations main directory and files

In Neovim, managing plugin configurations directly in the `init.lua` file can lead to clutter and reduced readability. To keep things organized, create a `lua` directory and place your plugin and core configurations there. Then, import these configurations into the `init.lua` file.

```shell
mkdir -p ~/.config/nvim/lua # Configurations main directory
mkdir -p ~/.config/nvim/lua/core # Core configurations directory
mkdir -p ~/.config/nvim/lua/plugins # Plugins configurations directory
```

In the `core` directory add these two files:

```shell
touch ~/.config/nvim/lua/core/keymaps.lua
touch ~/.config/nvim/lua/core/options.lua
```

Import these files into the `init.lua` file.

```lua
require 'core.options'
require 'core.keymaps'
```

### Add Neovim core configs

Add the following configs to `options.lua` file:

**Note**: It's recommended to read through the configs before adding them to your neovim

[options.lua](./files/nvim/lua/core/options.lua)

### Add Neovim Custom keybinding

Add the following configs to `keymaps.lua` file:

**Note**: It's recommended to read through the configs before adding them to your neovim

[keymaps.lua](./files/nvim/lua/core/keymaps.lua)

### Add Neovim Lazy Plugin Manager

The Neovim Lazy plugin manager is a lightweight and efficient plugin manager for Neovim. It allows you to easily manage and install plugins, ensuring a smooth and optimized workflow. With Lazy, you can quickly add, update, and remove plugins, making it an essential tool for customizing your Neovim setup.

**Note**: To install the plugins added to the `init.lua` file, you need to close and reopen Neovim.

in order to add the plugin manager to your config file you can copy the installer from kickstart config file

```lua
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath}
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

})
```

### Install Neovim Plugins

#### nord.nvim Theme

nord.nvim is a neovim theme based off of the [Nord Color Palette](https://www.nordtheme.com/docs/colors-and-palettes). To install `nord.nvim` follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/colortheme.lua
```

**step 2**: Add the following configs to the plugin configurations file

```lua
return {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nord_contrast = true
        vim.g.nord_borders = false
        vim.g.nord_disable_background = false
        vim.g.nord_italic = false
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_bold = false

        -- Load the colorscheme
        require('nord').set()
    end
}
```

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.colortheme'
})
```

#### Neo-tree

Neo-tree is a Neovim plugin to browse the file system and other tree like structures. To install `Neo-tree` follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/Neotree.lua
```

**step 2**: Add the following configs to the plugin configurations file

[Neotree.lua](./files/nvim/lua/plugins/Neotree.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.Neotree'
})
```

#### bufferline

The Bufferline plugin enhances the default buffer management by providing a more intuitive and visually appealing way to navigate between open buffers. To install `bufferline` follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/bufferline.lua
```

**step 2**: Add the following configs to the plugin configurations file

[bufferline.lua](./files/nvim/lua/plugins/bufferline.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.bufferline'
})
```

#### lualine

The Lualine plugin for Neovim provides a highly customizable and visually appealing status line. To install `lualine`, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/lualine.lua
```

**step 2**: Add the following configs to the plugin configurations file

[lualine.lua](./files/nvim/lua/plugins/lualine.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.lualine'
})
```

#### treesitter

The Treesitter plugin for Neovim provides advanced syntax highlighting and code parsing capabilities. To install `treesitter`, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/treesitter.lua
```

**step 2**: Add the following configs to the plugin configurations file

[treesitter.lua](./files/nvim/lua/plugins/treesitter.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.treesitter'
})
```

#### telescope

The Telescope plugin for Neovim is a highly extendable fuzzy finder that allows users to quickly search and navigate files, buffers, and other resources within Neovim. To install `telescope`, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/telescope.lua
```

**step 2**: Add the following configs to the plugin configurations file

[telescope.lua](./files/nvim/lua/plugins/telescope.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.telescope'
})
```

#### lsp

The LSP (Language Server Protocol) plugin for Neovim provides powerful language-specific features such as code completion, diagnostics, go-to definition, and more. To install and configure the `LSP` plugin, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/lsp.lua
```

**step 2**: Add the following configs to the plugin configurations file

[lsp.lua](./files/nvim/lua/plugins/lsp.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.lsp'
})
```

#### autocompletion

The Autocompletion plugin for Neovim enhances the coding experience by providing intelligent code completion suggestions as you type. To install and configure the `autocompletion` plugin, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/autocompletion.lua
```

**step 2**: Add the following configs to the plugin configurations file

[autocompletion.lua](./files/nvim/lua/plugins/autocompletion.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.autocompletion'
})
```

#### alpha

The Alpha plugin for Neovim provides a customizable start screen for Neovim. To install and configure the `Alpha` plugin, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/alpha.lua
```

**step 2**: Add the following configs to the plugin configurations file

[alpha.lua](./files/nvim/lua/plugins/alpha.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.alpha'
})
```

#### indent-blankline

The Indent-Blankline plugin for Neovim adds indentation guides to all lines. To install and configure the `Indent-Blankline` plugin, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/indent-blankline.lua
```

**step 2**: Add the following configs to the plugin configurations file

[indent-blankline.lua](./files/nvim/lua/plugins/indent-blankline.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.indent-blankline'
})
```

#### gitsigns

The Gitsigns plugin for Neovim integrates Git functionalities directly into the editor. To install and configure the `Gitsigns` plugin, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/gitsigns.lua
```

**step 2**: Add the following configs to the plugin configurations file

[gitsigns.lua](./files/nvim/lua/plugins/gitsigns.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.gitsigns'
})
```

#### misc

In addition to the core plugins, there are several miscellaneous plugins that can enhance your Neovim experience by adding various useful features and functionalities. To install and configure these plugins, follow these steps:

**Step 1**: Create a module file for the plugin configurations to be saved in:

```shell
touch ~/.config/nvim/lua/plugins/misc.lua
```

**step 2**: Add the following configs to the plugin configurations file

[misc.lua](./files/nvim/lua/plugins/misc.lua)

**step 3**: Add the following configs to `init.lua` file

```lua
require('lazy').setup({
    -- Other Plugins

    require 'plugins.misc'
})
```

## Installing Zsh

Zsh, or Z Shell, is a powerful and highly customizable shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Here's how to install Zsh on your system:

```shell
sudo pacman -S zsh
```

### Installing Oh My Zsh

Oh My Zsh is a delightful, open-source, community-driven framework for managing your Zsh configuration. It comes bundled with a vast number of helpful functions, plugins, and themes to enhance your command-line experience. Here's how to install Oh My Zsh on your system:

You can install Oh My Zsh by running the following command in your terminal:

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Alternatively, if you prefer using `wget`:

```shell
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

During Installation process of Oh My Zsh you will be prompted to set `zsh` as your main shell choose yes.

#### Installing Zsh Plugins

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) and [zsh-completions](https://github.com/zsh-users/zsh-completions) are popular plugins for Zsh that enhance your command-line experience by providing autosuggestions as you type, syntax highlighting for commands and extending Zsh's command completion capabilities. Here's how to install them:

##### zsh-autosuggestions

1. Clone the zsh-autosuggestions repository into the Oh My Zsh plugins directory:

   ```shell
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
   ```

2. Activate the plugin by adding it to the list of plugins in your `~/.zshrc` configuration file:

   ```shell
   plugins=(... zsh-autosuggestions)
   ```

##### zsh-syntax-highlighting

1. Clone the zsh-syntax-highlighting repository into the Oh My Zsh plugins directory:

   ```shell
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
   ```

2. Activate the plugin by adding it to the list of plugins in your `~/.zshrc` configuration file:

   ```shell
   plugins=(... zsh-syntax-highlighting)
   ```

##### zsh-completions

1. Clone the zsh-completions repository into the Oh My Zsh custom plugins directory:

   ```shell
     git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
   ```

2. Add it to FPATH in your `.zshrc` by adding the following line before `source $ZSH/oh-my-zsh.sh`:

   ```shell
   fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
   ```

   **Note:** adding it as a regular Oh My ZSH! plugin will not work properly

##### Enabling Plugins

After adding the plugins to your `~/.zshrc` file, reload the Zsh configuration:

```shell
source ~/.zshrc
```

### ZSH profile file

A profile file is a configuration file that is sourced by the shell when it starts. It is used to set environment variables, define aliases, and perform other customizations that are specific to the user's needs.

In order to create a profile file, you can use a text editor such as `vim` or `nano`. Here's an example of how to create a profile file called `.zprofile` in the `Home` directory using `nvim`:

1. Create a new file called `.zprofile` in your home directory:

   ```shell
   touch ~/.zprofile
   ```

2. Add the profile file as source in your `~/.zshrc` file by adding the following line to the end of the file:

   ```shell
   source ~/.zprofile
   ```

3. Now you can open your file in `nvim` editor and start adding features or personal customizations to your ZSH (You can find some recommended options bellow)

   ```shell
   nvim ~/.zprofile
   ```

### ZSH History Configuration

To optimize Zsh history management, add the following configuration to your `~/.zprofile` file:

```shell
# History
export HISTSIZE=5000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt appendhistory        # Append commands to history file, not overwrite
setopt hist_ignore_space    # Ignore commands starting with a space
setopt hist_ignore_all_dups # Remove all duplicates in history
setopt hist_save_no_dups    # Avoid saving duplicate entries
setopt hist_ignore_dups     # Ignore duplicates in the current session
```

### Default Editors

In order to set the default editor for your ZSH you can add the folowing lines to your `~/.zprofile` file:

```shell
# Default Editors
export EDITOR=nvim
export VISUAL=nvim
```

### Custom Aliases

Custom aliases will help you to save time and increase your productivity when using the command line.

Here is the syntax for defining an alias in Zsh:

```shell
alias alias_name='command_to_execute'
```

#### Recommended Aliases

Here are some examples of custom aliases you can define in your `~/.zprofile` file:

- Replace `ls` command with `eza` command:

  ```shell
  alias ls='eza --icons --group-directories-first -G --no-quotes'
  alias ll='eza --icons --group-directories-first -lG --no-quotes'
  alias lt='eza --icons --group-directories-first --no-quotes -RTL'
  ```

- Replace `cat` command with `bat` command:

  ```shell
  alias cat='bat'
  ```

- Replace `vim` command with `nvim` command:

  ```shell
  alias vim='nvim'
  ```

- Replace `cp` command with interactive version:

  ```shell
  alias cp='cp -i'
  ```

- Peplace `mv` command with interactive version:

  ```shell
  alias mv='mv -i'
  ```

- Replace `mkdir` command with `mkdir -p` command:

  ```shell
  alias mkdir='mkdir -p'
  ```

- Create a new alias for `yt-dlp` command:

  ```shell
  alias ytdl='yt-dlp'
  ```

- Create a new alias for `spotdl` command:

  ```shell
  alias spdl='spotdl'
  ```

- Create a new alias for `clear` command:

  ```shell
  alias cls='clear'
  ```

Save and exit the `~/.zprofile` file:

If you're using nvim, you can save and exit the file by pressing `Esc`, then type `:wq` and press `Enter` to confirm saving and exit.

#### Apply changes

After saving `~/.zprofile`, you can either restart your terminal or source your `~/.zshrc` file to apply the changes immediately:

```shell
source ~/.zshrc
```

## Installing direnv

direnv is a shell extension that automatically loads and unloads environment variables based on your project's directory. It's particularly useful for managing environment-specific configurations in .envrc files. Here's how to install it on your system:

```shell
sudo pacman -S direnv
```

### Setup

For direnv to work properly it needs to be hooked into the shell. Once the hook is configured, restart your shell for direnv to be activated.

**ZSH :** Add the following line at the end of the ~/.zshrc file:

```shell
eval "$(direnv hook zsh)"
```

**Oh my zsh :** Oh my zsh has a core plugin with direnv support. Add direnv to the plugins array in your zshrc file:

```shell
plugins=(... direnv)
```

### Quick demo

```shell
# Create a new folder for demo purposes.
$ mkdir ~/my-project
$ cd ~/my-project

# Show that the FOO environment variable is not loaded.
$ echo ${FOO-nope}
# Output
nope

# Create a new .envrc. This file is bash code that is going to be loaded by
# direnv.
$ echo export FOO=foo > .envrc
# Output
.envrc is not allowed

# The security mechanism didn't allow to load the .envrc. Since we trust it,
# let's allow its execution.
$ direnv allow .
# Output
direnv: reloading
direnv: loading .envrc
direnv export: +FOO

# Show that the FOO environment variable is loaded.
$ echo ${FOO-nope}
# Output
foo

# Exit the project
$ cd ..
# Output
direnv: unloading

# And now FOO is unset again
$ echo ${FOO-nope}
# Output
nope
```

### Key Notes

1. **Applying Changes to `.envrc`**
   After updating the `.envrc` file in your directory, you must run the following command to apply the changes:

   ```shell
   direnv allow .
   ```

2. **Priority of Environment Variables**
   Environment variables defined in the `.envrc` file have higher precedence over those in the project's `.env` file. If the same variable exists in both files, the value from `.envrc` will be used. This allows you to override configurations when needed.

3. **Define alias in `~/.zprofile`:**

   - Inside the `~/.zprofile` file, you can define an alias to simplify the usage of `direnv allow .`

     ```shell
     alias dia='direnv allow .'
     ```

## Installing Git

Git is a widely-used version control system that allows you to manage and track changes to your codebase efficiently. Here's how to install Git on your Linux system:

1. **Install Git**:

   Git is available in the Arch Linux repositories. You can install it using the following command:

   ```shell
   sudo pacman -S git
   ```

2. **Verify Installation**:

   Once the installation is complete, you can verify that Git is installed correctly by checking its version:

   ```shell
   git --version
   ```

3. **Configure Git**:

   - Sets your name as the global user identity in Git.

   ```shell
   git config --global user.name "Your Name"
   ```

   - Sets your email address as the global user identity in Git.

   ```shell
   git config --global user.email "your.email@example.com"
   ```

   - Configures line endings to be converted to LF on input.

   ```shell
   git config --global core.autocrlf "input"
   ```

   - Configures Git to use 'bat' command as the default pager for displaying output.

   ```shell
   git config --global core.pager "bat"
   ```

   - Sets the default branch name to 'main' when initializing new repositories.

   ```shell
   git config --global init.defaultBranch "main"
   ```

   - Configures Git to always create a merge commit when merging, even if the merge could be resolved with a fast-forward.

   ```shell
   git config --global merg.ff "--no-ff"
   ```

   - Configures Git to perform a merge when pulling changes instead of rebasing.

   ```shell
   git config --global pull.rebase "false"
   ```

   - Sets Visual Studio Code as the default text editor for Git, allowing you to edit commit messages and other text files within Git using VS Code. The `--wait` flag ensures that Git waits for the editor to close before proceeding.

   ```shell
   git config --global core.editor "code --wait"
   ```

### Create SSH Key and Add it to GitHub

This step has been excerpted from the [GitHub documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). For a more comprehensive guide, please refer to the documentation provided.

1. Generating a new SSH key:

   ```shell
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

   Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

   ```shell
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   This creates a new SSH key, using the provided email as a label.

2. Adding your SSH key to the ssh-agent:

   1. Start the ssh-agent in the background:

      ```shell
      eval "$(ssh-agent -s)"
      # output Ex. => Agent pid 59566
      ```

   2. Add your SSH private key to the ssh-agent:

      ```shell
      ssh-add ~/.ssh/id_ed25519
      ```

3. Use the `cat` command to display your public key:

```shell
cat path/to/ssh/public/key
```

After copying it, navigate to your GitHub account settings and add the new SSH key to your account.

## sshuttle VPN

If you're looking to establish a VPN connection using an SSH tunnel, sshuttle is a handy tool for the job. Alternatively, you can configure an OpenVPN connection using your system's network manager.

```shell
sudo pacman -S openssh
```

Installs the OpenSSH package, which is required for SSH tunneling.

```shell
sudo pacman -S sshuttle
```

Installs sshuttle, a tool for creating VPN connections through SSH tunnels.

```shell
sshuttle --dns -vr <user>@<server_ip>:<server ssh port> 0/0
```

Establishes an SSH tunnel VPN connection to the specified server, redirecting all traffic through it while maintaining DNS resolution. Replace `<user>`, `<server_ip>`, and `<server ssh port>` with your server's credentials.

## Installing Mission Center

Mission Center is a modern system monitoring application, similar to the Windows Task Manager. It allows you to track CPU, Memory, Disk, Network, and GPU usage in a user-friendly interface. To install Mission Center on your system, run the following command:

```shell
sudo pacman -S mission-center
```

This command installs the `mission-center` package from the `extra` repository. Once the installation is complete, you can launch Mission Center from your system's application menu.

## Installing LibreOffice

LibreOffice is a stable version of the popular open-source office suite. Follow these steps to install it on your system:

```shell
sudo pacman -S libreoffice-still
```

This command installs the LibreOffice-Still package from the official Arch Linux repositories. Once installed, you can launch LibreOffice-Still from your system's application menu.

## Installing GIMP

GIMP (GNU Image Manipulation Program) is a powerful open-source image editing software. Follow these steps to install it on your system:

```shell
sudo pacman -S gimp
```

This command installs the GIMP package from the official Arch Linux repositories. Once installed, you can launch GIMP from your system's application menu.

### Change Gimp's Look

By following the instructions outlined in the [Diolinux/PhotoGIMP](https://github.com/Diolinux/PhotoGIMP) GitHub repository, you can customize the appearance of GIMP to closely resemble that of Photoshop.

## Installing VLC Media Player

VLC Media Player is a versatile multimedia player that supports various audio and video formats, as well as streaming protocols. Here's how to install VLC on your Linux system:

```shell
sudo pacman -S vlc
```

This command installs the vlc package from the official Arch Linux repositories. Once installed, you can launch vlc from your system's application menu.

### Change VLC's Look

You have the option to either update the VLC interface according to your preferences or download and apply a preset configuration such as ones bellow:

[Hind VLC Skin](https://www.pling.com/p/1647074)

[VeLoCity-Skin-for-VLC](https://github.com/dmtiir/VeLoCity-Skin-for-VLC)

## Installing qBittorrent

qBittorrent is a popular open-source BitTorrent client. Follow these steps to install it on your system:

```shell
sudo pacman -S qbittorrent
```

This command installs the qBittorrent package from the official Arch Linux repositories. Once installed, you can launch qBittorrent from your system's application menu.

### Change qBittorrent's Look

You have the option to either update the interface according to your preferences or download and apply a [preset](https://draculatheme.com/qbittorrent) configuration.

## Installing OBS Studio

OBS Studio is a powerful and feature-rich software for video recording and live streaming. Here's how to install it on your system:

```shell
sudo pacman -S obs-studio
```

This command installs the OBS Studio package from the official Arch Linux repositories. Once installed, you can launch OBS Studio from your system's application menu and start recording or streaming your content.

## Video Editor

### Installing Kdenlive

Kdenlive is a popular open-source video editing software that provides a comprehensive set of features for editing videos. Here's how to install it on your system:

```shell
sudo pacman -S kdenlive
```

### Installing DaVinci Resolve

DaVinci Resolve is a professional video editing software with advanced features for color correction, visual effects, and audio post-production. Here's how to install DaVinci Resolve on Arch Linux:

```shell
paru -S davinci-resolve
```

This command installs the Kdenlive package from the official Arch Linux repositories. Once installed, you can launch Kdenlive from your system's application menu and start editing your videos with its intuitive interface and powerful editing tools.

## Installing Discord

Discord is a popular communication platform that offers text, voice, and video chat services. Here's how to install Discord on your system:

```shell
sudo pacman -S discord
```

This command installs the discord package from the official Arch Linux repositories. Once installed, you can follow the on-screen instructions to set up Discord and customize your profile. Once set up, you can join servers, chat with friends, and participate in voice and video calls using Discord.

## Installing Telegram Desktop

Telegram Desktop is a popular messaging application that allows you to securely communicate with others via text, voice, and video calls. Here's how to install it on your system:

```shell
sudo pacman -S telegram-desktop
```

This command installs the Telegram Desktop package from the official Arch Linux repositories. Once installed, you can launch Telegram Desktop from your system's application menu and start using it to connect with your contacts and groups on the Telegram platform.

## Installing lazygit

`lazygit` is a simple terminal-based UI for Git commands, designed to make the process of interacting with Git repositories more intuitive and efficient. Here's how to install it on your system:

```shell
sudo pacman -S lazygit
```

Once installed, you can launch `lazygit` by simply typing `lazygit` in your terminal. This will open up the terminal UI where you can navigate through your Git repositories, view changes, stage files, commit changes, and perform other Git operations with ease.

`lazygit` offers a variety of keyboard shortcuts and features to streamline your Git workflow. You can explore these features further within the `lazygit` interface or by referring to the official documentation.

## Installing Docker

Docker is a platform for developing, shipping, and running applications inside containers. Follow these steps to install Docker on your system:

**Step 1 - Install Required Packages**:

```shell
sudo pacman -S docker
```

This command installs the Docker package, which includes the Docker daemon and command-line tools.

**Step 2 - Enable and Start Docker Service**:

```shell
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

Enabling and starting the Docker service ensures that Docker starts automatically upon system boot and is currently running.

**Step 3 - Verify Docker Installation**:

```shell
sudo docker --version
```

This command verifies that Docker has been successfully installed on your system by displaying the installed Docker version.

**Step 4 - Manage Docker Without Sudo (Optional)**:

To avoid using `sudo` every time you run a Docker command, you can add your user to the `docker` group:

```shell
sudo usermod -aG docker $USER
newgrp docker
```

**Step 5 - Verify Docker Installation (Non-sudo)**:

```shell
docker --version
```

After adding your user to the `docker` group, you can verify the Docker installation again without using `sudo`.

**Step 6 - Test Docker Installation**:

You can verify that Docker is working correctly by running a simple test container:

```shell
docker run hello-world
```

This command downloads a test image, creates a container from it, and runs it. If everything is set up correctly, you should see a message indicating that Docker is running and configured correctly.

### Installing Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It uses YAML files to configure the application's services and dependencies. Follow these steps to install Docker Compose on your system:

**Step 1 - Download Docker Compose Binary**:

```shell
sudo pacman -S docker-compose
```

This command installs the Docker Compose package from the official package repositories.

**Step 2 - Verify Docker Compose Installation**:

```shell
docker-compose --version
```

This command verifies that Docker Compose has been successfully installed on your system by displaying the installed version.

## Installing Portainer

Portainer is a user-friendly container management platform designed to simplify the deployment, management, and monitoring of containerized applications. It provides an intuitive web-based interface, making it easier to work with Docker, Kubernetes, and other container orchestration systems.

**Pull and Run Portainer**:

```shell
docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce
```

## Installing RabbitMQ

RabbitMQ is available in the Arch Repositories (Official/AUR). However, I personally prefer using Docker to install and run the package.

```shell
docker run -d \
    -it --rm --name rabbitmq \
    -p 5672:5672 \
    -p 15672:15672 \
    rabbitmq:4.0-management

# User/Pass => guest/guest
```

## Installing Zookeeper and Kafka

**Zookeeper** is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. It is used by Kafka to manage and coordinate the Kafka brokers.

**Kafka** is a distributed streaming platform that is used to build real-time data pipelines and streaming applications. It is designed to handle large volumes of data with high throughput and low latency.

Zookeeper and Kafka can be easily installed and run using Docker. Below are the commands to set them up.

### Installing Zookeeper

```shell
docker run -d \
  --name zookeeper \
  -p 2181:2181 \
  -e ZOOKEEPER_CLIENT_PORT=2181 \
  -e ZOOKEEPER_TICK_TIME=2000 \
  confluentinc/cp-zookeeper:latest
```

### Installing Kafka

```shell
docker run -d \
  --name kafka \
  --link zookeeper:zookeeper \
  -p 9092:9092 \
  -p 29092:29092 \
  -e KAFKA_BROKER_ID=1 \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092 \
  -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT \
  -e KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  confluentinc/cp-kafka:latest
```

## Installing Redis

Redis is an open-source, in-memory data structure store used as a database, cache, and message broker.

### Option 1: Install via Pacman

```shell
sudo pacman -S redis
```

This command installs the Redis package from the official Arch Linux repositories. Once installed, you can start and enable the Redis service using the following commands:

```shell
sudo systemctl start redis
sudo systemctl enable redis
```

You can also configure Redis by editing its configuration file located at `/etc/redis.conf`. After making any changes, remember to restart the Redis service for the changes to take effect:

```shell
sudo systemctl restart redis
```

You can then connect to the Redis instance using:

```shell
redis-cli
```

### Option 2: Run via Docker

Alternatively, you can run Redis using Docker. This is useful if you prefer isolated environments or want to avoid installing system-wide services.

```shell
docker run -d \
  --name redis \
  -p 6379:6379 \
  -v redis-data:/data \
  redis \
  redis-server --save 60 1 --loglevel warning --appendonly yes --requirepass root
```

This command:

- Runs Redis in a detached container named `redis`
- Maps port `6379` from the container to your host
- Mounts a Docker volume `redis-data` for persistent storage
- Enables append-only file persistence
- Sets a password (`root`) for accessing Redis

**Note:** If you don’t have `redis-cli` locally, you can run it inside the container:

```shell
docker exec -it redis redis-cli -a root
```

Choose the method that best suits your workflow. If you prefer system packages and service management, use `pacman`. If you prefer containerized apps, Docker is a great choice.

## Installing RedisInsight

RedisInsight is a graphical user interface (GUI) for managing Redis databases. It provides a user-friendly interface to interact with your Redis instances. Here's how you can install RedisInsight:

```shell
paru -S redisinsight-bin
```

## Installing MongoDB

MongoDB is a popular NoSQL database management system that stores data in flexible, JSON-like documents.

### Option 1: Install via AUR (`mongodb-bin`)

Arch Linux no longer provides official MongoDB packages, but you can install the community-maintained binary package (`mongodb-bin`) via an AUR helper like `paru`.

1. **Install MongoDB-bin Package**:

   ```shell
   paru -S mongodb-bin
   ```

2. **Start MongoDB Service**:

   ```shell
   sudo systemctl start mongodb
   ```

3. **Enable MongoDB Service**:

   ```shell
   sudo systemctl enable mongodb
   ```

4. **Verify Installation**:

   ```shell
   sudo systemctl status mongodb
   ```

### Option 2: Run MongoDB via Docker

```shell
docker run -d \
  --name mongo \
  -p 27017:27017 \
  -v mongo-data:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=mongo \
  -e MONGO_INITDB_ROOT_PASSWORD=root \
  mongo:latest
```

This command:

- Starts a new MongoDB container named `mongo`
- Maps port `27017` from the container to your host
- Persists data using a Docker volume `mongo-data`
- Sets up a root user with the username `mongo` and password `root`

## Installing MongoDB Compass

MongoDB Compass is a graphical user interface (GUI) for MongoDB. It allows you to visually explore your data, run ad hoc queries, and interact with your MongoDB databases. Here's how to install MongoDB Compass on your Linux system using the AUR (Arch User Repository):

```shell
paru -S mongodb-compass
```

## MySQL and phpMyAdmin

MySQL and phpMyAdmin are available in the Arch Repositories (Official/AUR). However, I personally prefer using Docker to install and run these packages.

**Step 1 - Create mySQL Data Volume direction**:

```shell
sudo mkdir -p /opt/mysql
sudo chown <username>:wheel /opt/mysql
```

**Step 3 - Pull and Run MySQL**:

```shell
docker run -d \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD="root" \
    -v /opt/mysql:/var/lib/mysql \
    -p 3306:3306 \
    mysql
```

**Step 4 -Pull and Run phpMyAdmin**:

```shell
docker run -d \
    --name phpmyadmin \
    -e PMA_HOST=mysql \
    -p 8080:80 \
    phpmyadmin/phpmyadmin

# PMA_HOST is the IP or domain of the MySQL server,
# so we can use the MySQL container name as the domain
# cause the Docker network create the route as a DNS server.
```

## Installing Elasticsearch and Kibana

Elasticsearch and Kibana are available in the Arch Repositories (Official/AUR). However, I personally prefer using Docker to install and run these packages.

**Step 1 - Create a Network Called "elastic"**:

```shell
docker network create elastic
```

**Step 2 - Pull Elasticsearch Docker Image**:

```shell
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.16.0 # Current latest
```

**Step 3 - Increase System's `vm.max_map_count` (required in linux and mac)**:

```shell
sudo sysctl -w vm.max_map_count=262144
```

**Step 4 - Run Elasticsearch**:

```shell
docker run -d \
    --name elastic \
    --net elastic \
    -p 9200:9200 \
    -it -m 1GB \
    docker.elastic.co/elasticsearch/elasticsearch:8.16.0
```

**Step 5 - Pull Kibana Docker Image**:

```shell
docker pull docker.elastic.co/kibana/kibana:8.16.0 # Current latest
```

**Step 6 - Run Kibana**:

```shell
docker run -d \
    --name kibana \
    --net elastic \
    -p 5601:5601 \
    docker.elastic.co/kibana/kibana:8.16.0
```

## installing PostgreSQL and pgAdmin

PostgreSQL and pgAdmin are available in the Arch Repositories (Official/AUR). However, I personally prefer using Docker to install and run these packages.

**Step 1 - Create PostgreSQL Data Volume direction**:

```shell
sudo mkdir -p /opt/postgresql
sudo chown <username>:wheel /opt/postgresql
```

**Step 2 - Pull and Run PostgreSQL**:

```shell
docker run -d \
  --name postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=root \
  -v /opt/postgresql:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgis/postgis
```

**Step 3 - Pull and Run PgAdmin**:

```shell
docker run -d \
  --name pgadmin_container \
  -e PGADMIN_DEFAULT_EMAIL=admin@example.com \
  -e PGADMIN_DEFAULT_PASSWORD=admin \
  -p 8081:80 \
  dpage/pgadmin4
```

## Installing FastFetch

FastFetch is a command-line tool that displays system information in a visually appealing way. It shows details such as your operating system, kernel version, CPU, GPU, memory usage, and more. Here's how to install Neofetch on your system:

```shell
sudo pacman -S fastfetch
```

### Running FastFetch on Terminal Startup

To run FastFetch automatically when openng new terminal, add the following line to your `~/.bashrc` or `~/.zshrc` file:

```shell
if [ -f /usr/bin/fastfetch ]; then fastfetch; fi
```

## Installing Google Chrome

Google Chrome is a popular web browser developed by Google. You can install Google Chrome on Arch Linux using the Arch User Repository (AUR). Here's how:

```shell
paru -S google-chrome
```

## Installing Visual Studio Code (VS Code)

Visual Studio Code is a popular source-code editor developed by Microsoft. The `visual-studio-code-bin` package available on the Arch User Repository (AUR). Here's how to do it:

```shell
paru -S visual-studio-code-bin
```

**Note**: After installing VSCode on Gnome, your system's default file manager may change to VSCode. To revert the default file manager back to Nautilus, run the following command:

```shell
xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

### Recommended Plugins

| Plugin Name         | Plugin Name                                            | Plugin Name                    | Plugin Name                | Plugin Name               | Plugin Name                  |
| ------------------- | ------------------------------------------------------ | ------------------------------ | -------------------------- | ------------------------- | ---------------------------- |
| advanced-new-file   | Atom Material Icons                                    | Auto Rename Tag                | Auto-Open Markdown Preview | Bash Beautify             | Bash IDE                     |
| better comments     | Code Spell Checker                                     | CodeSnap                       | Custom CSS and JS Loader   | EJS language support      | Error Lens                   |
| ESLint              | Even Better TOML                                       | Explorer Exclude               | Git Graph                  | Git lens                  | GraphQL                      |
| HTML CSS Support    | Ignore files                                           | JavaScript (ES6) code snippets | lazygit                    | Live Server               | lua                          |
| Markdown All in One | Markdown Preview Github Styling                        | Markdown Table                 | Import Cost                | Markdown Table Prettifier | Markdownlint                 |
| Nested Comments     | node-snippets                                          | Nord Theme                     | Test Adapter Converter     | Overtype                  | Persian - Code Spell Checker |
| Prettier            | Prettify Json                                          | Pretty TypeScript Errors       | Proto Lint                 | Rainbow Brackets          | Select Line Status Bar       |
| Todo Tree           | VSCode Animations                                      | Toggle Quotes                  | vscode-proto3              | Cody: AI Code Assistant   | Docker                       |
| Docker DX           | inifmt - formatter for .ini files, plain text and more |                                |                            |                           |                              |

### Theme

- Nord Theme

### Recommended Settings

```json
{
	/**** START: General ***********/

	// Disables the depreciation notice for the Rainbow Brackets extension.
	"RainbowBrackets.depreciation-notice": false,

	// Disables compact folders in the file explorer.
	"explorer.compactFolders": false,

	// Disables highlights for the "todo-tree" extension.
	"todo-tree.highlights.enabled": false,

	// Automatically opens untrusted files without a prompt.
	"security.workspace.trust.untrustedFiles": "open",

	// Enables error lens only for errors and warnings.
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],

	// Disables side-by-side view in the diff editor.
	"diffEditor.renderSideBySide": false,

	// Disables the Chat Command Center in VS Code.
	"chat.commandCenter.enabled": false,

	// Ignores VS Code extension recommendations.
	"extensions.ignoreRecommendations": true,

	// Disables breadcrumbs navigation in the editor.
	"breadcrumbs.enabled": false,

	/*********** END: General ****/

	/**** START: Files ***********/

	// Removes trailing whitespace from files on save.
	"files.trimTrailingWhitespace": true,

	// Ensures a final newline is added at the end of each file.
	"files.insertFinalNewline": true,

	// Removes extra newlines at the end of files.
	"files.trimFinalNewlines": true,

	// Automatically saves files after a short delay.
	"files.autoSave": "afterDelay",

	/*********** END: Files ****/

	/**** START: Zen Mode ***********/

	// Disables centering the editor layout in Zen mode.
	"zenMode.centerLayout": false,

	// hide line numbers visible in Zen mode.
	"zenMode.hideLineNumbers": true,

	/*********** END: Zen Mode ****/

	/**** START: Window ***********/

	// Uses a custom title bar style.
	"window.titleBarStyle": "custom",

	// Toggles the menu bar visibility when the Alt key is pressed.
	"window.menuBarVisibility": "toggle",

	// Opens new windows with the same dimensions as the previous window.
	"window.newWindowDimensions": "inherit",

	/*********** END: Window ****/

	/**** START: Workbench ***********/

	// Disables layout control in the workbench.
	"workbench.layoutControl.enabled": false,

	// Disables navigation control in the workbench.
	"workbench.navigationControl.enabled": false,

	// Disables VS Code tips.
	"workbench.tips.enabled": false,

	// Sets the icon theme to "a-file-icon-vscode".
	"workbench.iconTheme": "a-file-icon-vscode",

	// Sets the product icon theme.
	"workbench.productIconTheme": "a-file-icon-vscode-product-icon-theme",

	// Sets the color theme to "Nord".
	"workbench.colorTheme": "Nord",

	// Disables the startup editor (no welcome page or recently opened files).
	"workbench.startupEditor": "none",

	/*********** END: Workbench ****/

	/**** START: Git & GitLens ***********/

	// Enables automatic fetching of Git repositories.
	"git.autofetch": true,

	// Displays the GitLens commit graph in the editor instead of a separate panel.
	"gitlens.graph.layout": "editor",

	// Displays source control repositories and changes in a tree view instead of a list.
	"scm.defaultViewMode": "tree",

	/*********** END: Git & GitLens ****/

	/**** START: Editor ***********/

	// Enables font ligatures for better typography.
	"editor.fontLigatures": true,

	// Enables zooming in/out with the mouse wheel while holding Ctrl.
	"editor.mouseWheelZoom": true,

	// Uses tab characters instead of spaces for indentation.
	"editor.insertSpaces": false,

	// Enables linked editing for HTML and XML tags.
	"editor.linkedEditing": true,

	// Disables syntax highlighting when copying code.
	"editor.copyWithSyntaxHighlighting": false,

	// Disables automatic indentation detection.
	"editor.detectIndentation": false,

	// Disables the glyph margin (extra space for debugging and code lenses).
	"editor.glyphMargin": false,

	// Sets the line height to 2.
	"editor.lineHeight": 2,

	// Sets the tab size to 2 spaces.
	"editor.tabSize": 2,

	// Sets the editor font to "JetBrainsMono Nerd Font".
	"editor.fontFamily": "'JetBrainsMono Nerd Font', monospace",

	// Uses the tab size value for indentation size.
	"editor.indentSize": "tabSize",

	// Enables word-based suggestions from matching documents.
	"editor.wordBasedSuggestions": "matchingDocuments",

	// Enables smooth caret animation when moving the cursor.
	"editor.cursorSmoothCaretAnimation": "on",

	// Disables the lightbulb suggestion feature.
	"editor.lightbulb.enabled": "off",

	// Highlights the entire line where the cursor is located.
	"editor.renderLineHighlight": "all",

	// Disables automatic bracket matching.
	"editor.matchBrackets": "never",

	// Disable copilot inline suggestion
	"editor.inlineSuggest.suppressSuggestions": true,

	// VSCode should use single quotes for auto-imports in JavaScript/TypeScript
	"javascript.preferences.quoteStyle": "single",
	"typescript.preferences.quoteStyle": "single",

	// Customizes token colors in the editor.
	"editor.tokenColorCustomizations": {
		"textMateRules": [
			{
				"name": "string color",
				"scope": ["string"],
				"settings": {
					"foreground": "#fdee00" // Custom string color
				}
			},
			{
				"name": "variable color",
				"scope": ["variable"],
				"settings": {
					"foreground": "#ffffee" // Custom variable color
				}
			},
			{
				"name": "parameter color",
				"scope": ["variable.parameter"],
				"settings": {
					"foreground": "#ffd390" // Custom parameter color
				}
			},
			{
				"name": "number color in env files",
				"scope": ["source.ini"],
				"settings": {
					"foreground": "#76fd00" // Custom number color for .env files
				}
			}
		]
	},

	/*********** END: Editor ****/

	/**** START: Terminal ***********/

	// Sets an empty environment configuration for the integrated terminal on Linux.
	"terminal.integrated.env.linux": {},

	// Sets the terminal font to "JetBrainsMono Nerd Font".
	"terminal.integrated.fontFamily": "JetBrainsMono Nerd Font",

	// Disables terminal tabs.
	"terminal.integrated.tabs.enabled": false,

	/*********** END: Terminal ****/

	/**** START: Prettier ***********/

	// Uses tabs instead of spaces for formatting.
	"prettier.useTabs": true,

	// Set the number of spaces per indentation level to 2
	"prettier.tabWidth": 2,

	// Use LF (Line Feed) as the line ending (good for cross-platform consistency, especially with Unix/Linux)
	"prettier.endOfLine": "lf",

	// Use single quotes instead of double quotes
	"prettier.singleQuote": true,

	// Add a trailing comma wherever possible (like in arrays, objects, etc.)
	"prettier.trailingComma": "all",

	// Print spaces between brackets in object literals (e.g., { foo: bar } instead of {foo: bar})
	"prettier.bracketSpacing": true,

	// Always add a semicolon at the end of statements
	"prettier.semi": true,

	// Always include parentheses around arrow function parameters (even if there's only one)
	"prettier.arrowParens": "always",

	// Wrap lines at 100 characters
	"prettier.printWidth": 100,

	/*********** END: Prettier ****/

	/**** START: cSpell ***********/

	// Adds "fastify" as a user-defined word to the spell checker.
	"cSpell.userWords": ["fastify", "liara"],

	// Enables spell checking for English and Persian.
	"cSpell.language": "en,fa",

	/*********** END: cSpell ****/

	/**** START: Selected line ***********/

	// Aligns the selected line highlight to the right.
	"selectline.alignment": "right",

	/*********** END: Selected line ****/

	/**** START: Formatter ***********/

	// Enable the prettier format on save
	"editor.formatOnSave": true,

	// Automatically formats code while typing.
	"editor.formatOnType": true,

	// Automatically formats code when pasting.
	"editor.formatOnPaste": true,

	// Sets Prettier as the default code formatter.
	"editor.defaultFormatter": "esbenp.prettier-vscode",

	// Uses Prettier as the default formatter for JavaScript.
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},

	// Uses Lua Helper as the default formatter for Lua.
	"[lua]": {
		"editor.defaultFormatter": "yinfei.luahelper"
	},

	// Uses Even Better TOML as the default formatter for TOML files.
	"[toml]": {
		"editor.defaultFormatter": "tamasfe.even-better-toml"
	},

	// Uses Prettier as the default formatter for TypeScript.
	"[typescript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},

	// Uses Docker extension formatter for Docker Compose files.
	"[dockercompose]": {
		"editor.defaultFormatter": "ms-azuretools.vscode-docker"
	},

	// Uses lkrms as the default formatter for TypeScript.
	"[plaintext]": {
		"editor.defaultFormatter": "lkrms.inifmt"
	},

	/*********** END: Formatter ****/

	/**** START: Customization ***********/

	// Imports custom CSS and scripts for VS Code.
	"vscode_custom_css.imports": [
		"file:///home/saeed/.overhaul/vscode/custom-vscode.css",
		"file:///home/saeed/.overhaul/vscode/vscode-script.js",
		"file:///home/saeed/.vscode/extensions/brandonkirbyson.vscode-animations-2.0.7/dist/updateHandler.js"
	],

	/**** END: Customization ***********/

	/**** START: Github copilot ***********/

	// Disable github copilot
	"github.copilot.enable": {
		"*": false,
		"plaintext": false,
		"markdown": false,
		"scminput": false
	}

	/**** END: Github copilot ***********/
}
```

### VSCode Custom CSS & JS

This section is inspired by [Glenn Raya](https://www.youtube.com/@glennraya)'s video, [Transforming VS Code: Beyond Themes](https://www.youtube.com/watch?v=9_I0bySQoCs).

We will use the `Custom CSS and JS Loader` extension to customize the appearance of VS Code by applying custom CSS and JavaScript. This process involves creating configuration files, enabling the custom loader, and resolving any permission issues, particularly on Linux systems like Arch Linux.

#### Steps to Enable Custom CSS & JS in VS Code

1. **Install the Extension**
   Ensure you have installed the `Custom CSS and JS Loader` extension in your VS Code.

2. **Create Configuration Files**
   Create the following files in your filesystem:

   - **Custom CSS:** `/home/<user>/.overhaul/vscode/custom-vscode.css`
   - **Custom JS:** `/home/<user>/.overhaul/vscode/vscode-script.js`

3. **Update Settings**
   Add the following snippet to your `settings.json` to link these files:

   ```json
   "vscode_custom_css.imports": [
       "file:///home/<user>/.overhaul/vscode/custom-vscode.css",
       "file:///home/<user>/.overhaul/vscode/vscode-script.js"
   ]
   ```

4. **Enable Custom CSS & JS**
   Open the VS Code Command Palette (`Ctrl+Shift+P`), search for `Enable Custom CSS and JS`, and run it. This step allows VS Code to load your custom scripts and styles.

5. **Resolve Permission Issues on Linux**
   On Linux systems, VS Code's permissions may block this functionality. To fix this, modify the permissions using the following commands:

   ```shell
   sudo chown -R $(whoami) "$(which code)"
   sudo chown -R $(whoami) /opt/visual-studio-code
   ```

   If you use a different distribution or OS, refer to the plugin's documentation for the correct paths or commands.

6. **Reload Changes**
   After making changes to your CSS or JS files, reload them by running the `Reload Custom CSS and JS` command from the Command Palette.

#### Example Files

Here are example files inspired by Glenn Raya's video:

- **CSS File**
  Modifies visual aspects such as the sidebar title, tooltips, and Command Palette.
  [Download CSS File](./files/vscode/custom-vscode.css)

- **JS File**
  Adds a blur effect to the application window when the Command Palette is open.
  [Download JS File](./files/vscode/vscode-script.js)

By following these steps, you can transform VS Code's appearance beyond standard themes, giving it a unique and personalized look.

### Custom Shortcuts

```json
// Place your key bindings in this file to override the defaultsauto[]
[
	//? ***** START: Copy line *****
	{
		//* Remove old keybinding for copy lines down
		"key": "ctrl+shift+alt+down",
		"command": "-editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly"
	},
	{
		//* Set new keybinding for copy lines down
		"key": "ctrl+d",
		"command": "editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly"
	},

	{
		//* Remove keybinding for ctrl + d old functionality
		"key": "ctrl+d",
		"command": "-editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus"
	},
	{
		//* Set a new key binding for ctrl + d old functionality
		"key": "alt+d",
		"command": "editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus"
	},

	//? ***** START: Delete line *****
	{
		//* Remove old keybinding for delete lines
		"key": "ctrl+shift+k",
		"command": "-editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly"
	},
	{
		//* Set new keybinding for delete lines
		"key": "ctrl+y",
		"command": "editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly"
	},

	{
		//* Remove keybinding for ctrl+y old functionality
		"key": "ctrl+y",
		"command": "-redo"
	},

	//? ***** START: Comments management *****
	{
		//* Remove old keybinding for nested comments
		"key": "ctrl+alt+/",
		"command": "-extension.nestComments",
		"when": "editorHasSelection && editorTextFocus"
	},
	{
		//* Set new keybinding for nested comments
		"key": "ctrl+shift+/",
		"command": "extension.nestComments",
		"when": "editorHasSelection && editorTextFocus"
	},

	{
		//* Remove old keybinding for block comments
		"key": "ctrl+shift+a",
		"command": "-editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly"
	},
	{
		//* Set new keybinding for block comments
		"key": "ctrl+alt+/",
		"command": "editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly"
	},

	//? ***** START: Fold/Unfold code block *****
	{
		//* Remove old keybinding for fold all blocks
		"key": "ctrl+k ctrl+0",
		"command": "-editor.foldAll",
		"when": "editorTextFocus && foldingEnabled"
	},
	{
		//* Set new keybinding for fold all blocks
		"key": "ctrl+shift+numpad_subtract",
		"command": "editor.foldAll",
		"when": "editorTextFocus && foldingEnabled"
	},

	{
		//* Remove old keybinding for unfold all blocks
		"key": "ctrl+k ctrl+j",
		"command": "-editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled"
	},
	{
		//* Set new keybinding for unfold all blocks
		"key": "ctrl+shift+numpad_add",
		"command": "editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled"
	},

	//? ***** START: Terminal *****
	{
		//* Remove old keybinding for toggle terminal
		"key": "ctrl+`",
		"command": "-workbench.action.terminal.toggleTerminal",
		"when": "terminal.active"
	},
	{
		//* Set new keybinding for toggle terminal
		"key": "ctrl+alt+`",
		"command": "workbench.action.terminal.toggleTerminal",
		"when": "terminal.active"
	},

	//? ***** START: Folder management *****
	{
		//* Remove old keybinding for close folder
		"key": "ctrl+k f",
		"command": "-workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'"
	},
	{
		//* Set new keybinding for close folder
		"key": "ctrl+meta+w",
		"command": "workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'"
	},

	//? ***** START: Git management *****
	{
		//* Set new keybinding for git graph view
		"key": "ctrl+alt+g",
		"command": "git-graph.view"
	},

	{
		"key": "ctrl+alt+x",
		"command": "gitlens.showGraphPage"
	},

	{
		//* Remove old keybinding for open lazy git
		"key": "ctrl+g g",
		"command": "-lazygit.openLazygit"
	},
	{
		//* Set new keybinding for open lazy git
		"key": "ctrl+g ctrl+g",
		"command": "lazygit.openLazygit"
	},

	//? ***** START: prettier selected format *****
	{
		//* Remove old keybinding for formatting selection
		"key": "ctrl+k ctrl+f",
		"command": "-editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly"
	},
	{
		//* Set new keybinding for formatting selection
		"key": "ctrl+alt+f",
		"command": "editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly"
	},

	//? ***** START: Go to line *****
	{
		//* Remove old keybinding for Go to line
		"key": "alt+g",
		"command": "workbench.action.gotoLine"
	},
	{
		//* Set new keybinding for Go to line
		"key": "ctrl+g",
		"command": "-workbench.action.gotoLine"
	},

	//? ***** START: Collapse explorer *****
	{
		//* Set new keybinding for Collapse explorer
		"key": "shift+alt+e",
		"command": "workbench.files.action.collapseExplorerFolders"
	},

	//? ***** START: Sidebar Explorer Focus *****
	{
		//* Remove old keybinding for Sidebar Explorer Focus
		"key": "ctrl+shift+e",
		"command": "-workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled"
	},
	{
		//* Set new keybinding for Sidebar Explorer Focus
		"key": "alt+e",
		"command": "workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled"
	},

	//? ***** START: Focus management *****
	{
		//* Remove old keybinding for above group Focus
		"key": "ctrl+k ctrl+up",
		"command": "-workbench.action.focusAboveGroup"
	},
	{
		//* Set new keybinding for above group Focus
		"key": "ctrl+shift+c ctrl+shift+up",
		"command": "workbench.action.focusAboveGroup"
	},

	{
		//* Remove old keybinding for below group Focus
		"key": "ctrl+k ctrl+down",
		"command": "-workbench.action.focusBelowGroup"
	},
	{
		//* Set new keybinding for below group Focus
		"key": "ctrl+shift+c ctrl+shift+down",
		"command": "workbench.action.focusBelowGroup"
	},

	{
		//* Remove old keybinding for left group Focus
		"key": "ctrl+k ctrl+left",
		"command": "-workbench.action.focusLeftGroup"
	},
	{
		//* Set new keybinding for left group Focus
		"key": "ctrl+shift+c ctrl+shift+left",
		"command": "workbench.action.focusLeftGroup"
	},

	{
		//* Remove old keybinding for right group Focus
		"key": "ctrl+k ctrl+right",
		"command": "-workbench.action.focusRightGroup"
	},
	{
		//* Set new keybinding for right group Focus
		"key": "ctrl+shift+c ctrl+shift+right",
		"command": "workbench.action.focusRightGroup"
	},

	//? ***** START: ZenMode management *****
	{
		//* Remove old keybinding for zen mode activation
		"key": "ctrl+alt+z",
		"command": "workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext"
	},
	{
		//* Set new keybinding for zen mode activation
		"key": "ctrl+k z",
		"command": "-workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext"
	},

	//? ***** START: over type extension management *****
	{
		//* Remove keybinding for over type extension activation
		"key": "ctrl+shift+i",
		"command": "-overtype.toggle",
		"when": "editorFocus"
	},

	//? ***** START: Todo tree extension toggle *****
	{
		//* Set new keybinding for Todo tree toggle
		"key": "shift+alt+t",
		"command": "workbench.view.extension.todo-tree-container"
	},

	//? ***** START: Editor window zoom *****
	{
		//* Remove keybinding for window's zoom in
		"key": "ctrl+numpad_add",
		"command": "-workbench.action.zoomIn"
	},
	{
		//* Set new keybinding for window's zoom in
		"key": "shift+alt+numpad_add",
		"command": "workbench.action.zoomIn"
	},
	{
		//* Remove keybinding for window's zoom out
		"key": "ctrl+numpad_subtract",
		"command": "-workbench.action.zoomOut"
	},
	{
		//* Set new keybinding for window's zoom out
		"key": "shift+alt+numpad_subtract",
		"command": "workbench.action.zoomOut"
	},

	//? ***** START: Font size manager *****
	{
		//* Set new keybinding for increasing font size
		"key": "ctrl+numpad_add",
		"command": "editor.action.fontZoomIn"
	},
	{
		//* Set new keybinding for decreasing font size
		"key": "ctrl+numpad_subtract",
		"command": "editor.action.fontZoomOut"
	},
	{
		//* Set new keybinding for resetting font size
		"key": "ctrl+numpad_multiply",
		"command": "editor.action.fontZoomReset"
	},

	//? ***** START: Cody chat and command *****
	{
		//* Set new keybinding for opening custom command menu
		"key": "shift+alt+a",
		"command": "cody.menu.custom-commands",
		"when": "cody.activated && workspaceFolderCount > 0"
	},
	{
		//* Remove keybinding for opening custom command menu
		"key": "shift+alt+c",
		"command": "-cody.menu.custom-commands",
		"when": "cody.activated && workspaceFolderCount > 0"
	},
	{
		//* Set new keybinding for opening Chat
		"key": "shift+alt+c",
		"command": "cody.chat.focus"
	},
	{
		"key": "ctrl+alt+s",
		"command": "workbench.action.tasks.runTask"
	}
]
```

## Installing Postman

Postman is a popular collaboration platform for API development, used by developers worldwide. The `postman-bin` package available on the Arch User Repository (AUR). Here's how to do it:

```shell
paru -S postman-bin
```

## Installing Amberol Music Player

Amberol Music Player is a lightweight and customizable music player designed for simplicity and ease of use. You can install Amberol Music Player using the Arch User Repository (AUR). Here's how:

```shell
paru -S amberol
```

## Image Viewer

### Installing qview (Recomended)

QView is a lightweight and fast image viewer for Linux, designed for simplicity and ease of use. It supports a wide range of image formats. With its minimal interface, QView provides a clean and distraction-free environment for viewing images.

```shell
paru -S qview
```

### Installing Loupe

Loupe is the default image viewer for GNOME, providing a modern, lightweight, and user-friendly interface for viewing images. Loupe is included in the official Arch Linux repositories, . Here's how to install it:

```shell
sudo pacman -S loupe
```

### Installing nomacs

nomacs is a free, open-source image viewer that supports multiple platforms, including Linux. You can install nomacs using the Arch User Repository (AUR). Here's how:

```shell
paru -S nomacs
```

Note: You don't need to install this applicatin in Gnome desctop environment

## Installing GNOME Boxes

GNOME Boxes is a simple and user-friendly virtualization application designed for GNOME desktops. It allows users to easily create, manage, and run virtual machines, remote desktop sessions, and local virtual systems.

```shell
sudo pacman -S gnome-boxes
```

## Installing Blanket

Blanket is a simple and minimalist GNOME app designed to help users focus, relax, or sleep better by providing a variety of ambient sounds.

```shell
sudo pacman -S blanket
```

## Installing HandBrake

HandBrake is an open-source video transcoder that allows you to convert video files into various formats. Here's how to install HandBrake on Arch Linux using the official repositories:

```shell
sudo pacman -S handbrake
```

## Installing Albert Application Launcher

Albert is a fast and flexible application launcher for Linux systems. It allows you to quickly search and launch applications, files, and perform web searches right from your desktop. Here's how to install Albert on your Linux system:

```shell
paru -S albert
```

**Note:** Add Albert to your system startup applications

### Albert Recommended Configs

![Alt text](./images/20230505135607.png)

![Alt text](./images/20231216110803.png)

![Alt text](./images/20231216110858.png)

![Alt text](./images/20240209224715.png)

## Installing Rclone & Rclone Browser

Rclone is a command-line program to manage files on cloud storage services and remote servers. Here's how to install Rclone on your Linux system:

1. **Install Rclone**:

   Rclone is available in the Arch Linux repositories. You can install it using the following command:

   ```shell
   sudo pacman -S rclone
   ```

2. **Install Rclone Browser**:

   Simple cross platform GUI for rclone command line tool. You can install Rclone Browser using the Arch User Repository (AUR). Here's how:

   ```shell
   paru -S rclone-browser
   ```

   Config Rclone Browser to close to systemtry and add it to your system startup applications.

3. **Configure Rclone**:

   After installing Rclone and Rclone Browser, you'll need to configure it to connect to your cloud storage services such as google drive. In order to do that, first open Rclone Browser and click on the **Config** button at the bottom left side of the application. Now you have to follow the on-screen prompts to set up remote connections. You'll need to provide details such as the name of the remote, type of storage, and authentication credentials.

   - The first question is if you want to create a new remote? Type **n** and press enter.
   - After that you'll be prompted to choose a name for your remote. Type your desired name such as **google**.
   - In the next step, you need to choose a type for your remote, here we use **Google Drive**, find the corresponding number and enter it as input.
   - the Two next steps would ask you to input your google application's **client id** and **client secret**, you can leave them empty.
   - Now you need to give rclone access to the files in your google drive, choose the access level you prefer.
   - At the next prompt you can choose which folder rclone will sync with. Leave it blank and press enter for full access
   - At the next prompt you will be asked if you want to open advanced settings, type **n** and press enter.
   - At the end you will be asked to login to your google drive using your browser, type **y** and press enter.

   You have now installed and configured everything you need to sync the cloud storage service with your system. To use this service, just open the Rclone Browser program and double-click on the service you want to synchronize. After it opens, select the mount option from the action menu and select the desired directory where you want the data to be synchronized.

## Installing AnyDesk

AnyDesk is a remote desktop application that allows users to access and control computers remotely. It is available in the Arch Linux User Repository (AUR). Here's how to install AnyDesk on your Linux system:

```shell
paru -S anydesk-bin
```

## Installing Droidcam

Droidcam is a tool that allows you to use your Android device as a webcam for your computer. Here's how to install it from the Arch User Repository (AUR):

```shell
paru -S droidcam
```

## Install Spot Player

Spot Player is a versatile multimedia player designed to enhance security measures by offering features such as lock functionality to prevent unauthorized copying and recording. Developed by an Iranian team, this program also provides detailed statistics on played videos. Its primary aim is to safeguard online courses against unauthorized duplication and distribution. In order to install this application on linux you have to use `wine`. Here's how to install Spot Player:

1. **Navigate to the `~/Downloads` directory:**

   ```shell
   cd ~/Downloads
   ```

2. **Download Spot Player installer:**

   ```shell
   wget https://app.spotplayer.ir/assets/bin/spotplayer/setup.exe
   ```

   Once the download process is over you can install application using `wine` application installer.

## Installing Flatpak

Flatpak is a universal packaging format that allows developers to distribute applications for Linux systems. It provides a sandbox environment for applications, ensuring better security and compatibility across different distributions. Here's how to install Flatpak on your Arch Linux system:

1. **Install Flatpak**:

   Flatpak is available in the Arch Linux repositories. You can install it using the package manager, `pacman`:

   ```shell
   sudo pacman -S flatpak
   ```

2. **Add Flathub Repository**:

   Flathub is the official repository for Flatpak applications. You need to add it to your system to install Flatpak applications from Flathub. Run the following command to add the Flathub repository:

   ```shell
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   ```

3. **Restart Your System**:

   After installing Flatpak and adding the Flathub repository, it's a good idea to restart your system to ensure that the changes take effect.

   ```shell
   sudo reboot
   ```

## Setting Up Timeshift for System Snapshots

Timeshift is a powerful tool for creating system snapshots on Linux, allowing you to easily restore your system to a previous state if needed. Here's how to set it up:

1. **Install Timeshift**:

   First, install Timeshift from the AUR repository:

   ```shell
   paru -S timeshift
   ```

2. **Enable Cronie Service**:

   Timeshift uses cron jobs to schedule automatic snapshots. Enable and start the `cronie` service:

   ```shell
   sudo systemctl enable --now cronie.service
   ```

3. **Configure Timeshift**:

   Launch Timeshift and configure it to use BTRFS as the snapshot backend. Create the first snapshot to capture the current system state.

4. **Automatic Snapshots**:

   Install `timeshift-autosnap` to automatically create snapshots before system updates:

   ```shell
   paru -S timeshift-autosnap
   ```

5. **Configure GRUB for BTRFS**:

   To boot from a BTRFS snapshot, install `grub-btrfs` and regenerate the GRUB configuration:

   ```shell
   sudo pacman -S grub-btrfs
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

6. **Enable GRUB-BTRFS Daemon**:

   Enable and start the `grub-btrfsd` daemon:

   ```shell
   sudo systemctl enable --now grub-btrfsd
   ```

With Timeshift configured and automatic snapshots in place, you can rest assured knowing that your system is protected and can be easily restored to a previous state if necessary.
