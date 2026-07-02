# Kiro AI Editor Setup Guide

Kiro is an agentic AI‑powered development environment that turns natural language into structured specs, automated tasks, and working code. It provides both a desktop IDE and a terminal CLI (`kiro-cli`).

> **ℹ️ Note:** This guide assumes you are using **Arch Linux** or an Arch‑based distribution (like EndeavourOS). Package manager commands use `yay` (AUR helper). Replace with your preferred helper if needed.

---

## Table of Contents

- [Kiro AI Editor Setup Guide](#kiro-ai-editor-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Kiro](#2-launching-kiro)
  - [3. Recommended Extensions](#3-recommended-extensions)
  - [4. Theme](#4-theme)
  - [5. Recommended Settings](#5-recommended-settings)
  - [6. Custom Keybindings](#6-custom-keybindings)
  - [7. Final Steps](#7-final-steps)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install both the Kiro IDE and its CLI from the AUR:

```bash
yay -S kiro-ide kiro-cli
```

> **💡 Tip:** Update both later with `yay -Syu`.

---

## 2. Launching Kiro

After installation, launch Kiro:

- From your application menu (search for **Kiro**)
- From the terminal: `kiro`

The CLI tool `kiro-cli` will also be available.

---

## 3. Recommended Extensions

Kiro is based on VS Code and supports all VS Code extensions from the Open VSX Registry. The following extensions are recommended for a productive workflow.

| Category                 | Extensions                                                                                                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Core**                 | `advanced-new-file-plus`, `Better Comments Next`, `Bracket Pair Colorizer 2`, `Code Spell Checker`, `Persian - Code Spell Checker`, `CodeSnap`, `Error Lens`, `Todo Tree`, `Toggle Quotes` |
| **Git**                  | `Git Graph`, `GitLens`                                                                                                                                                                     |
| **Linting & Formatting** | `ESLint`, `Prettier - Code formatter`, `Even Better TOML`, `inifmt`, `Black Formatter`                                                                                                     |
| **Markdown**             | `Markdown All in One`, `Markdown Table`, `Markdown Table Prettifier`, `Markdownlint`, `Markdown Preview Mermaid Support`                                                                   |
| **Language Support**     | `HTML CSS Support`, `Lua`, `Protobuf VSC`, `Python`, `Python Debugger`, `Python Environments`, `nginx.conf hint`, `Pretty TypeScript Errors`, `Import Cost`, `Live Server`                 |
| **Snippets**             | `JavaScript (ES6) code snippets`, `Next.js snippets`, `ES7+ React/Redux/React-Native snippets`                                                                                             |
| **Containers & DevOps**  | `Docker`, `Docker DX`, `Container Tools`                                                                                                                                                   |
| **Remote Development**   | `Open Remote - SSH`                                                                                                                                                                        |
| **Theming**              | `Material Icon Theme`                                                                                                                                                                      |
| **Utilities**            | `Selection Stats & Line Counter`                                                                                                                                                           |

> **💡 Tip:** Install them via the Extensions view (`Ctrl+Shift+X`).

---

## 4. Theme

Kiro’s UI is designed with a side‑by‑side section separation that works best with the **default theme**. You may keep the built‑in theme or apply your own – the editor settings below assume you keep the default.

---

## 5. Recommended Settings

Create or edit your `settings.json` in Kiro (`Ctrl+Shift+P` → `Preferences: Open Settings (JSON)`) and add the following configuration. It is tailored for Kiro but also improves the general editing experience.

> **⚠️ Note:** The snippet uses JSON with comments (JSONC) – fully supported in Kiro.

```jsonc
{
	// ? ===== General =====

	// * Open files from untrusted workspaces without prompting
	"security.workspace.trust.untrustedFiles": "open",

	// * Disable compact folder nesting in Explorer
	"explorer.compactFolders": false,

	// * Hide editor breadcrumbs navigation
	"breadcrumbs.enabled": false,

	// * Show Error Lens annotations only for warnings and errors
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],

	// * Enable Kiro tab completion
	"kiroAgent.enableTabAutocomplete": true,

	// * Disable MCP configuration prompts
	"kiroAgent.configureMCP": "Disabled",

	// ? ===== Files =====

	// * Automatically save files after a short delay
	"files.autoSave": "afterDelay",

	// * Remove trailing whitespace on save
	"files.trimTrailingWhitespace": true,

	// * Ensure files end with a newline
	"files.insertFinalNewline": true,

	// * Remove extra blank lines at the end of files
	"files.trimFinalNewlines": true,

	// ? ===== Zen Mode =====

	// * Keep editor layout aligned normally in Zen Mode
	"zenMode.centerLayout": false,

	// * Keep line numbers visible in Zen Mode
	"zenMode.hideLineNumbers": false,

	// ? ===== Window =====

	// * Use the custom window title bar
	"window.titleBarStyle": "custom",

	// * Show menu bar when Alt is pressed
	"window.menuBarVisibility": "toggle",

	// * Reuse previous window dimensions for new windows
	"window.newWindowDimensions": "inherit",

	// ? ===== Workbench =====

	// * Disable navigation controls in the workbench header
	"workbench.navigationControl.enabled": false,

	// * Use Material Icon Theme
	"workbench.iconTheme": "material-icon-theme",

	// * Skip the welcome/startup screen
	"workbench.startupEditor": "none",

	// ? ===== Git & Source Control =====

	// * Automatically fetch remote changes
	"git.autofetch": true,

	// * Display the GitLens graph inside an editor tab
	"gitlens.graph.layout": "editor",

	// * Show repositories and changes in tree view
	"scm.defaultViewMode": "tree",

	// * Ignore whitespace-only changes in diffs
	"diffEditor.ignoreTrimWhitespace": true,

	// ? ===== Editor =====

	// * Typography

	// * Preferred editor font stack
	"editor.fontFamily": "Fira Code, JetBrainsMono Nerd Font, Consolas, monospace",

	// * Enable font ligatures
	"editor.fontLigatures": true,

	// * Increase line spacing for readability
	"editor.lineHeight": 1.4,

	// * Editing Experience

	// * Use tabs instead of spaces
	"editor.insertSpaces": false,

	// * Set tab width to 2
	"editor.tabSize": 2,

	// * Use tabSize as indentation size
	"editor.indentSize": "tabSize",

	// * Disable automatic indentation detection
	"editor.detectIndentation": false,

	// * Enable linked editing for matching tags
	"editor.linkedEditing": true,

	// * Enable Ctrl + Mouse Wheel zoom
	"editor.mouseWheelZoom": true,

	// * Enable smooth caret animation
	"editor.cursorSmoothCaretAnimation": "on",

	// * Highlight the active line
	"editor.renderLineHighlight": "all",

	// * Disable bracket matching highlights
	"editor.matchBrackets": "never",

	// * Hide code action lightbulb indicators
	"editor.lightbulb.enabled": "off",

	// * Suggestions & Assistance

	// * Suppress regular suggestions when inline suggestions are shown
	"editor.inlineSuggest.suppressSuggestions": true,

	// * Suggest words from other open documents
	"editor.wordBasedSuggestions": "matchingDocuments",

	// * Disable syntax highlighting when copying code
	"editor.copyWithSyntaxHighlighting": false,

	// * Organize imports automatically on save
	"editor.codeActionsOnSave": {
		"source.organizeImports": "always",
	},

	// * JavaScript & TypeScript Imports

	// * Prefer single quotes in JavaScript auto-imports
	"javascript.preferences.quoteStyle": "single",

	// * Prefer single quotes in TypeScript auto-imports
	"typescript.preferences.quoteStyle": "single",

	// ? ===== Terminal =====

	// * Preferred terminal font stack
	"terminal.integrated.fontFamily": "Fira Code, JetBrainsMono Nerd Font, monospace",

	// * Linux terminal environment overrides
	"terminal.integrated.env.linux": {},

	// ? ===== Prettier =====

	// * Use tabs for indentation
	"prettier.useTabs": true,

	// * Set tab width to 2
	"prettier.tabWidth": 2,

	// * Use LF line endings
	"prettier.endOfLine": "lf",

	// * Prefer single quotes
	"prettier.singleQuote": true,

	// * Always include semicolons
	"prettier.semi": true,

	// * Always include trailing commas where valid
	"prettier.trailingComma": "all",

	// * Add spaces inside object braces
	"prettier.bracketSpacing": true,

	// * Always wrap arrow function parameters in parentheses
	"prettier.arrowParens": "always",

	// * Wrap lines at 100 characters
	"prettier.printWidth": 100,

	// ? ===== Spell Checker =====

	// * Additional dictionary words
	"cSpell.userWords": ["fastify", "liara"],

	// * Enable English and Persian spell checking
	"cSpell.language": "en,fa",

	// ? ===== Formatting =====

	// * Format files automatically on save
	"editor.formatOnSave": true,

	// * Format while typing
	"editor.formatOnType": true,

	// * Format pasted content
	"editor.formatOnPaste": true,

	// * Use Prettier as the global formatter
	"editor.defaultFormatter": "esbenp.prettier-vscode",

	// * Language-Specific Formatters

	// * JavaScript
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode",
	},

	// * TypeScript
	"[typescript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode",
	},

	// * Lua
	"[lua]": {
		"editor.defaultFormatter": "sumneko.lua",
	},

	// * TOML
	"[toml]": {
		"editor.defaultFormatter": "tamasfe.even-better-toml",
	},

	// * Docker Compose
	"[dockercompose]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode",
	},

	// * Plain Text
	"[plaintext]": {
		"editor.defaultFormatter": "lkrms.inifmt",
	},

	// * Protocol Buffers
	"[proto3]": {
		"editor.defaultFormatter": "DrBlury.protobuf-vsc",
	},

	// * NGINX Configuration
	"[NGINX]": {
		"editor.defaultFormatter": "hangxingliu.vscode-nginx-conf-hint",
	},

	// * Python
	"[python]": {
		"editor.defaultFormatter": "ms-python.black-formatter",
	},
}
```

---

## 6. Custom Keybindings

Create or edit `keybindings.json` in Kiro (`Ctrl+Shift+P` → `Preferences: Open Keyboard Shortcuts (JSON)`) and add the following overrides.

```jsonc
// Place your key bindings in this file to override the defaults
[
	// ? ===== Selection & Editing =====

	// * Copy Line Down
	{
		// * Unbind default "Copy Line Down" shortcut
		"key": "ctrl+shift+alt+down",
		"command": "-editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly",
	},
	{
		// * Rebind "Copy Line Down" to Ctrl+D
		"key": "ctrl+d",
		"command": "editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly",
	},

	// * Multi-Cursor: Select Next Match
	{
		// * Unbind default multi-cursor selection shortcut from Ctrl+D
		"key": "ctrl+d",
		"command": "-editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus",
	},
	{
		// * Rebind multi-cursor selection to Alt+D
		"key": "alt+d",
		"command": "editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus",
	},

	// * Delete Line
	{
		// * Unbind default "Delete Line" shortcut
		"key": "ctrl+shift+k",
		"command": "-editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly",
	},
	{
		// * Rebind "Delete Line" to Ctrl+Y
		"key": "ctrl+y",
		"command": "editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly",
	},
	{
		// * Free Ctrl+Y by unbinding Redo
		"key": "ctrl+y",
		"command": "-redo",
	},

	// * Block Comments
	{
		// * Unbind default block comment shortcut
		"key": "ctrl+shift+a",
		"command": "-editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly",
	},
	{
		// * Rebind block comment toggle to Ctrl+Shift+/
		"key": "ctrl+shift+/",
		"command": "editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly",
	},

	// * Format Selection
	{
		// * Unbind default "Format Selection" shortcut
		"key": "ctrl+k ctrl+f",
		"command": "-editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly",
	},
	{
		// * Rebind "Format Selection" to Ctrl+Alt+F
		"key": "ctrl+alt+f",
		"command": "editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly",
	},

	// ? ===== Navigation =====

	// * Go To Line
	{
		// * Rebind "Go to Line" to Alt+G
		"key": "alt+g",
		"command": "workbench.action.gotoLine",
	},
	{
		// * Unbind default Ctrl+G "Go to Line" shortcut
		"key": "ctrl+g",
		"command": "-workbench.action.gotoLine",
	},

	// * Explorer
	{
		// * Collapse all folders in Explorer
		"key": "shift+alt+e",
		"command": "workbench.files.action.collapseExplorerFolders",
	},
	{
		// * Unbind default Explorer focus shortcut
		"key": "ctrl+shift+e",
		"command": "-workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled",
	},
	{
		// * Rebind Explorer focus to Alt+E
		"key": "alt+e",
		"command": "workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled",
	},

	// ? ===== Code Folding =====

	// * Fold All
	{
		// * Unbind default "Fold All" shortcut
		"key": "ctrl+k ctrl+0",
		"command": "-editor.foldAll",
		"when": "editorTextFocus && foldingEnabled",
	},
	{
		// * Rebind "Fold All" to Ctrl+Shift+NumpadSubtract
		"key": "ctrl+shift+numpad_subtract",
		"command": "editor.foldAll",
		"when": "editorTextFocus && foldingEnabled",
	},

	// * Unfold All
	{
		// * Unbind default "Unfold All" shortcut
		"key": "ctrl+k ctrl+j",
		"command": "-editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled",
	},
	{
		// * Rebind "Unfold All" to Ctrl+Shift+NumpadAdd
		"key": "ctrl+shift+numpad_add",
		"command": "editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled",
	},

	// ? ===== Terminal =====

	// * Toggle Terminal
	{
		// * Unbind default terminal toggle shortcut
		"key": "ctrl+`",
		"command": "-workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},
	{
		// * Rebind terminal toggle to Ctrl+Escape
		"key": "ctrl+escape",
		"command": "workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},

	// ? ===== Workspace =====

	// * Close Folder
	{
		// * Unbind default "Close Folder" shortcut
		"key": "ctrl+k f",
		"command": "-workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'",
	},
	{
		// * Rebind "Close Folder" to Ctrl+Meta+W
		"key": "ctrl+meta+w",
		"command": "workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'",
	},

	// * Zen Mode
	{
		// * Rebind Zen Mode toggle to Ctrl+Alt+Z
		"key": "ctrl+alt+z",
		"command": "workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},
	{
		// * Unbind default Zen Mode shortcut
		"key": "ctrl+k z",
		"command": "-workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},

	// ? ===== Git =====

	{
		// * Open Git Graph extension view
		"key": "ctrl+alt+g",
		"command": "git-graph.view",
	},

	{
		// * Open GitLens Commit Graph
		"key": "ctrl+alt+x",
		"command": "gitlens.showGraphPage",
	},

	{
		// * Fetch updates from remote repositories
		"key": "ctrl+g ctrl+f",
		"command": "git.fetch",
		"when": "!operationInProgress",
	},

	{
		// * Checkout another branch
		"key": "ctrl+g ctrl+c",
		"command": "git.checkout",
		"when": "!operationInProgress",
	},

	// ? ===== Editor Groups & Layout =====

	// * Focus Adjacent Editor Groups
	{
		// * Unbind default focus-above shortcut
		"key": "ctrl+k ctrl+up",
		"command": "-workbench.action.focusAboveGroup",
	},
	{
		// * Focus editor group above
		"key": "ctrl+shift+c ctrl+shift+up",
		"command": "workbench.action.focusAboveGroup",
	},

	{
		// * Unbind default focus-below shortcut
		"key": "ctrl+k ctrl+down",
		"command": "-workbench.action.focusBelowGroup",
	},
	{
		// * Focus editor group below
		"key": "ctrl+shift+c ctrl+shift+down",
		"command": "workbench.action.focusBelowGroup",
	},

	{
		// * Unbind default focus-left shortcut
		"key": "ctrl+k ctrl+left",
		"command": "-workbench.action.focusLeftGroup",
	},
	{
		// * Focus editor group on the left
		"key": "ctrl+shift+c ctrl+shift+left",
		"command": "workbench.action.focusLeftGroup",
	},

	{
		// * Unbind default focus-right shortcut
		"key": "ctrl+k ctrl+right",
		"command": "-workbench.action.focusRightGroup",
	},
	{
		// * Focus editor group on the right
		"key": "ctrl+shift+c ctrl+shift+right",
		"command": "workbench.action.focusRightGroup",
	},

	// * Move Editor Between Groups
	{
		// * Move active editor to the next group
		"key": "ctrl+alt+right",
		"command": "workbench.action.moveEditorToNextGroup",
	},
	{
		// * Move active editor to the previous group
		"key": "ctrl+alt+left",
		"command": "workbench.action.moveEditorToPreviousGroup",
	},

	// ? ===== Views & Extensions =====

	{
		// * Toggle Todo Tree view
		"key": "shift+alt+t",
		"command": "workbench.view.extension.todo-tree-container",
	},

	// ? ===== Zoom & Font Size =====

	// * Window Zoom
	{
		// * Unbind default window zoom-in shortcut
		"key": "ctrl+numpad_add",
		"command": "-workbench.action.zoomIn",
	},
	{
		// * Rebind window zoom-in to Shift+Alt+NumpadAdd
		"key": "shift+alt+numpad_add",
		"command": "workbench.action.zoomIn",
	},
	{
		// * Unbind default window zoom-out shortcut
		"key": "ctrl+numpad_subtract",
		"command": "-workbench.action.zoomOut",
	},
	{
		// * Rebind window zoom-out to Shift+Alt+NumpadSubtract
		"key": "shift+alt+numpad_subtract",
		"command": "workbench.action.zoomOut",
	},

	// * Editor Font Zoom
	{
		// * Increase editor font size
		"key": "ctrl+numpad_add",
		"command": "editor.action.fontZoomIn",
	},
	{
		// * Decrease editor font size
		"key": "ctrl+numpad_subtract",
		"command": "editor.action.fontZoomOut",
	},
	{
		// * Reset editor font size
		"key": "ctrl+numpad_multiply",
		"command": "editor.action.fontZoomReset",
	},

	// ? ===== Kiro Chat =====

	{
		// * Unbind default "Continue Chat" shortcut
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusContinueInputWithoutClear",
	},
	{
		// * Focus Kiro continue-chat input without clearing history
		"key": "ctrl+alt+l",
		"command": "kiroAgent.focusContinueInputWithoutClear",
	},

	{
		// * Unbind legacy Kiro continue-input shortcut
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusContinueInput",
		"when": "!kiroAgent.experiments.acpChat",
	},
	{
		// * Focus Kiro continue-input panel
		"key": "ctrl+alt+k",
		"command": "kiroAgent.focusContinueInput",
		"when": "!kiroAgent.experiments.acpChat",
	},

	{
		// * Unbind ACP chat input shortcut
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusChatInput",
		"when": "kiroAgent.experiments.acpChat",
	},
	{
		// * Focus ACP chat input
		"key": "ctrl+alt+k",
		"command": "kiroAgent.focusChatInput",
		"when": "kiroAgent.experiments.acpChat",
	},

	{
		// * Remove fallback Kiro chat shortcut
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusChatInput",
	},

	// * Accept AI Changes
	{
		// * Unbind default "Accept Diff" shortcut
		"key": "ctrl+shift+enter",
		"command": "-kiroAgent.acceptDiff",
	},
	{
		// * Rebind "Accept Diff" to Ctrl+Shift+Alt+Enter
		"key": "ctrl+shift+alt+enter",
		"command": "kiroAgent.acceptDiff",
	},
]
```

> **⚠️ Note:** Some keybindings assume you have certain extensions installed (e.g., `Git Graph`, `GitLens`, or `Todo Tree`). If you don’t use those extensions, you can safely remove the corresponding lines.

---

## 7. Final Steps

1. **Restart Kiro** to load all settings and keybindings.
2. **Install recommended extensions** from section 3.
3. **Verify that formatting works** – open a file and save it; Prettier should reformat according to the rules.
4. **Test Kiro AI features** – use `Ctrl+Alt+L` to open the chat panel and try a prompt.

---

## 8. Troubleshooting

| Problem                            | Solution                                                                           |
| ---------------------------------- | ---------------------------------------------------------------------------------- |
| `kiro` command not found           | Close and reopen your terminal, or log out and back in.                            |
| Extensions not loading             | Run `Developer: Reload Window` from the command palette.                           |
| Prettier not formatting on save    | Ensure Prettier extension is installed and `"editor.formatOnSave": true`.          |
| GitLens/Git Graph not showing      | Open a folder that is a Git repository.                                            |
| Kiro AI tab completion not working | Check `"kiroAgent.enableTabAutocomplete": true` and sign in to Kiro if required.   |
| `yay: command not found`           | Install `yay` first (see [AUR helper installation](https://github.com/Jguer/yay)). |

---

Your Kiro AI Editor is now ready to turn prompts into production. Enjoy the future of AI‑driven development!
