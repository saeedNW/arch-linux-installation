# Essential Applications Guide

In this guide, I'll walk you through the installation process of essential applications that I personally use and recommend for enhancing your daily workflow. Feel free to review and install the ones that best suit your needs. Let's dive in!

## Table of Contents

- [Essential Applications Guide](#essential-applications-guide)
  - [Table of Contents](#table-of-contents)
  - [Installing bat](#installing-bat)
  - [Installing exa](#installing-exa)
  - [Installing yt-dlp](#installing-yt-dlp)
  - [Installing python-spotdl](#installing-python-spotdl)
  - [Installing Git](#installing-git)
    - [Create SSH Key and Add it to GitHub](#create-ssh-key-and-add-it-to-github)
  - [Installing Zsh](#installing-zsh)
  - [Installing Oh My Zsh](#installing-oh-my-zsh)
    - [Installing Zsh Plugins: zsh-autosuggestions and zsh-syntax-highlighting](#installing-zsh-plugins-zsh-autosuggestions-and-zsh-syntax-highlighting)
      - [Prerequisites](#prerequisites)
      - [Installation](#installation)
        - [zsh-autosuggestions](#zsh-autosuggestions)
        - [zsh-syntax-highlighting](#zsh-syntax-highlighting)
      - [Enabling Plugins](#enabling-plugins)
    - [Custom Alias](#custom-alias)
  - [sshuttle VPN](#sshuttle-vpn)
  - [Installing LibreOffice](#installing-libreoffice)
  - [Installing GIMP](#installing-gimp)
    - [Change Gimp's look](#change-gimps-look)
  - [Installing VLC Media Player on Arch Linux](#installing-vlc-media-player-on-arch-linux)
  - [Installing qBittorrent](#installing-qbittorrent)
  - [Installing OBS Studio](#installing-obs-studio)
  - [Installing Kdenlive](#installing-kdenlive)
  - [Installing Discord](#installing-discord)
  - [Installing Telegram Desktop](#installing-telegram-desktop)
  - [Installing Redis](#installing-redis)
  - [Installing duf](#installing-duf)
  - [Installing lazygit](#installing-lazygit)
  - [Installing Docker](#installing-docker)
    - [Step 1: Install Required Packages](#step-1-install-required-packages)
    - [Step 2: Enable and Start Docker Service](#step-2-enable-and-start-docker-service)
    - [Step 3: Verify Docker Installation](#step-3-verify-docker-installation)
    - [Step 4: Manage Docker Without Sudo (Optional)](#step-4-manage-docker-without-sudo-optional)
    - [Step 5: Verify Docker Installation (Non-sudo)](#step-5-verify-docker-installation-non-sudo)
    - [Step 6: Test Docker Installation](#step-6-test-docker-installation)
  - [Installing Docker Compose](#installing-docker-compose)
    - [Step 1: Download Docker Compose Binary](#step-1-download-docker-compose-binary)
    - [Step 2: Verify Docker Compose Installation](#step-2-verify-docker-compose-installation)
  - [Installing CPUFetch](#installing-cpufetch)
  - [Installing Neofetch](#installing-neofetch)
  - [Installing gdu](#installing-gdu)
  - [Installing Droidcam](#installing-droidcam)
  - [Installing Google Chrome](#installing-google-chrome)
  - [Installing Visual Studio Code (VS Code)](#installing-visual-studio-code-vs-code)
    - [Recommended Plugins](#recommended-plugins)
    - [Custom Snippets](#custom-snippets)
    - [Theme](#theme)
    - [Custom Color Schema](#custom-color-schema)
    - [Custom Shortcuts](#custom-shortcuts)
    - [Recommended Settings](#recommended-settings)
  - [Installing Postman](#installing-postman)
  - [Installing WhatsApp Nativefier](#installing-whatsapp-nativefier)
  - [Installing RedisInsight](#installing-redisinsight)
  - [Installing Amberol Music Player](#installing-amberol-music-player)
  - [Installing nomacs Image Viewer](#installing-nomacs-image-viewer)
  - [Installing MongoDB-bin](#installing-mongodb-bin)
  - [Installing MongoDB Tools](#installing-mongodb-tools)
  - [Installing MongoDB Compass from AUR](#installing-mongodb-compass-from-aur)
  - [Installing HandBrake](#installing-handbrake)
  - [Installing DaVinci Resolve](#installing-davinci-resolve)
  - [Installing Albert Application Launcher](#installing-albert-application-launcher)
    - [Albert Recommended Configs](#albert-recommended-configs)
  - [Installing AnyDesk](#installing-anydesk)
  - [Installing Rclone \& Rclone Browser](#installing-rclone--rclone-browser)
  - [Installing uGet](#installing-uget)
    - [Install uGet](#install-uget)
    - [integration](#integration)
    - [Implant IDM categories structure](#implant-idm-categories-structure)
  - [Install Spot Player](#install-spot-player)
  - [Installing Flatpak](#installing-flatpak)
  - [Setting Up Timeshift for System Snapshots](#setting-up-timeshift-for-system-snapshots)

## Installing bat

`bat` is a modern alternative to the classic `cat` command, with syntax highlighting and Git integration. Here's how to install it on your Linux system:

1. **Update System Repositories**:

   Ensure your system's package repositories are up-to-date by running the following command in the terminal:

   ```bash
   sudo pacman -Syu
   ```

2. **Install bat**:

   You can install `bat` directly from the Arch Linux repositories using the following command:

   ```bash
   sudo pacman -S bat
   ```

3. **Verify Installation**:

   Once the installation is complete, you can verify that `bat` is installed correctly by checking its version:

   ```bash
   bat --version
   ```

## Installing exa

`exa` is a modern replacement for the traditional `ls` command, providing more features and a more visually appealing output. Here's how to install it on your system:

```bash
sudo pacman -S exa
```

Once installed, you can use `exa` just like you would use `ls`, but with additional features and options. For example, to list files and directories in the current directory, simply type:

```bash
exa
```

To see a detailed list including file sizes, permissions, and timestamps, use the `-l` flag:

```bash
exa -l
```

To display hidden files, use the `-a` flag:

```bash
exa -a
```

`exa` provides many more options and features. You can explore them further by checking out the official documentation or by running `exa --help` in your terminal.

## Installing yt-dlp

`yt-dlp` is a command-line program to download videos from YouTube and other video platforms. It's an enhanced version of `youtube-dl` with additional features and improvements. Here's how to install it on your system:

```bash
sudo pacman -S yt-dlp
```

Once installed, you can use `yt-dlp` to download videos by providing the video URL as an argument. For example:

```bash
yt-dlp https://www.youtube.com/watch?v=your_video_id
```

This command will download the video specified by the URL to your current directory.

`yt-dlp` offers many options and features for customizing your downloads. You can explore these options further by running `yt-dlp --help` in your terminal or by checking out the official documentation.

## Installing python-spotdl

python-spotdl is a command-line tool that allows you to download music from various streaming platforms such as Spotify. Here's how to install python-spotdl:

```bash
paru -S python-spotdl
```

## Installing Git

Git is a widely-used version control system that allows you to manage and track changes to your codebase efficiently. Here's how to install Git on your Linux system:

1. **Install Git**:

   Git is available in the Arch Linux repositories. You can install it using the following command:

   ```bash
   sudo pacman -S git
   ```

2. **Verify Installation**:

   Once the installation is complete, you can verify that Git is installed correctly by checking its version:

   ```bash
   git --version
   ```

3. **Configure Git**:

   - Sets your name as the global user identity in Git.

   ```bash
   git config --global user.name "Your Name"
   ```

   - Sets your email address as the global user identity in Git.

   ```bash
   git config --global user.email "your.email@example.com"
   ```

   - Configures line endings to be converted to LF on input.

   ```bash
   git config --global core.autocrlf "input"
   ```

   - Configures Git to use 'bat' command as the default pager for displaying output.

   ```bash
   git config --global core.pager "bat"
   ```

   - Sets the default branch name to 'main' when initializing new repositories.

   ```bash
   git config --global init.defaultBranch "main"
   ```

   - Configures Git to always create a merge commit when merging, even if the merge could be resolved with a fast-forward.

   ```bash
   git config --global merg.ff "--no-ff"
   ```

   - Configures Git to perform a merge when pulling changes instead of rebasing.

   ```bash
   git config --global pull.rebase "false"
   ```

   - Sets Visual Studio Code as the default text editor for Git, allowing you to edit commit messages and other text files within Git using VS Code. The `--wait` flag ensures that Git waits for the editor to close before proceeding.

   ```bash
   git config --global core.editor "code --wait"
   ```

### Create SSH Key and Add it to GitHub

This step has been excerpted from the [GitHub documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). For a more comprehensive guide, please refer to the documentation provided.

1. Generating a new SSH key:

   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

   Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

   ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   This creates a new SSH key, using the provided email as a label.

2. Adding your SSH key to the ssh-agent:

   1. Start the ssh-agent in the background:

      ```bash
      eval "$(ssh-agent -s)"
      # output Ex. => Agent pid 59566
      ```

   2. Add your SSH private key to the ssh-agent:

      ```bash
      ssh-add ~/.ssh/id_ed25519
      ```

3. Use the `cat` command to display your public key:

```bash
cat path/to/ssh/public/key
```

After copying it, navigate to your GitHub account settings and add the new SSH key to your account.

## Installing Zsh

Zsh, or Z Shell, is a powerful and highly customizable shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Here's how to install Zsh on your system:

```bash
sudo pacman -S zsh
```

## Installing Oh My Zsh

Oh My Zsh is a delightful, open-source, community-driven framework for managing your Zsh configuration. It comes bundled with a vast number of helpful functions, plugins, and themes to enhance your command-line experience. Here's how to install Oh My Zsh on your system:

You can install Oh My Zsh by running the following command in your terminal:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Alternatively, if you prefer using `wget`:

```bash
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

During Installation process of Oh My Zsh you will be prompted to set `zsh` as your main shell choose yes.

### Installing Zsh Plugins: zsh-autosuggestions and zsh-syntax-highlighting

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) are popular plugins for Zsh that enhance your command-line experience by providing autosuggestions as you type and syntax highlighting for commands, respectively. Here's how to install them:

#### Prerequisites

Ensure that you have Zsh and Oh My Zsh installed on your system. If not, refer to the previous guide on installing Oh My Zsh.

#### Installation

##### zsh-autosuggestions

1. Clone the zsh-autosuggestions repository into the Oh My Zsh plugins directory:

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
   ```

2. Activate the plugin by adding it to the list of plugins in your `~/.zshrc` configuration file:

   ```bash
   plugins=(zsh-autosuggestions)
   ```

##### zsh-syntax-highlighting

1. Clone the zsh-syntax-highlighting repository into the Oh My Zsh plugins directory:

   ```bash
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
   ```

2. Activate the plugin by adding it to the list of plugins in your `~/.zshrc` configuration file:

   ```bash
   plugins=(zsh-syntax-highlighting)
   ```

#### Enabling Plugins

After adding the plugins to your `~/.zshrc` file, reload the Zsh configuration:

```bash
source ~/.zshrc
```

### Custom Alias

Here's a simple guide on how to create a `~/.zprofile` file, define some alias in it, and then add it to your `~/.zshrc` file:

1. **Create `~/.zprofile` file:**

   - Open your terminal.
   - Navigate to your home directory by typing: `cd ~`.
   - Use a text editor of your choice to create the `~/.zprofile` file. For example, you can use nano by typing: `nano ~/.zprofile`.

2. **Define alias in `~/.zprofile`:**

   - Inside the `~/.zprofile` file, you can define aliases using the following syntax:

     ```bash
     alias alias_name='command_to_execute'
     ```

     Replace `alias_name` with the name you want to give to your alias, and `command_to_execute` with the command you want the alias to execute.

   - For example, you can add the following aliases to the `~/.zprofile`:

     - Replace `ls` command with `exa` command:

       ```bash
       alias ls='exa'
       ```

     - Replace `cat` command with `bat` command:

       ```bash
       alias cat='bat'
       ```

     - Create a new alias for `yt-dlp` command:

       ```bash
       alias ytdl='yt-dlp'
       ```

     - Create a new alias for `spotdl` command:

       ```bash
       alias spdl='spotdl'
       ```

3. **Save and exit the `~/.zprofile` file:**

   - If you're using nano, you can save and exit the file by pressing `Ctrl + X`, then type `Y` to confirm saving, and press `Enter` to exit.

4. **Add `~/.zprofile` to `~/.zshrc`:**

   - Open your `~/.zshrc` file in a text editor. You can do this by typing: `nano ~/.zshrc`.
   - Add the following line at the end of the file to ensure that your `~/.zprofile` file is sourced when you start a new shell session:

     ```bash
     source ~/.zprofile
     ```

   - Save and exit the `~/.zshrc` file (if you're using nano, press `Ctrl + X`, then type `Y` to confirm saving, and press `Enter` to exit).

5. **Apply changes:**

   - After saving both `~/.zprofile` and `~/.zshrc` files, you can either restart your terminal or source your `~/.zshrc` file to apply the changes immediately:

     ```bash
     source ~/.zshrc
     ```

Now your alias defined in `~/.zprofile` will be available every time you start a new shell session, and it will be automatically loaded from your `~/.zshrc` file.

## sshuttle VPN

If you're looking to establish a VPN connection using an SSH tunnel, sshuttle is a handy tool for the job. Alternatively, you can configure an OpenVPN connection using your system's network manager.

```bash
sudo pacman -S openssh
```

Installs the OpenSSH package, which is required for SSH tunneling.

```bash
sudo pacman -S sshuttle
```

Installs sshuttle, a tool for creating VPN connections through SSH tunnels.

```bash
sshuttle --dns -vr <user>@<server_ip>:<server ssh port> 0/0
```

Establishes an SSH tunnel VPN connection to the specified server, redirecting all traffic through it while maintaining DNS resolution. Replace `<user>`, `<server_ip>`, and `<server ssh port>` with your server's credentials.

## Installing LibreOffice

LibreOffice is a stable version of the popular open-source office suite. Follow these steps to install it on your system:

```bash
sudo pacman -S libreoffice-still
```

This command installs the LibreOffice-Still package from the official Arch Linux repositories. Once installed, you can launch LibreOffice-Still from your system's application menu.

## Installing GIMP

GIMP (GNU Image Manipulation Program) is a powerful open-source image editing software. Follow these steps to install it on your system:

```bash
sudo pacman -S gimp
```

This command installs the GIMP package from the official Arch Linux repositories. Once installed, you can launch GIMP from your system's application menu.

### Change Gimp's look

By following the instructions outlined in the [Diolinux/PhotoGIMP](https://github.com/Diolinux/PhotoGIMP) GitHub repository, you can customize the appearance of GIMP to closely resemble that of Photoshop.

## Installing VLC Media Player on Arch Linux

VLC Media Player is a versatile multimedia player that supports various audio and video formats, as well as streaming protocols. Here's how to install VLC on your Linux system:

```bash
sudo pacman -S vlc
```

This command installs the vlc package from the official Arch Linux repositories. Once installed, you can launch vlc from your system's application menu.

## Installing qBittorrent

qBittorrent is a popular open-source BitTorrent client. Follow these steps to install it on your system:

```bash
sudo pacman -S qbittorrent
```

This command installs the qBittorrent package from the official Arch Linux repositories. Once installed, you can launch qBittorrent from your system's application menu.

## Installing OBS Studio

OBS Studio is a powerful and feature-rich software for video recording and live streaming. Here's how to install it on your system:

```bash
sudo pacman -S obs-studio
```

This command installs the OBS Studio package from the official Arch Linux repositories. Once installed, you can launch OBS Studio from your system's application menu and start recording or streaming your content.

## Installing Kdenlive

Kdenlive is a popular open-source video editing software that provides a comprehensive set of features for editing videos. Here's how to install it on your system:

```bash
sudo pacman -S kdenlive
```

This command installs the Kdenlive package from the official Arch Linux repositories. Once installed, you can launch Kdenlive from your system's application menu and start editing your videos with its intuitive interface and powerful editing tools.

## Installing Discord

Discord is a popular communication platform that offers text, voice, and video chat services. Here's how to install Discord on your system:

```bash
sudo pacman -S discord
```

This command installs the discord package from the official Arch Linux repositories. Once installed, you can follow the on-screen instructions to set up Discord and customize your profile. Once set up, you can join servers, chat with friends, and participate in voice and video calls using Discord.

## Installing Telegram Desktop

Telegram Desktop is a popular messaging application that allows you to securely communicate with others via text, voice, and video calls. Here's how to install it on your system:

```bash
sudo pacman -S telegram-desktop
```

This command installs the Telegram Desktop package from the official Arch Linux repositories. Once installed, you can launch Telegram Desktop from your system's application menu and start using it to connect with your contacts and groups on the Telegram platform.

## Installing Redis

Redis is an open-source, in-memory data structure store used as a database, cache, and message broker. Here's how to install it on your system:

```bash
sudo pacman -S redis
```

This command installs the Redis package from the official Arch Linux repositories. Once installed, you can start and enable the Redis service using the following commands:

```bash
sudo systemctl start redis
sudo systemctl enable redis
```

You can also configure Redis by editing its configuration file located at `/etc/redis.conf`. After making any changes, remember to restart the Redis service for the changes to take effect:

```bash
sudo systemctl restart redis
```

Redis is now installed and ready to use on your system. You can interact with Redis using its command-line interface `redis-cli` or by integrating it into your applications.

## Installing duf

`duf` is a modern replacement for the traditional `df` command, offering enhanced features and a more user-friendly interface for disk usage analysis. Here's how to install it on your system:

```bash
sudo pacman -S duf
```

Once installed, you can use `duf` to quickly and easily check disk usage information. For example, to display disk usage for all mounted filesystems, simply type:

```bash
duf
```

You can also specify a specific directory or filesystem to analyze. For instance, to check disk usage for the `/home` directory, use:

```bash
duf /home
```

Additionally, `duf` provides various options and flags for customizing its output. To explore these options, you can run `duf --help` in your terminal.

With `duf`, managing disk space and analyzing storage usage becomes more intuitive and efficient.

## Installing lazygit

`lazygit` is a simple terminal-based UI for Git commands, designed to make the process of interacting with Git repositories more intuitive and efficient. Here's how to install it on your system:

```bash
sudo pacman -S lazygit
```

Once installed, you can launch `lazygit` by simply typing `lazygit` in your terminal. This will open up the terminal UI where you can navigate through your Git repositories, view changes, stage files, commit changes, and perform other Git operations with ease.

`lazygit` offers a variety of keyboard shortcuts and features to streamline your Git workflow. You can explore these features further within the `lazygit` interface or by referring to the official documentation.

## Installing Docker

Docker is a platform for developing, shipping, and running applications inside containers. Follow these steps to install Docker on your system:

### Step 1: Install Required Packages

```bash
sudo pacman -S docker
```

This command installs the Docker package, which includes the Docker daemon and command-line tools.

### Step 2: Enable and Start Docker Service

```bash
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

Enabling and starting the Docker service ensures that Docker starts automatically upon system boot and is currently running.

### Step 3: Verify Docker Installation

```bash
sudo docker --version
```

This command verifies that Docker has been successfully installed on your system by displaying the installed Docker version.

### Step 4: Manage Docker Without Sudo (Optional)

To avoid using `sudo` every time you run a Docker command, you can add your user to the `docker` group:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

### Step 5: Verify Docker Installation (Non-sudo)

```bash
docker --version
```

After adding your user to the `docker` group, you can verify the Docker installation again without using `sudo`.

### Step 6: Test Docker Installation

You can verify that Docker is working correctly by running a simple test container:

```bash
docker run hello-world
```

This command downloads a test image, creates a container from it, and runs it. If everything is set up correctly, you should see a message indicating that Docker is running and configured correctly.

## Installing Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It uses YAML files to configure the application's services and dependencies. Follow these steps to install Docker Compose on your system:

### Step 1: Download Docker Compose Binary

```bash
sudo pacman -S docker-compose
```

This command installs the Docker Compose package from the official package repositories.

### Step 2: Verify Docker Compose Installation

```bash
docker-compose --version
```

This command verifies that Docker Compose has been successfully installed on your system by displaying the installed version.

## Installing CPUFetch

CPUFetch is a simple yet effective command-line tool that displays detailed information about your CPU. It provides a quick overview of your CPU's architecture, model, and various other details. Here's how you can install CPUFetch on your system:

```bash
sudo pacman -S cpufetch
```

## Installing Neofetch

Neofetch is a command-line tool that displays system information in a visually appealing way. It shows details such as your operating system, kernel version, CPU, GPU, memory usage, and more. Here's how to install Neofetch on your system:

```bash
sudo pacman -S neofetch
```

## Installing gdu

gdu (Go Disk Usage) is a command-line disk usage analyzer written in Go. It provides a fast and efficient way to visualize disk usage on your system. Here's how to install gdu:

```bash
sudo pacman -S gdu
```

## Installing Droidcam

Droidcam is a tool that allows you to use your Android device as a webcam for your computer. Here's how to install it from the Arch User Repository (AUR):

```bash
paru -S droidcam
```

## Installing Google Chrome

Google Chrome is a popular web browser developed by Google. You can install Google Chrome on Arch Linux using the Arch User Repository (AUR). Here's how:

```bash
paru -S google-chrome
```

## Installing Visual Studio Code (VS Code)

Visual Studio Code is a popular source-code editor developed by Microsoft. The `visual-studio-code-bin` package available on the Arch User Repository (AUR). Here's how to do it:

```bash
paru -S visual-studio-code-bin
```

### Recommended Plugins

| Plugin Name                    | Plugin Name                     | Plugin Name               | Plugin Name                    | Plugin Name                              | Plugin Name                |
| ------------------------------ | ------------------------------- | ------------------------- | ------------------------------ | ---------------------------------------- | -------------------------- |
| Git lens                       | Git Graph                       | HTML CSS Support          | Ignore files                   | Atom Material Icons                      | Bash Beautify              |
| Bash IDE                       | Docker                          | better comments           | EJS language support           | GraphQL                                  | Turbo Console Log          |
| Log File Highlighter           | Markdown Table                  | Markdown Table Prettifier | Material Theme                 | Rainbow Brackets                         | CodeSnap                   |
| JavaScript (ES6) code snippets | node-snippets                   | REST Client               | Vscode NestJs Snippets         | YAML                                     | advanced-new-file          |
| Nested Comments                | Prettier                        | Auto Rename Tag           | Code Spell Checker             | Markdown All in One                      | Auto-Open Markdown Preview |
| Azura Repos                    | Dev Containers                  | better folding            | Draw.io Integration            | Error Lens                               | ESLint                     |
| Explorer Exclude               | GitHub Repositories             | Import Cost               | JavaScript (ES6) code snippets | lazygit                                  | Live Server                |
| Markdownlint                   | Markdown Preview Github Styling | node-snippets             | Postman                        | Pretty TypeScript Errors                 | Project Manager            |
| python                         | Python Debugger                 | Random Everything         | Remote - SSH                   | Remote -SSH: Editing Configuration Files | Remote - Tunnels           |
| Remote Development             | Remote Explorer                 | Remote Repositories       | REST Client                    | Test Adapter Converter                   | Thunder Client             |
| Todo Tree                      | Toggle Quotes                   | vscode-proto3             |                                |                                          |                            |

### Custom Snippets

```json
{
	"Node Class Method": {
		"prefix": "ncm",
		"body": [
			"/**",
			"* $1",
			"* @param req express request",
			"* @param res express response",
			"* @param next express next function",
			"* @returns {Promise<void>}",
			"*/",
			"async $2(req, res, next) {",
			"\ttry {",
			"\t\t$3",
			"\t} catch (err) {",
			"\t\tnext(err);",
			"\t}",
			"}"
		],
		"description": "Node.js Controller Method"
	}
}
```

```json
{
	"Simple try/catch Block": {
		"prefix": "tc",
		"body": ["try {", "\t$2", "} catch (err) {", "\t$1", "}"],
		"description": "Simple try/catch block"
	}
}
```

```json
{
	"Simple try/catch/log Block": {
		"prefix": "tcl",
		"body": ["try {", "\t$1", "} catch (err) {", "\tconsole.error(err);", "}"],
		"description": "Simple try/catch/log block"
	}
}
```

```json
{
	"Node try/catch/next Block": {
		"prefix": "tcn",
		"body": ["try {", "\t$1", "} catch (err) {", "\tnext(err);", "}"],
		"description": "Node try/catch/next block"
	}
}
```

```json
{
	"Async Function": {
		"prefix": "asf",
		"body": ["async function $1($2) {", "\t$3", "}"],
		"description": "Async function"
	}
}
```

```json
{
	"Test describe Block": {
		"prefix": "desc",
		"body": ["/** $1 */", "describe('$2', function () {", "\t$3", "});"],
		"description": "Inserts describe() block"
	}
}
```

```json
{
	"Test it Block": {
		"prefix": "it",
		"body": [
			"/**",
			"* $1",
			"*/",
			"it('$2', async function () {",
			"\t$3",
			"});"
		],
		"description": "Inserts it() block"
	}
}
```

```json
{
	"Node Class Controller": {
		"prefix": "nodeclass",
		"body": [
			"/** import main controller */",
			"const Controller = require(\"$1\");",
			"/** import http status codes module */",
			"const httpStatus = require(\"http-status-codes\");\n",
			"/**",
			"* @class $2",
			"*/",
			"class $2 extends Controller {",
			"\t$3",
			"}\n",
			"module.exports = {",
			"\t$2: new $2()",
			"}"
		],
		"description": "node js node js controller class"
	}
}
```

```json
{
"Express Router": {
		"prefix": "erouter",
		"body": [
			"/** import express module */",
			"const express = require('express');",
			"/** create express Router instance */",
			"const $1 = express.Router();\n",
			"$2\n"
			"/** export router */",
			"module.exports = {",
				"\t$1",
			"}"
		],
		"description": "generat express router"
	},
}
```

```json
{
	"Multi-line Comment": {
		"prefix": "mcom",
		"body": ["/**", "* $1", "*/"],
		"description": "create multi-line comment"
	},
	"Single-line Comment": {
		"prefix": "scom",
		"body": ["/** $1 */"],
		"description": "create single-line comment"
	},
	"Single-line Comment With Brake": {
		"prefix": "scome",
		"body": ["/** $1 */\n"],
		"description": "create single-line comment with brake"
	}
}
```

### Theme

- Material Theme Ocean

### Custom Color Schema

```json
{
	"editor.tokenColorCustomizations": {
		"textMateRules": [
			{
				"name": "string color",
				"scope": ["string"],
				"settings": {
					"foreground": "#fdee00" // change this COLOR
				}
			},
			{
				"name": "variable color",
				"scope": ["variable"],
				"settings": {
					"foreground": "#ffffee" // change this COLOR
				}
			},
			{
				"name": "property color",
				"scope": [
					"variable.other.constant.property",
					"variable.other.property"
				],
				"settings": {
					"foreground": "#9c9594" // change this COLOR
				}
			},
			{
				"name": "parameter color",
				"scope": ["variable.parameter"],
				"settings": {
					"foreground": "#ffd390" // change this COLOR
				}
			},
			{
				"name": "jsdoc color",
				"scope": ["variable.other.jsdoc"],
				"settings": {
					"foreground": "#ACE1AF" // change this COLOR
				}
			}
		]
	}
}
```

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
		"key": "ctrl+shift+q",
		"command": "workbench.files.action.collapseExplorerFolders"
	},

	//? ***** START: Focus management *****
	{
		"key": "ctrl+k ctrl+up",
		"command": "-workbench.action.focusAboveGroup"
	},
	{
		"key": "ctrl+shift+c ctrl+shift+up",
		"command": "workbench.action.focusAboveGroup"
	},

	{
		"key": "ctrl+k ctrl+down",
		"command": "-workbench.action.focusBelowGroup"
	},
	{
		"key": "ctrl+shift+c ctrl+shift+down",
		"command": "workbench.action.focusBelowGroup"
	},

	{
		"key": "ctrl+k ctrl+left",
		"command": "-workbench.action.focusLeftGroup"
	},
	{
		"key": "ctrl+shift+c ctrl+shift+left",
		"command": "workbench.action.focusLeftGroup"
	},

	{
		"key": "ctrl+k ctrl+right",
		"command": "-workbench.action.focusRightGroup"
	},
	{
		"key": "ctrl+shift+c ctrl+shift+right",
		"command": "workbench.action.focusRightGroup"
	}
]
```

### Recommended Settings

```json
{
	/**** START: General ***********/
	"files.autoSave": "afterDelay",
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],
	"explorer.compactFolders": false,
	"explorer.autoReveal": false,
	/*********** END: General ****/

	/**** START: Workbench ***********/
	"workbench.iconTheme": "a-file-icon-vscode",
	"workbench.productIconTheme": "a-file-icon-vscode-product-icon-theme",
	"workbench.colorCustomizations": {
		"[Material Theme Ocean]": {}
	},
	"workbench.colorTheme": "Material Theme Ocean",
	/*********** END: Workbench ****/

	/**** START: Git ***********/
	"git.autofetch": true,
	/*********** END: Git ****/

	/**** START: Editor ***********/
	"editor.fontLigatures": true,
	"editor.mouseWheelZoom": true,
	"editor.formatOnType": true,
	"editor.formatOnPaste": true,
	"editor.insertSpaces": false,
	"editor.lineHeight": 2,
	"editor.tabSize": 4,
	"editor.fontFamily": "'Fira Code', monospace",
	"editor.indentSize": "tabSize",
	"editor.wordBasedSuggestions": "matchingDocuments",
	/*********** END: Editor ****/

	/**** START: Prettier ***********/
	"prettier.useTabs": true,
	"prettier.endOfLine": "auto"
	/*********** END: Prettier ****/
}
```

## Installing Postman

Postman is a popular collaboration platform for API development, used by developers worldwide. The `postman-bin` package available on the Arch User Repository (AUR). Here's how to do it:

```bash
paru -S postman-bin
```

## Installing WhatsApp Nativefier

WhatsApp Nativefier is a wrapper application that allows you to run WhatsApp Web as a standalone desktop application on your Linux system. Here's how you can install it:

```bash
paru -S whatsapp-nativefier
```

## Installing RedisInsight

RedisInsight is a graphical user interface (GUI) for managing Redis databases. It provides a user-friendly interface to interact with your Redis instances. Here's how you can install RedisInsight:

```bash
paru -S redisinsight
```

## Installing Amberol Music Player

Amberol Music Player is a lightweight and customizable music player designed for simplicity and ease of use. You can install Amberol Music Player using the Arch User Repository (AUR). Here's how:

```bash
paru -S amberol
```

## Installing nomacs Image Viewer

nomacs is a free, open-source image viewer that supports multiple platforms, including Linux. You can install nomacs using the Arch User Repository (AUR). Here's how:

```bash
paru -S nomacs
```

## Installing MongoDB-bin

MongoDB-bin is the binary distribution of MongoDB, a popular NoSQL database management system. Here's how to install MongoDB-bin on your system:

1. **Install MongoDB-bin Package**:

   Open your terminal and use the following pacman command to install the MongoDB-bin package:

   ```bash
   paru -S mongodb-bin
   ```

2. **Start MongoDB Service**:

   After the installation is complete, start the MongoDB service using the following systemctl command:

   ```bash
   sudo systemctl start mongodb
   ```

3. **Enable MongoDB Service**:

   If you want MongoDB to start automatically at boot, enable the MongoDB service using the systemctl enable command:

   ```bash
   sudo systemctl enable mongodb
   ```

4. **Verify Installation**:

   To verify that MongoDB is running, you can check its status using the systemctl status command:

   ```bash
   sudo systemctl status mongodb
   ```

## Installing MongoDB Tools

MongoDB Tools is a set of command-line utilities for working with MongoDB instances. Here's how to install MongoDB Tools on your Arch Linux system:

1. **Install MongoDB Tools Package**:

   Open your terminal and use the following paru command to install the MongoDB Tools package:

   ```bash
   paru -S mongodb-tools
   ```

2. **Verify Installation**:

   To verify that MongoDB Tools is installed correctly, you can check the version of the installed tools using the following command:

   ```bash
   mongodump --version
   ```

   This command should display the version information for mongodump, indicating that MongoDB Tools is installed.

3. **Explore MongoDB Tools**:

   MongoDB Tools includes various utilities such as mongodump, mongorestore, mongoexport, mongoimport, and mongotop. You can explore these tools and their usage by running them in your terminal with the --help option:

   ```bash
   mongodump --help
   mongorestore --help
   mongoexport --help
   mongoimport --help
   mongotop --help
   ```

   This will display usage information for each tool, allowing you to understand their functionality and options.

## Installing MongoDB Compass from AUR

MongoDB Compass is a graphical user interface (GUI) for MongoDB. It allows you to visually explore your data, run ad hoc queries, and interact with your MongoDB databases. Here's how to install MongoDB Compass on your Linux system using the AUR (Arch User Repository):

```bash
paru -S mongodb-compass
```

## Installing HandBrake

HandBrake is an open-source video transcoder that allows you to convert video files into various formats. Here's how to install HandBrake on Arch Linux using the official repositories:

```bash
sudo pacman -S handbrake
```

## Installing DaVinci Resolve

DaVinci Resolve is a professional video editing software with advanced features for color correction, visual effects, and audio post-production. Here's how to install DaVinci Resolve on Arch Linux:

```bash
paru -S davinci-resolve
```

## Installing Albert Application Launcher

Albert is a fast and flexible application launcher for Linux systems. It allows you to quickly search and launch applications, files, and perform web searches right from your desktop. Here's how to install Albert on your Linux system:

```bash
paru -S albert
```

**Note:** Add Albert to your system startup applications

### Albert Recommended Configs

![Alt text](./images/20230505135607.png)

![Alt text](./images/20231216110803.png)

![Alt text](./images/20231216110858.png)

![Alt text](./images/20240209224715.png)

## Installing AnyDesk

AnyDesk is a remote desktop application that allows users to access and control computers remotely. It is available in the Arch Linux User Repository (AUR). Here's how to install AnyDesk on your Linux system:

```bash
paru -S anydesk-bin
```

## Installing Rclone & Rclone Browser

Rclone is a command-line program to manage files on cloud storage services and remote servers. Here's how to install Rclone on your Linux system:

1. **Install Rclone**:

   Rclone is available in the Arch Linux repositories. You can install it using the following command:

   ```bash
   sudo pacman -S rclone
   ```

2. **Install Rclone Browser**:

   Simple cross platform GUI for rclone command line tool. You can install Rclone Browser using the Arch User Repository (AUR). Here's how:

   ```bash
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

## Installing uGet

uGet is a lightweight and customizable download manager for Linux. It supports multi-threaded downloading, pause and resume functionality, and integration with various web browsers. Here's how to install uGet on your Arch Linux system:

### Install uGet

uGet is available in the Arch Linux repositories. You can install it using the package manager, `pacman`:

```bash
sudo pacman -S uget
```

### integration

"uGet offers a range of plugins to augment its capabilities, allowing users to tailor their experience to their specific needs. For instance, if you wish to integrate uGet with your Linux system, you have two options. You can either refer to the instructions provided in the [ugetdm/uget-extension](https://github.com/ugetdm/uget-extension) GitHub repository directly or follow the steps outlined below, which have been extracted from the aforementioned repository:"

1. Install `uget-integrator` packages:

   ```bash
   paru -S uget-integrator-chrome uget-integrator-chromium uget-integrator-opera uget-integrator-firefox
   ```

2. Install `uget-extension` on your browser and restart the browser:

   - [Google Chrome, Chromium & Vivaldi](https://chrome.google.com/webstore/detail/uget-integration/efjgjleilhflffpbnkaofpmdnajdpepi)
   - [Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/ugetintegration/)
   - [Opera](https://addons.opera.com/en/extensions/details/uget-integration)

### Implant IDM categories structure

uGet's notable advantage lies in its ability to emulate the familiar structure of the popular IDM (Internet Download Manager) application. To replicate IDM's structure within uGet, you can follow the steps below:

1. Open `categories` window and select “new category”
2. config categories like the table bellow (Replace `username` in `directories` with your actual username)

   | Category name        | Compressed                                      | Documents                          | Musics                                 | Programs                          | Videos                                                                 |
   | -------------------- | ----------------------------------------------- | ---------------------------------- | -------------------------------------- | --------------------------------- | ---------------------------------------------------------------------- |
   | Active downloads     | 1                                               | 1                                  | 1                                      | 1                                 | 1                                                                      |
   | Capacity of finished | 99999                                           | 99999                              | 99999                                  | 99999                             | 99999                                                                  |
   | Capacity of recycled | 99999                                           | 99999                              | 99999                                  | 99999                             | 99999                                                                  |
   | Matched types        | zip;rar;r0*;r1*;arj;gz;sit;sitx;sea;ace;bz2;7z; | doc;pdf;ppt;pps;docx;pptx          | mp3;wav;wma;mpa;ram;ra;aac;aif;m4a;tsa | Exe;msi;deb                       | avi;mpg;mpe;mpeg;asf;wmv;mov;qt;rm;mp4;flv;m4v;webm;ogv;ogg;mkv;ts;tsv |
   | directories          | /home/username/Downloads/Compressed             | /home/username/Downloads/Documents | /home/username/Downloads/Musics        | /home/username/Downloads/Programs | /home/username/Downloads/Videos                                        |

## Install Spot Player

Spot Player is a versatile multimedia player designed to enhance security measures by offering features such as lock functionality to prevent unauthorized copying and recording. Developed by an Iranian team, this program also provides detailed statistics on played videos. Its primary aim is to safeguard online courses against unauthorized duplication and distribution. In order to install this application on linux you have to use `wine`. Here's how to install Spot Player:

1. **Navigate to the `~/Downloads` directory:**

   ```bash
   cd ~/Downloads
   ```

2. **Download Spot Player installer:**

   ```bash
   wget https://app.spotplayer.ir/assets/bin/spotplayer/setup.exe
   ```

   Once the download process is over you can install application using `wine` application installer.

## Installing Flatpak

Flatpak is a universal packaging format that allows developers to distribute applications for Linux systems. It provides a sandbox environment for applications, ensuring better security and compatibility across different distributions. Here's how to install Flatpak on your Arch Linux system:

1. **Install Flatpak**:

   Flatpak is available in the Arch Linux repositories. You can install it using the package manager, `pacman`:

   ```bash
   sudo pacman -S flatpak
   ```

2. **Add Flathub Repository**:

   Flathub is the official repository for Flatpak applications. You need to add it to your system to install Flatpak applications from Flathub. Run the following command to add the Flathub repository:

   ```bash
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   ```

3. **Restart Your System**:

   After installing Flatpak and adding the Flathub repository, it's a good idea to restart your system to ensure that the changes take effect.

   ```bash
   sudo reboot
   ```

## Setting Up Timeshift for System Snapshots

Timeshift is a powerful tool for creating system snapshots on Linux, allowing you to easily restore your system to a previous state if needed. Here's how to set it up:

1. **Install Timeshift**:

   First, install Timeshift from the AUR repository:

   ```bash
   paru -S timeshift
   ```

2. **Enable Cronie Service**:

   Timeshift uses cron jobs to schedule automatic snapshots. Enable and start the `cronie` service:

   ```bash
   sudo systemctl enable --now cronie.service
   ```

3. **Configure Timeshift**:

   Launch Timeshift and configure it to use BTRFS as the snapshot backend. Create the first snapshot to capture the current system state.

4. **Automatic Snapshots**:

   Install `timeshift-autosnap` to automatically create snapshots before system updates:

   ```bash
   paru -S timeshift-autosnap
   ```

5. **Configure GRUB for BTRFS**:

   To boot from a BTRFS snapshot, install `grub-btrfs` and regenerate the GRUB configuration:

   ```bash
   sudo pacman -S grub-btrfs
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

6. **Enable GRUB-BTRFS Daemon**:

   Enable and start the `grub-btrfsd` daemon:

   ```bash
   sudo systemctl enable --now grub-btrfsd
   ```

With Timeshift configured and automatic snapshots in place, you can rest assured knowing that your system is protected and can be easily restored to a previous state if necessary.
