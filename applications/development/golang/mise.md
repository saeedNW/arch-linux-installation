# Go Installation Using mise

Go (or Golang) is an open-source programming language developed by Google for building fast, reliable, and efficient software. This guide explains how to install and manage Go versions on **Arch Linux** using **mise**.

> **ℹ️ Note:** mise is a modern development tool version manager that can manage Go, Node.js, Python, Rust, Java, and many other languages from a single tool. It is a lightweight successor to tools like `asdf` and provides both global and project-specific version management.

---

## Table of Contents

- [Go Installation Using mise](#go-installation-using-mise)
  - [Table of Contents](#table-of-contents)
  - [1. Why mise Instead of `pacman`?](#1-why-mise-instead-of-pacman)
  - [2. Install mise](#2-install-mise)
  - [3. Configure Your Shell](#3-configure-your-shell)
    - [Zsh](#zsh)
    - [Bash](#bash)
  - [4. Verify Installation](#4-verify-installation)
  - [5. Install Go](#5-install-go)
    - [Install the latest release](#install-the-latest-release)
    - [Install a specific version](#install-a-specific-version)
  - [6. Set the Default Go Version](#6-set-the-default-go-version)
  - [7. Switching Go Versions](#7-switching-go-versions)
  - [8. Using Project-Specific Versions](#8-using-project-specific-versions)
  - [9. Updating Go](#9-updating-go)
  - [10. Updating mise](#10-updating-mise)
  - [11. Uninstalling Go Versions](#11-uninstalling-go-versions)
  - [12. Uninstalling mise](#12-uninstalling-mise)
  - [13. Troubleshooting](#13-troubleshooting)

---

## 1. Why mise Instead of `pacman`?

| Using `pacman`                         | Using `mise`                                     |
| -------------------------------------- | ------------------------------------------------ |
| One system-wide Go installation        | Multiple Go versions side-by-side                |
| Updating Go updates the system package | Update only the versions you choose              |
| Difficult to test multiple Go versions | Switch versions instantly                        |
| Same Go version for every project      | Different projects can use different Go versions |
| Go managed separately from other tools | One tool manages Go, Node, Python, Rust, etc.    |

For development, `mise` provides much greater flexibility while keeping your system packages untouched.

---

## 2. Install mise

Install mise from the official Arch repositories:

```bash
sudo pacman -S mise
```

---

## 3. Configure Your Shell

Add the following to your shell configuration.

### Zsh

```zsh
eval "$(mise activate zsh)"
```

### Bash

```bash
eval "$(mise activate bash)"
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

Check that mise is installed correctly:

```bash
mise --version
```

Verify that no Go version is currently installed:

```bash
mise ls go
```

If this is a fresh installation, the list will be empty.

---

## 5. Install Go

### Install the latest release

```bash
mise use --global go@latest
```

### Install a specific version

```bash
mise use --global go@1.26
```

or

```bash
mise use --global go@1.26.5
```

Verify the installation:

```bash
go version
```

---

## 6. Set the Default Go Version

Using `mise use --global` automatically installs (if necessary) and sets the selected version as your global default.

Example:

```bash
mise use --global go@1.26.5
```

View the active version:

```bash
mise current
```

or

```bash
go version
```

---

## 7. Switching Go Versions

List installed Go versions:

```bash
mise ls go
```

Switch globally:

```bash
mise use --global go@1.25
```

Switch only for the current project:

```bash
mise use go@1.26
```

Check the active version:

```bash
mise current
```

---

## 8. Using Project-Specific Versions

Inside a project directory:

```bash
cd my-project
```

Select a Go version for that project:

```bash
mise use go@1.26
```

This creates a `mise.toml` file similar to:

```toml
[tools]
go = "1.26"
```

Anyone using the project can activate the required Go version simply by running:

```bash
mise install
```

---

## 9. Updating Go

Install a newer version:

```bash
mise use --global go@latest
```

or install a specific release:

```bash
mise use --global go@1.27
```

Previously installed versions remain available until removed.

---

## 10. Updating mise

Since mise is installed through pacman:

```bash
sudo pacman -Syu
```

or update only mise:

```bash
sudo pacman -S mise
```

---

## 11. Uninstalling Go Versions

List installed versions:

```bash
mise ls go
```

Remove a version:

```bash
mise uninstall go@1.25
```

Verify:

```bash
mise ls go
```

---

## 12. Uninstalling mise

Remove the package:

```bash
sudo pacman -Rns mise
```

Remove the initialization line from your shell configuration:

```zsh
eval "$(mise activate zsh)"
```

Optionally remove all installed tools and configuration:

```bash
rm -rf ~/.local/share/mise
rm -rf ~/.config/mise
rm -rf ~/.cache/mise
rm -rf ~/.local/state/mise
```

---

## 13. Troubleshooting

| Problem                         | Solution                                                  |
| ------------------------------- | --------------------------------------------------------- |
| `mise: command not found`       | Restart your terminal or reload your shell configuration. |
| `go: command not found`         | Install Go using `mise use --global go@latest`.           |
| Wrong Go version is used        | Check the active version with `mise current`.             |
| Project uses the wrong version  | Ensure the project contains a valid `mise.toml` file.     |
| Want to list installed versions | Run `mise ls go`.                                         |
| Want to see available versions  | Run `mise ls-remote go`.                                  |
| Want to know the active version | Run `mise current` or `go version`.                       |

Your Go development environment is now isolated, version-managed, and ready for building applications with Go.
