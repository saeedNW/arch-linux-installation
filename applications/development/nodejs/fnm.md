# Node.js & npm Installation Using fnm (Fast Node Manager)

Node.js is a JavaScript runtime built on Chrome's V8 engine, and npm is the default package manager for Node.js. This guide explains how to install and manage multiple Node.js versions on **Arch Linux** using **fnm (Fast Node Manager)**.

> **ℹ️ Note:** fnm (Fast Node Manager) is a lightweight, high-performance Node.js version manager written in Rust. It is fully compatible with `.nvmrc` files, making it an excellent replacement for NVM while offering much faster startup times.

---

## Table of Contents

- [Node.js \& npm Installation Using fnm (Fast Node Manager)](#nodejs--npm-installation-using-fnm-fast-node-manager)
  - [Table of Contents](#table-of-contents)
  - [1. Why fnm Instead of `pacman`?](#1-why-fnm-instead-of-pacman)
  - [2. Install fnm](#2-install-fnm)
  - [3. Configure Your Shell](#3-configure-your-shell)
    - [Zsh](#zsh)
    - [Bash](#bash)
  - [4. Verify Installation](#4-verify-installation)
  - [5. Install Node.js](#5-install-nodejs)
    - [Install the latest LTS release (recommended)](#install-the-latest-lts-release-recommended)
    - [Install the latest current release](#install-the-latest-current-release)
    - [Install a specific version](#install-a-specific-version)
  - [6. Set the Default Node Version](#6-set-the-default-node-version)
  - [7. Switching Node Versions](#7-switching-node-versions)
  - [8. Using `.node-version` or `.nvmrc`](#8-using-node-version-or-nvmrc)
  - [9. Updating Node.js](#9-updating-nodejs)
  - [10. Updating fnm](#10-updating-fnm)
  - [11. Uninstalling Node Versions](#11-uninstalling-node-versions)
  - [12. Uninstalling fnm](#12-uninstalling-fnm)
  - [13. Corepack (Recommended)](#13-corepack-recommended)
  - [14. Troubleshooting](#14-troubleshooting)

---

## 1. Why fnm Instead of `pacman`?

| Using `pacman`                                  | Using `fnm`                                              |
| ----------------------------------------------- | -------------------------------------------------------- |
| One system-wide Node installation               | Multiple Node versions side-by-side                      |
| Updating Node updates the whole system          | Update only the versions you want                        |
| Hard to maintain different project requirements | Switch versions instantly                                |
| Global packages tied to one installation        | Packages isolated per Node version                       |
| No automatic project switching                  | Automatically switches using `.node-version` or `.nvmrc` |

For development, fnm provides much greater flexibility while keeping your system packages untouched.

---

## 2. Install fnm

Install fnm from the official Arch repositories:

```bash
sudo pacman -S fnm
```

---

## 3. Configure Your Shell

Add the following to your shell configuration.

### Zsh

```zsh
eval "$(fnm env --use-on-cd)"
```

### Bash

```bash
eval "$(fnm env --use-on-cd)"
```

Reload your shell:

```bash
source ~/.zshrc
```

or

```bash
source ~/.bashrc
```

---

## 4. Verify Installation

Check that fnm is installed correctly:

```bash
fnm --version
```

Then verify that Node is not yet installed:

```bash
fnm list
```

You should see an empty list if this is a fresh installation.

---

## 5. Install Node.js

### Install the latest LTS release (recommended)

```bash
fnm install --lts
```

### Install the latest current release

```bash
fnm install latest
```

### Install a specific version

```bash
fnm install 20
```

```bash
fnm install 22
```

---

## 6. Set the Default Node Version

Make the latest LTS your default:

```bash
fnm default lts-latest
```

Or use the latest release:

```bash
fnm default latest
```

Or pin a specific version:

```bash
fnm default 22
```

Verify:

```bash
node --version
npm --version
```

---

## 7. Switching Node Versions

List installed versions:

```bash
fnm list
```

Switch for the current shell:

```bash
fnm use 22
```

See which version is active:

```bash
fnm current
```

---

## 8. Using `.node-version` or `.nvmrc`

fnm automatically detects both `.node-version` and `.nvmrc`.

Create a project-specific version:

```bash
echo "22" > .node-version
```

or

```bash
echo "22" > .nvmrc
```

When entering the directory, fnm will automatically switch Node versions if your shell is configured with:

```zsh
eval "$(fnm env --use-on-cd)"
```

No manual `fnm use` is necessary.

---

## 9. Updating Node.js

Install a newer version:

```bash
fnm install latest
```

or

```bash
fnm install --lts
```

Then make it the default if desired:

```bash
fnm default latest
```

Older versions remain installed until you remove them.

---

## 10. Updating fnm

Since fnm is installed through pacman:

```bash
sudo pacman -Syu
```

or update only fnm:

```bash
sudo pacman -S fnm
```

---

## 11. Uninstalling Node Versions

Remove a specific version:

```bash
fnm uninstall 20
```

List remaining versions:

```bash
fnm list
```

---

## 12. Uninstalling fnm

Remove the package:

```bash
sudo pacman -Rns fnm
```

Then remove the initialization line from your shell configuration:

```zsh
eval "$(fnm env --use-on-cd)"
```

Optionally remove all installed Node versions:

```bash
rm -rf ~/.local/share/fnm
```

---

## 13. Corepack (Recommended)

Modern versions of Node include **Corepack**, which manages Yarn and pnpm automatically.

Enable it once:

```bash
corepack enable
```

You can now use Yarn or pnpm without installing them globally:

```bash
yarn --version
pnpm --version
```

Corepack downloads the version required by each project automatically.

---

## 14. Troubleshooting

| Problem                         | Solution                                                                                              |
| ------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `fnm: command not found`        | Restart your terminal or reload your shell configuration.                                             |
| `node: command not found`       | Install a Node version with `fnm install --lts` or `fnm install latest`.                              |
| Node version does not change    | Verify that `eval "$(fnm env --use-on-cd)"` is present in your shell configuration.                   |
| `.nvmrc` is ignored             | Ensure you configured fnm with `--use-on-cd` and re-enter the project directory.                      |
| Global npm packages disappeared | Global packages are installed separately for each Node version. Reinstall them with `npm install -g`. |
| Want to see installed versions  | Run `fnm list`.                                                                                       |
| Want to know the active version | Run `fnm current`.                                                                                    |

Your Node.js environment is now fast, isolated, and ready for development with automatic project-specific version switching.
