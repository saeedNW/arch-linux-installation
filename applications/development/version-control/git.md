# Git Installation & Configuration Guide

Git is a widely used version control system that allows you to manage and track changes to your codebase efficiently. This guide covers installation, basic configuration, and setting up SSH keys for GitHub.

> **ℹ️ Note:** Git is available in the official Arch Linux repositories, so no AUR helper is needed.

---

## Table of Contents

- [Git Installation \& Configuration Guide](#git-installation--configuration-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Install Git](#1-install-git)
  - [2. Verify Installation](#2-verify-installation)
  - [3. Global Git Configuration](#3-global-git-configuration)
    - [Basic Identity](#basic-identity)
    - [Editor \& Pager](#editor--pager)
    - [Behaviour \& Performance](#behaviour--performance)
  - [4. Create SSH Key and Add to GitHub](#4-create-ssh-key-and-add-to-github)
    - [Generate a New SSH Key](#generate-a-new-ssh-key)
    - [Add the Key to the SSH Agent](#add-the-key-to-the-ssh-agent)
    - [Add the Public Key to GitHub](#add-the-public-key-to-github)
  - [5. Final Steps](#5-final-steps)

---

## 1. Install Git

```bash
sudo pacman -S git
```

---

## 2. Verify Installation

Check that Git is installed correctly:

```bash
git --version
```

Expected output: `git version x.x.x`

---

## 3. Global Git Configuration

The following commands set global options that apply to all your repositories. Replace placeholders with your own information.

### Basic Identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Editor & Pager

Set your preferred text editor for commit messages and other interactive Git commands. The `--wait` flag ensures Git waits for the editor to close.

```bash
# Using Kiro (or replace with 'code --wait', 'cursor --wait', 'nvim', etc.)
git config --global core.editor "kiro --wait"
```

Disable the default pager (so output is printed directly to the terminal):

```bash
git config --global core.pager "cat"
```

### Behaviour & Performance

| Configuration               | Purpose                                                               |
| --------------------------- | --------------------------------------------------------------------- |
| `init.defaultBranch "main"` | Sets the default branch name to `main` for new repositories.          |
| `merge.ff "--no-ff"`        | Always create a merge commit (no fast‑forward).                       |
| `pull.rebase "false"`       | Use merge instead of rebase when pulling.                             |
| `core.autocrlf "input"`     | Convert line endings to LF on input (recommended for Linux).          |
| `fetch.prune true`          | Automatically remove remote‑tracking branches that no longer exist.   |
| `diff.algorithm histogram`  | Use the histogram diff algorithm (better for code changes).           |
| `color.ui auto`             | Enable coloured output in Git commands.                               |
| `http.postBuffer 524288000` | Increase the maximum buffer for HTTP pushes (useful for large repos). |

Apply them with:

```bash
git config --global init.defaultBranch "main"
git config --global merge.ff "--no-ff"
git config --global pull.rebase "false"
git config --global core.autocrlf "input"
git config --global fetch.prune true
git config --global diff.algorithm histogram
git config --global color.ui auto
git config --global http.postBuffer 524288000
```

> **💡 Tip:** View all applied settings with `git config --global --list`.

---

## 4. Create SSH Key and Add to GitHub

Using an SSH key allows you to connect to GitHub (or other Git servers) without entering a username and password each time.
_This section is based on the [GitHub SSH documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)._

### Generate a New SSH Key

Open a terminal and run:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

> **⚠️ Note:** If your system does not support the Ed25519 algorithm (very old), use RSA instead:
>
> ```bash
> ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
> ```

Press `Enter` to accept the default file location (`~/.ssh/id_ed25519`). Optionally enter a passphrase for extra security.

### Add the Key to the SSH Agent

Start the SSH agent in the background:

```bash
eval "$(ssh-agent -s)"
```

Add your private key to the agent:

```bash
ssh-add ~/.ssh/id_ed25519
```

### Add the Public Key to GitHub

1. Display your public key:

   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

2. Copy the entire output (starting with `ssh-ed25519` and ending with your email).

3. Go to **GitHub → Settings → SSH and GPG keys → New SSH key**.

4. Paste the key, give it a descriptive title, and click **Add SSH key**.

5. Test the connection:

   ```bash
   ssh -T git@github.com
   ```

You should see a message like:
`Hi username! You've successfully authenticated, but GitHub does not provide shell access.`

---

## 5. Final Steps

After configuration, you can start using Git:

- Clone a repository: `git clone git@github.com:user/repo.git`
- Or initialise a new one: `git init my-project`

Your Git setup is now complete and optimised for everyday development.
