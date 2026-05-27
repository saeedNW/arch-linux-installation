# Terminal

## make sure git is installed

```bash
sudo pacman -S --needed git
```

---

## Install Required fonts

Custom fonts can greatly improve your terminal and coding experience.

### Install FiraCode fonts

Fira Code is a free monospaced font containing ligatures for common programming multi-character combinations

[Download](https://github.com/tonsky/FiraCode)

### JetBrainsMono Nerd Font

Nerd Fonts are specialized fonts that include a wide range of icons and glyphs, making them ideal for developers and enthusiasts who require additional symbols in their terminal or code editor

[Download](https://www.nerdfonts.com/)

---

## Installing Zsh

Zsh, or Z Shell, is a powerful and highly customizable shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Here's how to install Zsh on your system:

```shell
sudo pacman -S zsh
```

### make ZSH the default shell

```bash
chsh -s $(which zsh)
```

then system asks for your password.
Important: Log out and log back in for this change to take effect.

#### Verify Installation

```bash
echo $SHELL          # Should show /usr/bin/zsh or similar
zsh --version        # Should show version number
```

---

### Backup any ZSH configurations you already may have

```bash
mv ~/.zshrc ~/.zshrc.bak
```

---

### create a new zsh config file and open it

```bash
touch ~/.zshrc
vim ~/.zshrc
```

---

## Config zinit plugin manager

in order to config zinit we first need to define the directory which we want to store zinit and its plugins in. add this line to your `~/.zshrc`

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

save the file and exit. in order to make sure everything is working correctly open a new terminal and run this command

```bash
zinit zstatus
```
