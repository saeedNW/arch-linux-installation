# Neovim Installation & Modern IDE Setup

Neovim is a modern, extensible text editor. This guide turns it into a full‑featured IDE for JavaScript, TypeScript, Python, and more, using a well‑organised, lazy‑loaded plugin system.

> **ℹ️ Note:** This configuration draws inspiration from the excellent **[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)** starter config, which served as the initial foundation and introduced best practices for organising a Neovim configuration with `lazy.nvim`.

---

## Table of Contents

- [Neovim Installation \& Modern IDE Setup](#neovim-installation--modern-ide-setup)
  - [Table of Contents](#table-of-contents)
  - [1. Install Neovim](#1-install-neovim)
  - [2. Prepare the Configuration Directory](#2-prepare-the-configuration-directory)
  - [3. Core Settings](#3-core-settings)
    - [`options.lua` – Editor Options](#optionslua--editor-options)
    - [`keymaps.lua` – Custom Keymaps](#keymapslua--custom-keymaps)
  - [4. Plugin Manager \& Main Entry Point](#4-plugin-manager--main-entry-point)
    - [`init.lua` – Bootstrap \& Plugins Import](#initlua--bootstrap--plugins-import)
  - [5. Plugin Groups](#5-plugin-groups)
    - [`ui.lua` – Visual Interface](#uilua--visual-interface)
    - [`editor.lua` – Editing Enhancements](#editorlua--editing-enhancements)
    - [`coding.lua` – Language Intelligence (LSP, Completion, Formatting, Linting)](#codinglua--language-intelligence-lsp-completion-formatting-linting)
    - [`git.lua` – Git Integration](#gitlua--git-integration)
    - [`tools.lua` – Navigation \& Utility](#toolslua--navigation--utility)
    - [`terminal.lua` – Terminal Integration](#terminallua--terminal-integration)
    - [`dap.lua` – Debugging](#daplua--debugging)
    - [`session.lua` – Session Management](#sessionlua--session-management)
    - [`lang-js.lua` – JavaScript / TypeScript Tooling](#lang-jslua--javascript--typescript-tooling)
    - [`lang-db.lua` – Database Support (optional)](#lang-dblua--database-support-optional)
  - [6. Final Steps](#6-final-steps)
  - [7. Keybindings Reference](#7-keybindings-reference)
    - [Core Editor](#core-editor)
    - [Window \& Split Management](#window--split-management)
    - [LSP (Language Server Protocol) – active when a language server is attached](#lsp-language-server-protocol--active-when-a-language-server-is-attached)
    - [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
    - [Neo-tree (File Explorer)](#neo-tree-file-explorer)
    - [DAP (Debugging)](#dap-debugging)
    - [Formatting \& Linting](#formatting--linting)
    - [Terminal](#terminal)
    - [Editing Extras](#editing-extras)
    - [Troubleshooting \& Diagnostics UI](#troubleshooting--diagnostics-ui)
  - [8. Troubleshooting](#8-troubleshooting)
  - [9. References \& Inspiration](#9-references--inspiration)

---

## 1. Install Neovim

```bash
sudo pacman -S neovim
```

> **💡 Tip:** After installation, verify it works by running `nvim --version`.

---

## 2. Prepare the Configuration Directory

Create the folder structure that will hold all settings.

```bash
mkdir -p ~/.config/nvim/lua/core
mkdir -p ~/.config/nvim/lua/plugins
```

The final layout:

```plaintext
~/.config/nvim/
├── init.lua
└── lua/
    ├── core/
    │   ├── options.lua
    │   └── keymaps.lua
    └── plugins/
        ├── ui.lua
        ├── editor.lua
        ├── coding.lua
        ├── git.lua
        ├── tools.lua
        ├── terminal.lua
        ├── dap.lua
        ├── session.lua
        ├── lang-js.lua
        └── lang-db.lua   (optional)
```

> **⚠️ Important:** If you are migrating from an older Neovim setup, delete the old configuration and cache first:
>
> ```bash
> rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
> ```

---

## 3. Core Settings

These files contain fundamental editor behaviour and custom keybindings. You need to download (or create) them in the respective directories.

### `options.lua` – Editor Options

Sets line numbers, clipboard, indentation, searching, undo, and many other built‑in Vim/Neovim settings.

➡️ **Download / view:** [`options.lua`](../../../assets/dotfiles/neovim/lua/core/options.lua)

### `keymaps.lua` – Custom Keymaps

Defines leader key (Space), file save/quit shortcuts, window splitting, split navigation, tab management, and more. Resize shortcuts are mapped to `Alt + h/j/k/l` to avoid breaking standard movements.

➡️ **Download / view:** [`keymaps.lua`](../../../assets/dotfiles/neovim/lua/core/keymaps.lua)

---

## 4. Plugin Manager & Main Entry Point

### `init.lua` – Bootstrap & Plugins Import

- Installs `lazy.nvim` automatically.
- Loads all plugin groups using Lazy’s `import` feature, keeping the configuration modular and clean.

➡️ **Download / view:** [`init.lua`](../../../assets/dotfiles/neovim/init.lua)

> **📝 Note:** After placing `init.lua`, open Neovim – Lazy will install itself and all plugins automatically.

---

## 5. Plugin Groups

Each `.lua` file in `lua/plugins/` bundles related plugins together. Below you’ll find a description of every group – the actual configuration code is inside the linked file.

---

### `ui.lua` – Visual Interface

Combines everything that defines how Neovim looks:

- **Nord theme** – a clean, dark colour scheme.
- **bufferline** – top tab bar for open buffers.
- **lualine** – modern status line with mode, git branch, diagnostics, and more.
- **alpha** – custom start screen with ASCII art.
- **statuscol** – enhanced gutter showing line numbers, git signs, and diagnostics.

➡️ [`ui.lua`](../../../assets/dotfiles/neovim/lua/plugins/ui.lua)

---

### `editor.lua` – Editing Enhancements

- **vim-sleuth** – auto‑detects indentation settings.
- **nvim-autopairs** – auto‑closes brackets, quotes, etc.
- **Comment.nvim** – easy commenting with `gc` and `gb`.
- **nvim-surround** – manipulate surrounding characters (`ysiw"`, `cs"'`, etc.).
- **indent-blankline** – shows indentation guides.

➡️ [`editor.lua`](../../../assets/dotfiles/neovim/lua/plugins/editor.lua)

---

### `coding.lua` – Language Intelligence (LSP, Completion, Formatting, Linting)

The heart of the IDE experience:

- **nvim-treesitter** – advanced syntax highlighting and code parsing.
- **LSP stack** – `mason.nvim`, `mason-lspconfig.nvim`, `nvim-lspconfig` to manage language servers (TypeScript, Python, Lua, HTML/CSS, JSON, etc.).
- **nvim-cmp** – autocompletion with snippets (`LuaSnip` + `friendly-snippets`).
- **conform.nvim** – automatic formatting on save (prettier, black, stylua).
- **nvim-lint** – async linting (eslint, ruff).

➡️ [`coding.lua`](../../../assets/dotfiles/neovim/lua/plugins/coding.lua)

---

### `git.lua` – Git Integration

- **gitsigns** – shows added/modified/deleted signs in the gutter.
- **vim-fugitive** + **vim-rhubarb** – full Git commands inside Neovim.

➡️ [`git.lua`](../../../assets/dotfiles/neovim/lua/plugins/git.lua)

---

### `tools.lua` – Navigation & Utility

- **telescope.nvim** – fuzzy finder for files, grep, help, diagnostics, etc. (with fzf-native and ui-select extensions).
- **trouble.nvim** – interactive diagnostics panel.
- **which-key** – displays available keybindings after pressing the leader key.
- **todo-comments** – highlights `TODO`, `FIX`, `NOTE`, etc.
- **nvim-colorizer** – shows colour previews inline.
- **neo-tree** – file explorer with git status, diagnostics, and extensive keybindings.

➡️ [`tools.lua`](../../../assets/dotfiles/neovim/lua/plugins/tools.lua)

---

### `terminal.lua` – Terminal Integration

- **toggleterm.nvim** – floating / split terminal, toggled with `<C-\>` or `<C-t>`.

➡️ [`terminal.lua`](../../../assets/dotfiles/neovim/lua/plugins/terminal.lua)

---

### `dap.lua` – Debugging

- **nvim-dap** + **nvim-dap-ui** – debugging for Node.js and Python.
- **mason-nvim-dap** – auto‑installs debug adapters.
- Keymaps for breakpoints, stepping, and REPL.

➡️ [`dap.lua`](../../../assets/dotfiles/neovim/lua/plugins/dap.lua)

---

### `session.lua` – Session Management

- **auto-session** – automatically restores your last opened files, tabs, and working directory when you reopen a project.

➡️ [`session.lua`](../../../assets/dotfiles/neovim/lua/plugins/session.lua)

---

### `lang-js.lua` – JavaScript / TypeScript Tooling

- **typescript-tools.nvim** – extra TypeScript LSP features (organise imports, rename file).
- **package-info.nvim** – shows version details inside `package.json`.
- **tailwind-tools.nvim** – utilities for Tailwind CSS projects.

➡️ [`lang-js.lua`](../../../assets/dotfiles/neovim/lua/plugins/lang-js.lua)

---

### `lang-db.lua` – Database Support (optional)

- **vim-dadbod** + **vim-dadbod-ui** – run SQL queries directly inside Neovim (PostgreSQL, MySQL, SQLite).

➡️ [`lang-db.lua`](../../../assets/dotfiles/neovim/lua/plugins/lang-db.lua)

> **📝 Note:** If you don’t need database features, simply remove the line `{ import = 'plugins.lang-db' }` from your `init.lua`.

---

## 6. Final Steps

1. **Launch Neovim** for the first time:

   ```bash
   nvim
   ```

2. **Wait for Lazy.nvim** to install itself and download all plugins. This may take a few minutes on the first run.

3. **Verify everything is healthy**:

   ```vim
   :checkhealth
   ```

4. **Set up an alias** (optional) to use `nvim` whenever you type `vim`:

   ```bash
   echo "alias vim='nvim'" >> ~/.zshrc
   source ~/.zshrc
   ```

5. **Restart Neovim** to ensure all language servers and tools are loaded.

---

## 7. Keybindings Reference

All essential shortcuts are listed below. Many plugins also provide their own default mappings (e.g., `gc` for comments, `ysiw"` for surround). Pressing `<leader>` (Space) opens **which-key**, a popup that shows available keys in any context.

### Core Editor

| Keys         | Action                       |
| ------------ | ---------------------------- |
| `<Space>`    | Leader key (also `<leader>`) |
| `<C-q>`      | Quit                         |
| `<C-w>`      | Save and quit                |
| `<C-s>`      | Save file                    |
| `<leader>sn` | Save without auto‑formatting |
| `<leader>lw` | Toggle line wrapping         |

### Window & Split Management

| Keys           | Action               |
| -------------- | -------------------- |
| `<leader>v`    | Vertical split       |
| `<leader>h`    | Horizontal split     |
| `<leader>se`   | Equalise split sizes |
| `<leader>xs`   | Close current split  |
| `Ctrl+h/j/k/l` | Move between splits  |
| `Alt+h/j/k/l`  | Resize current split |

### LSP (Language Server Protocol) – active when a language server is attached

| Keys         | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Find references      |
| `gI`         | Go to implementation |
| `gD`         | Go to declaration    |
| `<leader>D`  | Type definition      |
| `<leader>ds` | Document symbols     |
| `<leader>ws` | Workspace symbols    |
| `<leader>rn` | Rename symbol        |
| `<leader>ca` | Code action          |
| `<leader>th` | Toggle inlay hints   |

### Telescope (Fuzzy Finder)

| Keys               | Action                         |
| ------------------ | ------------------------------ |
| `<leader>sf`       | Find files                     |
| `<leader>sg`       | Live grep (search text)        |
| `<leader>sw`       | Search word under cursor       |
| `<leader>sh`       | Search help                    |
| `<leader>sk`       | Search keymaps                 |
| `<leader>sd`       | Search diagnostics             |
| `<leader>ss`       | Telescope pickers menu         |
| `<leader>sr`       | Resume last search             |
| `<leader>s.`       | Recent files                   |
| `<leader><leader>` | Open buffers                   |
| `<leader>/`        | Fuzzy search in current buffer |
| `<leader>s/`       | Live grep only in open files   |
| `<leader>sn`       | Search Neovim config files     |

### Neo-tree (File Explorer)

| Keys                 | Action                      |
| -------------------- | --------------------------- |
| `\`                  | Toggle Neo-tree on the left |
| **Inside Neo‑tree:** |                             |
| `l` / `<CR>`         | Open file/folder            |
| `h`                  | Close folder / go up        |
| `a`                  | Add file/directory          |
| `d`                  | Delete                      |
| `r`                  | Rename                      |
| `c`                  | Copy                        |
| `m`                  | Move                        |
| `H`                  | Toggle hidden files         |
| `/`                  | Fuzzy finder                |
| `q`                  | Close Neo‑tree              |

### DAP (Debugging)

| Keys         | Action                 |
| ------------ | ---------------------- |
| `<leader>dc` | Continue               |
| `<leader>do` | Step over              |
| `<leader>di` | Step into              |
| `<leader>dO` | Step out               |
| `<leader>db` | Toggle breakpoint      |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dr` | Open REPL              |
| `<leader>dl` | Run last configuration |
| `<leader>du` | Toggle DAP UI          |

### Formatting & Linting

| Keys         | Action                     |
| ------------ | -------------------------- |
| `<leader>f`  | Format buffer              |
| `<leader>uf` | Toggle auto‑format on save |

### Terminal

| Keys    | Action                         |
| ------- | ------------------------------ |
| `<C-\>` | Open terminal (vertical split) |
| `<C-t>` | Floating terminal              |

### Editing Extras

| Keys          | Action                                 |
| ------------- | -------------------------------------- |
| `gc` + motion | Comment / uncomment (Comment.nvim)     |
| `gcc`         | Comment / uncomment current line       |
| `gb` + motion | Block comment                          |
| `ysiw"`       | Surround word with `"` (nvim‑surround) |
| `cs"'`        | Change surrounding `"` to `'`          |
| `ds"`         | Delete surrounding `"`                 |

### Troubleshooting & Diagnostics UI

| Keys         | Action                             |
| ------------ | ---------------------------------- |
| `<leader>xx` | Toggle diagnostics panel (Trouble) |
| `<leader>xX` | Buffer diagnostics (Trouble)       |
| `<leader>cs` | Document symbols (Trouble)         |

> **💡 Pro tip:** Use `<leader>sk` to search through _all_ available keymaps (including plugin defaults) with Telescope.

---

## 8. Troubleshooting

| Problem                                 | Solution                                                                                               |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `command not found: nvim`               | Neovim not installed. Run `sudo pacman -S neovim`.                                                     |
| Plugins not loading / Lazy fails        | Delete `~/.local/share/nvim` and `~/.cache/nvim`, then reopen Neovim.                                  |
| Language server not working             | Run `:Mason` inside Neovim, check that the required server is installed. Use `:LspInfo` to debug.      |
| Treesitter parser missing               | Run `:TSInstall <language>` (e.g., `:TSInstall lua`).                                                  |
| Formatting doesn’t happen on save       | Ensure `conform.nvim` is installed and the filetype is supported. Run `:ConformInfo`.                  |
| `E5108: Error executing lua` on startup | One of the `.lua` configuration files has a syntax error. Check the exact line from the error message. |
| DAP debugging fails                     | Install debug adapters with `:Mason` (e.g., `js-debug-adapter`, `python-debugger`).                    |

---

## 9. References & Inspiration

- **[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)** – The initial starting point that shaped the modular structure and many of the LSP/completion defaults.
- **Video: [Full Neovim Setup from Scratch in 2025](https://www.youtube.com/watch?v=KYDG3AHgYEs)** – Original walkthrough that introduced the core plugin set and configuration approach.
- **Video: [How To Make Neovim Amazing (2025 Edition)](https://www.youtube.com/watch?v=CVCBHHFXWNE)** – Modern recommendations that inspired many of the newer additions like debugging, formatting, linting, session management, and enhanced UI plugins.

---

Your Neovim is now a modern, full‑stack development environment. Happy coding!
