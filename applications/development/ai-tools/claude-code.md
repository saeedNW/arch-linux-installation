# Claude Code – Terminal AI Coding Assistant

Claude Code is an agentic coding tool that lives in your terminal. It provides AI-powered code completion, editing, and assistance directly from the command line, integrating with your existing development workflow.

> **ℹ️ Note:** This guide assumes you are using **Arch Linux** or an Arch‑based distribution. Package manager commands (`yay`) are specific to Arch.

---

## Table of Contents

- [Claude Code – Terminal AI Coding Assistant](#claude-code--terminal-ai-coding-assistant)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Claude Code](#2-launching-claude-code)
  - [3. Authentication](#3-authentication)
  - [4. Optional Dependencies](#4-optional-dependencies)
  - [5. Updating Claude Code](#5-updating-claude-code)
  - [6. Uninstalling Claude Code](#6-uninstalling-claude-code)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

Install `claude-code` from the AUR using `yay` (or your preferred AUR helper):

```bash
yay -S claude-code
```

This installs the official Anthropic CLI binary packaged for Arch Linux.

---

## 2. Launching Claude Code

After installation, launch it from the terminal:

```bash
claude
```

You can run `claude` from any project directory. It will read the current working directory as the project context.

> **💡 Tip:** If the `claude` command is not found, close and reopen your terminal, or log out and back in.

---

## 3. Authentication

On first launch, Claude Code will prompt you to authenticate with your Anthropic account. Follow the browser-based login flow to authorize the CLI.

---

## 4. Optional Dependencies

Claude Code works out of the box, but the following optional packages unlock additional features:

| Package | Purpose |
| ------- | ------- |
| `git` | Allows Claude Code to read and modify git repositories |
| `github-cli` | Interact with GitHub (PRs, issues, etc.) |
| `glab` | Interact with GitLab (MRs, issues, etc.) |
| `ripgrep` | Enhanced file search across your project |
| `tmux` | Agent team split panes for long-running tasks |
| `bubblewrap` | Sandboxing for agent operations |
| `socat` | Sandboxing support |
| `wl-clipboard` | Paste images from clipboard on Wayland |
| `xclip` | Paste images from clipboard on X11 |

Install any of them with:

```bash
yay -S git github-cli glab ripgrep tmux bubblewrap socat wl-clipboard xclip
```

---

## 5. Updating Claude Code

Claude Code is distributed as a binary via the AUR. To update it (along with other AUR packages):

```bash
yay -Syu
```

---

## 6. Uninstalling Claude Code

```bash
yay -Rns claude-code
```

Remove local configuration and cache files:

```bash
rm -rf ~/.claude
```

---

## 7. Troubleshooting

| Problem | Solution |
| ------- | -------- |
| `claude: command not found` | Ensure your terminal session was restarted after installation, or log out and back in. |
| Authentication loop | Check your internet connection and ensure your Anthropic account has an active subscription. |
| Image paste not working | Install `wl-clipboard` (Wayland) or `xclip` (X11) to enable clipboard image support. |
| Sandbox errors | Install `bubblewrap` and `socat` for sandboxing support. |

---

Your Claude Code terminal assistant is now ready. Enjoy AI-powered development from the command line.
