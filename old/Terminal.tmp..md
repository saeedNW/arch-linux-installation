# Terminal

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

4. Replace `cat` command with `bat` command:

   ```shell
   alias cat='bat'
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

Replace `ls` command with `eza` command:

```shell
alias ls='eza --icons --group-directories-first -G --no-quotes'
alias ll='eza --icons --group-directories-first -lG --no-quotes'
alias lt='eza --icons --group-directories-first --no-quotes -RTL'
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

## FastFetch Custom Config

Download FastFetch [custom config](../general/fastfetch-config.jsonc)

    fastfetch --gen-config

    cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc-backup

    cp -f ~/Downloads/fastfetch-config.jsonc ~/.config/fastfetch/config.jsonc

---

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

---

## Oh My Posh

**Step 2 - Install [Oh My Posh](https://ohmyposh.dev/) Prompt Theme**:

This section draws inspiration from the video **"[We may have killed p10k, ...](https://www.youtube.com/watch?v=9U8LCjuQzdc)"** by [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).

    paru -S oh-my-posh

**Step 3 - Oh My Posh Configuration and setup**:

- Create Oh My Posh config file:

      mkdir ~/.config/ohmyposh
      touch ~/.config/ohmyposh/zen.toml

- Initialize Oh My Posh:

  After creating the config file, you can add the Oh My Posh initializer to your `.zshrc` file by adding the following line at the end of the file:

      eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

  It's important to note that after adding the Oh My Posh initializer to your `.zshrc` file, the next time you open your terminal, you may encounter a completely blank screen. This happens because the configuration file is currently empty, and Oh My Posh has no settings to render the prompt.

- Add Oh My Posh Configuration:

  To configure Oh My Posh, you can refer to its [documentation](https://ohmyposh.dev/docs) to create a fully personalized prompt. Alternatively, you can use [this configuration file](./files/ohmyposh/zen.toml) to implement a prompt that maintains consistency with the rest of the Nordic-themed customization.

---

## Bat Theme Configuration

Add the following line at the end of your `~/.zshrc` file in order to set the bat theme to match with the nordic theme

    # Bat (Better cat)
    export BAT_THEME=base16-256
