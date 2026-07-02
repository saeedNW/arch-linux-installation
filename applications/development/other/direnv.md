# direnv – Environment Variable Manager

direnv is a shell extension that automatically loads and unloads environment variables based on your current directory. It is perfect for managing project‑specific environment variables without polluting your global shell configuration.

> **💡 Tip:** direnv works with **any** POSIX‑compatible shell – Bash, Zsh, Fish, and others.

---

## Table of Contents

- [direnv – Environment Variable Manager](#direnv--environment-variable-manager)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Shell Integration (General)](#2-shell-integration-general)
  - [3. Basic Usage \& Demo](#3-basic-usage--demo)
  - [4. Key Notes](#4-key-notes)
    - [Applying Changes After Editing `.envrc`](#applying-changes-after-editing-envrc)
    - [Variable Precedence](#variable-precedence)
    - [Security](#security)
  - [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S direnv
```

---

## 2. Shell Integration (General)

For direnv to work automatically when you change directories, you must hook it into your shell.
**Add the appropriate line to your shell configuration file** (e.g., `~/.bashrc`, `~/.zshrc`, `~/.config/fish/config.fish`).

| Shell    | Add this line                |
| -------- | ---------------------------- |
| **Bash** | `eval "$(direnv hook bash)"` |
| **Zsh**  | `eval "$(direnv hook zsh)"`  |
| **Fish** | `direnv hook fish \| source` |

After adding the line, restart your shell or run `source ~/.bashrc` (or equivalent).

> **💡 Tip:** For **Fish**, the command is different because Fish uses a different syntax. The line shown works correctly.

---

## 3. Basic Usage & Demo

```bash
# Create a new project folder
mkdir ~/my-project
cd ~/my-project

# Check that the FOO variable is not set
echo ${FOO-nope}
# Output: nope

# Create an .envrc file (bash code that direnv will load)
echo 'export FOO=foo' > .envrc
# direnv will detect the new file and ask for permission
# Output: .envrc is not allowed

# Allow the .envrc file to be executed
direnv allow .
# Output: direnv: loading .envrc, direnv export: +FOO

# Now the variable is loaded
echo ${FOO-nope}
# Output: foo

# Leave the directory
cd ..
# Output: direnv: unloading

# The variable is unset again
echo ${FOO-nope}
# Output: nope
```

---

## 4. Key Notes

### Applying Changes After Editing `.envrc`

After you modify the `.envrc` file, you must run:

```bash
direnv allow .
```

This reloads the environment variables for the current directory.

### Variable Precedence

Environment variables defined in `.envrc` **override** those in a project’s `.env` file (if you use one). If the same variable appears in both, the `.envrc` value takes precedence. This is useful for local overrides without changing shared files.

### Security

direnv requires explicit approval for each `.envrc` file. You must run `direnv allow` once – this creates a `.envrc.allow` entry in `~/.config/direnv/allow/` (or equivalent). This prevents accidental execution of untrusted code.

---

## 5. Troubleshooting

| Problem                                       | Solution                                                                                                     |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `direnv: command not found`                   | Install `direnv` first: `sudo pacman -S direnv`.                                                             |
| `direnv: error .envrc is blocked`             | You haven’t allowed it yet. Run `direnv allow .`.                                                            |
| Changes to `.envrc` do not take effect        | You must run `direnv allow .` again after every change.                                                      |
| direnv not loading automatically              | Check that the hook line is correctly added to your shell config and that you have restarted the shell.      |
| Variables not unloaded when leaving directory | Ensure the hook is installed correctly. Try `direnv status` inside the directory to see if direnv is active. |
| Fish: `Unknown command: direnv hook fish`     | Update direnv to the latest version. If still failing, use `direnv hook fish \| source` as shown above.      |

---

Your direnv is now ready to manage environment variables per project, keeping your global shell clean and safe.
