# Node.js & npm Installation Using NVM (Node Version Manager)

Node.js is a JavaScript runtime built on Chrome's V8 engine, and npm is the Node.js package manager. This guide explains how to install and manage Node.js versions **without using `pacman`**, using **NVM (Node Version Manager)** – the recommended method for development.

> **ℹ️ Note:** NVM is a per‑user, per‑shell version manager for Node.js. It works on any POSIX‑compliant shell (bash, zsh, dash, ksh) and is ideal for developers who need multiple Node versions.

---

## Table of Contents

- [Node.js \& npm Installation Using NVM (Node Version Manager)](#nodejs--npm-installation-using-nvm-node-version-manager)
  - [Table of Contents](#table-of-contents)
  - [1. Why NVM Instead of `pacman`?](#1-why-nvm-instead-of-pacman)
  - [2. Install NVM](#2-install-nvm)
    - [Using `curl`](#using-curl)
    - [Using `wget`](#using-wget)
  - [3. Verify NVM Installation](#3-verify-nvm-installation)
  - [4. Install Node.js](#4-install-nodejs)
    - [Install the latest LTS version (recommended for most users)](#install-the-latest-lts-version-recommended-for-most-users)
    - [Install the latest current (stable) release](#install-the-latest-current-stable-release)
    - [Install a specific version](#install-a-specific-version)
  - [5. Set Default Node Version](#5-set-default-node-version)
  - [6. Switching Node Versions](#6-switching-node-versions)
  - [7. Uninstalling a Node Version](#7-uninstalling-a-node-version)
  - [8. Using `.nvmrc` for Project‑Specific Versions](#8-using-nvmrc-for-projectspecific-versions)
  - [9. Updating NVM](#9-updating-nvm)
  - [10. Uninstalling NVM](#10-uninstalling-nvm)
  - [11. Troubleshooting](#11-troubleshooting)

---

## 1. Why NVM Instead of `pacman`?

| Issue with `pacman`                        | How NVM solves it                             |
| ------------------------------------------ | --------------------------------------------- |
| Installs Node.js system‑wide in `/usr/bin` | Installs per‑user, isolated                   |
| Global `npm install` requires `sudo`       | No `sudo` needed                              |
| Global packages mix with system files      | Packages go into isolated version directories |
| Major Node updates may break projects      | Switch versions instantly per project         |
| Only one Node version available            | Multiple versions side‑by‑side                |

Using NVM gives you full control over your Node.js environment without affecting the system.

---

## 2. Install NVM

Run the official installer using `curl` or `wget`:

### Using `curl`

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

### Using `wget`

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

The installer clones the NVM repository to `~/.nvm` and adds the necessary source lines to your shell profile (`~/.bashrc`, `~/.zshrc`, or `~/.profile`).

---

## 3. Verify NVM Installation

Reload your shell configuration:

```bash
source ~/.bashrc   # for Bash users
# or
source ~/.zshrc    # for Zsh users
```

Then check the NVM version:

```bash
nvm --version
```

You should see the version number (e.g., `0.40.4`).

> **💡 Tip:** If `nvm: command not found`, close and reopen your terminal.

---

## 4. Install Node.js

### Install the latest LTS version (recommended for most users)

```bash
nvm install --lts
```

### Install the latest current (stable) release

```bash
nvm install node
```

### Install a specific version

```bash
nvm install 20
nvm install 22
```

NVM downloads the pre‑compiled binary and sets up the version in `~/.nvm/versions/node/`.

---

## 5. Set Default Node Version

Define which Node version to use by default in new shells:

```bash
nvm alias default node          # use the latest installed current version
# or
nvm alias default --lts         # use the latest LTS
# or
nvm alias default 20            # pin to a specific version
```

Verify:

```bash
node --version
npm --version
```

---

## 6. Switching Node Versions

List all installed versions:

```bash
nvm ls
```

Switch to a different version (temporary – current shell only):

```bash
nvm use 20
```

To permanently switch the default, update the alias as shown above.

---

## 7. Uninstalling a Node Version

Remove a specific Node version:

```bash
nvm uninstall 20
```

To uninstall the active version, you must switch to another one first.

---

## 8. Using `.nvmrc` for Project‑Specific Versions

Create a file named `.nvmrc` in your project root containing the desired Node version:

```bash
echo "22" > .nvmrc
```

Then, inside that project directory, run:

```bash
nvm use
```

NVM will automatically switch to the version specified in `.nvmrc` (if it is installed). You can add `nvm use` to a script or simply run it manually.

> **💡 Tip:** Many editors (VS Code, Cursor) can be configured to run `nvm use` automatically when opening a terminal.

---

## 9. Updating NVM

NVM has a built‑in update command:

```bash
nvm install node --reinstall-packages-from=node
```

Or simply run the installation script again (it will update the existing installation):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

> **⚠️ Note:** Always check the [NVM releases page](https://github.com/nvm-sh/nvm/releases) for the latest version number.

---

## 10. Uninstalling NVM

To completely remove NVM:

1. Remove the `~/.nvm` directory:

   ```bash
   rm -rf ~/.nvm
   ```

2. Remove the NVM initialisation lines from your shell profile (`~/.bashrc`, `~/.zshrc`, etc.). Look for lines containing `nvm.sh` and delete them.

---

## 11. Troubleshooting

| Problem                                           | Solution                                                                                                      |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `nvm: command not found`                          | Restart your terminal or run `source ~/.bashrc` (or `~/.zshrc`). Ensure the installer completed successfully. |
| `curl: command not found`                         | Install `curl` with `sudo pacman -S curl`.                                                                    |
| `nvm install` fails with "Certificate error"      | Update your CA certificates: `sudo pacman -S ca-certificates ca-certificates-utils`.                          |
| Node version does not switch after `nvm use`      | Check that the version is installed (`nvm ls`). Run `nvm use` in the same shell where you installed it.       |
| Global packages not found after switching version | Global packages are installed per Node version. Reinstall them with `npm install -g` after switching.         |
| `nvm alias default` does not persist              | The alias is saved in `~/.nvm/alias/default`. Verify the file exists and contains the correct version.        |

Your Node.js environment is now flexible, safe, and ready for any project – without touching system packages.
