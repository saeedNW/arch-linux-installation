# Topgrade – Universal System Updater

Topgrade is a command‑line tool that detects which package managers, language toolchains, and applications are installed on your system and runs the appropriate update commands for each in sequence. It saves you from remembering and typing multiple update commands manually.

---

## Table of Contents

- [Topgrade – Universal System Updater](#topgrade--universal-system-updater)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Command Line Options](#4-command-line-options)
  - [5. Configuration (Optional)](#5-configuration-optional)
    - [Edit the configuration](#edit-the-configuration)
    - [Basic configuration example](#basic-configuration-example)
  - [6. Customization Examples](#6-customization-examples)
    - [Disable certain steps permanently](#disable-certain-steps-permanently)
    - [Add custom pre‑ and post‑commands](#add-custom-pre-and-postcommands)
    - [Update remote hosts](#update-remote-hosts)
  - [7. Uninstalling](#7-uninstalling)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Topgrade is available in the Arch Linux **AUR** – this guide uses `yay`:

```bash
yay -S topgrade
```

> **💡 Tip:** The `topgrade-bin` AUR package (pre‑compiled binary) is also available if you prefer.

---

## 2. Verification

Check that Topgrade is installed correctly:

```bash
topgrade --version
```

You should see output like `Topgrade 16.x.x`.

---

## 3. Basic Usage

To update **everything** on your system, simply run:

```bash
topgrade
```

Topgrade automatically detects your installed tools and runs their update commands. On Arch Linux this includes:

| Category             | Tools updated                     |
| -------------------- | --------------------------------- |
| **System packages**  | `pacman` (and `yay` if installed) |
| **Flatpak**          | `flatpak update`                  |
| **Snap**             | `snap refresh`                    |
| **Firmware**         | `fwupdmgr update`                 |
| **Rust**             | `rustup update`                   |
| **Python**           | `pip`, `pipx`                     |
| **Node.js**          | `npm`, `pnpm`, `yarn`             |
| **Go**               | `go install`                      |
| **Vim / Neovim**     | Plugin updates                    |
| **Shell plugins**    | Oh My Zsh, Zinit, Fisher          |
| **Git repositories** | Configurable repos                |
| **Docker / Podman**  | Container images                  |

Missing tools are silently skipped, so the same configuration works across different machines.

---

## 4. Command Line Options

Topgrade supports various command‑line options to fine‑tune its behaviour:

| Option              | Description                                                     |
| ------------------- | --------------------------------------------------------------- |
| `-y, --yes`         | Answer “yes” to all confirmation prompts                        |
| `-n, --dry-run`     | Print what would be done without actually executing             |
| `--only STEP`       | Run only the specified step (can be used multiple times)        |
| `--disable STEPS`   | Skip the specified step(s) for this run (comma‑separated)       |
| `--check`           | Only check for available updates, do not install                |
| `-c, --cleanup`     | Clean up old package versions and caches after upgrading        |
| `--show-skipped`    | List steps that would be skipped with the current configuration |
| `-e, --edit-config` | Open the configuration file in `$EDITOR`                        |
| `--config FILE`     | Use an alternative configuration file                           |
| `--no-retry`        | Do not prompt to retry failed steps                             |
| `-t, --tmux`        | Run Topgrade inside a new tmux session                          |
| `-k, --keep`        | Keep the terminal open after execution finishes                 |
| `-v, --verbose`     | Produce verbose output                                          |

**Usage examples:**

```bash
# Preview what would be updated without making changes
topgrade --dry-run

# Skip Python pip updates
topgrade --disable pip

# Run only system updates and Flatpak
topgrade --only system --only flatpak

# Clean up cache after updating
topgrade --cleanup
```

---

## 5. Configuration (Optional)

Topgrade is highly configurable via a **TOML** file. The file is located at:

- `~/.config/topgrade.toml` (Linux / BSD)
- `~/Library/Preferences/topgrade.toml` (macOS)

On the first run, Topgrade creates a default configuration file for you.

### Edit the configuration

```bash
topgrade --edit-config
```

### Basic configuration example

```toml
# ~/.config/topgrade.toml

[misc]
cleanup = true          # Clean up after updates
no_retry = true         # Don't ask to retry failed steps

[linux]
yay_arguments = "--nodiffmenu"   # Custom arguments for yay

[commands]
"Custom Python update" = "~/dev/.env/bin/pip install -U pip"

[git]
repos = ["~/github/*", "~/projects/*"]
```

> **💡 Tip:** See the full example configuration at the [official repository](https://github.com/topgrade-rs/topgrade/blob/main/config.example.toml).

---

## 6. Customization Examples

### Disable certain steps permanently

Add the following to your `topgrade.toml`:

```toml
[misc]
disable = ["pip", "npm", "flatpak"]
```

### Add custom pre‑ and post‑commands

```toml
[pre_commands]
"Backup dotfiles" = "cd ~/dotfiles && git add . && git commit -m 'pre-update backup'"

[post_commands]
"Restart services" = "systemctl --user restart my-service"
```

### Update remote hosts

```toml
[remote_hosts]
hosts = ["server1", "server2"]
```

Then run:

```bash
topgrade --remote-host-limit server1
```

---

## 7. Uninstalling

```bash
yay -Rns topgrade
```

Remove configuration files (optional):

```bash
rm -rf ~/.config/topgrade.toml
```

---

## 8. Troubleshooting

| Problem                                       | Solution                                                                                            |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `topgrade: command not found`                 | Topgrade is not installed. Run `yay -S topgrade`.                                                   |
| “Permission denied” during updates            | Topgrade will prompt for `sudo` when needed. If it doesn’t, run with `sudo topgrade`.               |
| A step fails consistently                     | Add it to `ignore_failures` in the config. The step will be skipped in future runs.                 |
| Topgrade takes a long time                    | Normal – it runs many update commands. Use `--only` to limit scope.                                 |
| Updates are skipped without explanation       | Run `topgrade --show-skipped` to see which steps are disabled.                                      |
| `topgrade --dry-run` still prompts for `sudo` | The dry run still detects that `sudo` would be needed; it does not execute any privileged commands. |

---

Your Topgrade installation is now ready to update your entire system with a single command – from official packages to language tools, container images, and even remote hosts. Enjoy the convenience of truly comprehensive updates!
