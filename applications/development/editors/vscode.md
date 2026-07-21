# Visual Studio Code (VS Code) Setup Guide

Visual Studio Code is a popular source‑code editor developed by Microsoft. This guide covers installation, essential extensions, recommended settings, and custom keybindings for a productive development environment.

---

## Table of Contents

- [Visual Studio Code (VS Code) Setup Guide](#visual-studio-code-vs-code-setup-guide)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Post‑Installation (GNOME Only)](#2-postinstallation-gnome-only)
	- [3. Recommended Extensions](#3-recommended-extensions)
	- [4. Recommended Settings](#4-recommended-settings)
	- [5. Custom CSS](#5-custom-css)
		- [Download](#download)
		- [1. Create the CSS directory](#1-create-the-css-directory)
		- [2. Copy the stylesheet](#2-copy-the-stylesheet)
		- [3. Configure VS Code](#3-configure-vs-code)
		- [4. Enable the custom CSS](#4-enable-the-custom-css)
	- [6. Custom Keybindings](#6-custom-keybindings)
	- [7. Final Steps](#7-final-steps)
	- [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install `visual-studio-code-bin` from the AUR using `yay` (or your preferred AUR helper):

```bash
yay -S visual-studio-code-bin
```

> **💡 Tip:** To use VS Code from the terminal, the command is `code`.

---

## 2. Post‑Installation (GNOME Only)

On **GNOME**, after installing VS Code, your system’s default file manager may change to VS Code. To revert it back to Nautilus, run:

```bash
xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

For other desktop environments (KDE Plasma, XFCE, etc.), this step is not needed.

---

## 3. Recommended Extensions

The following extensions are recommended for a modern development workflow. They cover linting, formatting, Git integration, markdown, language support, and more.

| Category                 | Extensions                                                                                                                                                                                      |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Core**                 | `advanced-new-file-plus`, `Better Comments Next`, `Bracket Pair Colorizer 3`, `Code Spell Checker`, `Persian - Code Spell Checker`, `CodeSnap-plus`, `Error Lens`, `Todo Tree`, `Toggle Quotes` |
| **Git**                  | `Git Graph`, `GitLens`                                                                                                                                                                          |
| **Linting & Formatting** | `ESLint`, `Prettier - Code formatter`, `Even Better TOML`, `inifmt`, `Black Formatter`                                                                                                          |
| **Markdown**             | `Markdown All in One`, `Markdown Table`, `Markdown Table Prettifier`, `Markdownlint`, `Markdown Preview Mermaid Support`                                                                        |
| **Language Support**     | `HTML CSS Support`, `Lua`, `Protobuf VSC`, `Python`, `Python Debugger`, `Python Environments`, `nginx.conf hint`, `Pretty TypeScript Errors`, `Import Cost`                                     |
| **Snippets**             | `JavaScript (ES6) code snippets`, `Node snippets`, `ES7+ React/Redux/React-Native snippets`, `Next.js snippets`                                                                                 |
| **Containers & DevOps**  | `Docker`, `Docker DX`, `Container Tools`, Remote - SSH                                                                                                                                          |
| **Theming & Icons**      | `Material Icon Theme`, `Kiro Theme`, `Custom CSS and JS Loader`                                                                                                                                 |
| **Utilities**            | `Selection Stats & Line Counter`                                                                                                                                                                |

> **💡 Tip:** You can install all of them at once by searching for each name in the Extensions view (`Ctrl+Shift+X`) and clicking **Install**.

---

## 4. Recommended Settings

Create or edit your `settings.json` (`Ctrl+Shift+P` → `Preferences: Open Settings (JSON)`) and add the following configuration.

> **⚠️ Note:** The code below uses **JSON with comments** (JSONC). VS Code fully supports comments in settings files.

```json
{
	// ? ===== General =====

	// * Open files from untrusted workspaces without prompting
	"security.workspace.trust.untrustedFiles": "open",

	// * Disable compact folder nesting in Explorer
	"explorer.compactFolders": false,

	// * Hide editor breadcrumbs navigation
	"breadcrumbs.enabled": false,

	// * Show Error Lens annotations for errors, warnings, and hints
	"errorLens.enabledDiagnosticLevels": ["error", "warning", "hint"],

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

	// * Use Neo Kiro Dark theme
	"workbench.colorTheme": "Kiro Dark",

	// * Disable workbench tips and onboarding hints
	"workbench.tips.enabled": false,

	// * Disable navigation controls in the workbench header
	"workbench.navigationControl.enabled": false,

	// * Use Material Icon Theme
	"workbench.iconTheme": "material-icon-theme",

	// * Skip the welcome/startup screen
	"workbench.startupEditor": "none",

	// * Customize workbench UI colors
	"workbench.colorCustomizations": {
		/* ------------------------------------------------------------------
		 * Title Bar
		 * ------------------------------------------------------------------ */
		"titleBar.activeBackground": "#19151c",
		"titleBar.inactiveBackground": "#151218",
		"titleBar.activeForeground": "#ECE9F2",
		"titleBar.inactiveForeground": "#9F99AB",
		"titleBar.border": "#27212d",

		/* ------------------------------------------------------------------
		 * Side Bar
		 * ------------------------------------------------------------------ */
		"sideBar.foreground": "#e5e4e8",
		"sideBarTitle.foreground": "#ECE9F2",

		/* ------------------------------------------------------------------
		 * Status Bar
		 * ------------------------------------------------------------------ */
		"statusBar.background": "#19151c",
		"statusBar.foreground": "#ECE9F2",
		"statusBar.border": "#27212d",

		"statusBarItem.hoverBackground": "#2A2330",
		"statusBarItem.activeBackground": "#32293A",

		/* ------------------------------------------------------------------
		 * Panels
		 * ------------------------------------------------------------------ */
		"panel.background": "#1d1821",
		"panel.border": "#27212d",
		"panelTitle.activeForeground": "#ECE9F2",
		"panelTitle.inactiveForeground": "#8E889B",

		/* ------------------------------------------------------------------
		 * Editor Groups
		 * ------------------------------------------------------------------ */
		"editorGroup.border": "#27212d",
		"editorGroupHeader.border": "#27212d",

		/* ------------------------------------------------------------------
		 * Tabs
		 * ------------------------------------------------------------------ */
		"tab.border": "#27212d",
		"tab.activeBorderTop": "#7C63D4",

		/* ------------------------------------------------------------------
		 * Command Center
		 * ------------------------------------------------------------------ */
		"commandCenter.background": "#241F2A",
		"commandCenter.border": "#332B3B"
	},

	// ? ===== Git & Source Control =====

	// * Automatically fetch remote changes
	"git.autofetch": true,

	// * AI model used by GitLens
	"gitlens.ai.model": "vscode",

	// * VS Code AI provider/model used by GitLens
	"gitlens.ai.vscode.model": "copilot:gpt-4o-mini",

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
		"source.organizeImports": "always"
	},

	// * Prefer single quotes in JavaScript & TypeScript auto-imports
	"js/ts.preferences.quoteStyle": "single",

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

	// * Docker Compose
	"[dockercompose]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},

	// * JavaScript
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},

	// * Lua
	"[lua]": {
		"editor.defaultFormatter": "sumneko.lua"
	},

	// * NGINX Configuration
	"[NGINX]": {
		"editor.defaultFormatter": "hangxingliu.vscode-nginx-conf-hint"
	},

	// * Plain Text
	"[plaintext]": {
		"editor.defaultFormatter": "lkrms.inifmt"
	},

	// * Protocol Buffers
	"[proto3]": {
		"editor.defaultFormatter": "DrBlury.protobuf-vsc"
	},

	// * Python
	"[python]": {
		"editor.defaultFormatter": "ms-python.black-formatter"
	},

	// * TOML
	"[toml]": {
		"editor.defaultFormatter": "tamasfe.even-better-toml"
	},

	// * TypeScript
	"[typescript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},

	// ? ===== Todo Tree =====

	// * Path to the ripgrep executable (required on Arch Linux/VSCodium)
	"todo-tree.ripgrep.ripgrep": "/usr/bin/rg",

	// ? ===== Kilo Code =====

	// * Skip certain commands in the integrated terminal
	"terminal.integrated.commandsToSkipShell": [
		"kilo-code.new.agentManagerOpen",
		"kilo-code.new.agentManager.showTerminal"
	],

	// * Disable Kilo Code's agent work style
	"kilo-code.new.agentWorkStyle": "unset",

	// ? ===== Custom CSS & JS =====

	// * Apply custom UI styling from a local CSS file
	"vscode_custom_css.imports": ["file://${userHome}/.config/tweaks/vscode/style.css"]
}
```

---

## 5. Custom CSS

This guide uses the **Custom CSS and JS Loader** extension to apply additional UI tweaks that cannot be configured through `settings.json` alone.

### Download

I've included the custom stylesheet I use, which you can download here:

- **[`style.css`](../../../assets/dotfiles/vscode/style.css)**

> **💡 Tip:** Save the file as `~/.config/tweaks/vscode/style.css` so it matches the configuration used in this guide.

### 1. Create the CSS directory

Create a directory to store your custom styles:

```bash
mkdir -p ~/.config/tweaks/vscode
```

### 2. Copy the stylesheet

Move or copy the downloaded file to:

```text
~/.config/tweaks/vscode/style.css
```

### 3. Configure VS Code

The following setting (already included in the configuration from the previous section) tells the extension to load your stylesheet:

```jsonc
"vscode_custom_css.imports": [
	"file://${userHome}/.config/tweaks/vscode/style.css"
]
```

### 4. Enable the custom CSS

After placing the stylesheet:

1. Open the Command Palette (`Ctrl+Shift+P`).
2. Run **Enable Custom CSS and JS**.
3. Restart or reload VS Code.

> **⚠️ Note:** Every time VS Code updates, you'll typically need to run **Enable Custom CSS and JS** again because updates restore the original application files.

---

## 6. Custom Keybindings

Create or edit your `keybindings.json` (`Ctrl+Shift+P` → `Preferences: Open Keyboard Shortcuts (JSON)`) and add the following overrides. These remap many common actions to more convenient shortcuts.

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

	// * Format Document
	{
		"key": "alt+a",
		"command": "editor.action.formatDocument",
		"when": "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor",
	},

	// * Disable Format Document Fallback
	{
		"key": "alt+a",
		"command": "editor.action.formatDocument.none",
		"when": "editorTextFocus && !editorHasDocumentFormattingProvider && !editorReadonly",
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

	// ? ===== Remote Development =====

	// * Open Empty SSH Remote Window
	{
		"key": "shift+alt+r",
		"command": "opensshremotes.openEmptyWindow",
	},
]
```

> **⚠️ Note:** Some keybindings assume you have certain extensions installed (e.g., `Git Graph`, `GitLens`, or `Todo Tree`). If you don’t use those extensions, you can safely remove the corresponding lines.

---

## 7. Final Steps

1. **Reload VS Code** (or restart it) for all settings and keybindings to take effect.
2. **Install the recommended extensions** listed in section 3 (manually or via the Extensions view).
3. **Set your preferred terminal font** – the configuration already uses `JetBrainsMono Nerd Font`. Ensure you have that font installed (see the [Terminal Setup Guide](./terminal.md) for font installation).
4. **Verify that formatting works** – open a JavaScript/TypeScript file and save it; Prettier should reformat according to the rules.

---

## 8. Troubleshooting

| Problem                                     | Solution                                                                                                                                                                                       |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `code` command not found in terminal        | Close and reopen your terminal, or log out and back in. The `code` binary is usually added to `PATH` automatically.                                                                            |
| Extensions not loading / settings ignored   | Ensure your `settings.json` and `keybindings.json` are valid JSON (with comments allowed). Open the command palette and run `Developer: Reload Window`.                                        |
| Prettier not formatting on save             | Check that Prettier extension is installed and enabled. Also verify that `"editor.formatOnSave": true` and `"editor.defaultFormatter"` is set to Prettier for the file type.                   |
| GitLens or Git Graph not showing            | Make sure you have opened a folder that is a Git repository. These extensions only activate in a Git workspace.                                                                                |
| Keybindings conflict with default shortcuts | If a custom keybinding doesn’t work, check `Preferences: Keyboard Shortcuts` and search for the command to see which binding is active.                                                        |
| VS Code opens files very slowly             | Disable unused extensions, especially heavy ones like GitLens or Copilot if not needed. Also check if you have many `node_modules` folders being indexed – add them to `files.watcherExclude`. |

---

Your Visual Studio Code is now fully configured for a productive development environment. Enjoy coding!
