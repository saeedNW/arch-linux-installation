# Visual Studio Code (VS Code) Setup Guide

Visual Studio Code is a popular source‑code editor developed by Microsoft. This guide covers installation, essential extensions, recommended settings, and custom keybindings for a productive development environment.

---

## Table of Contents

- [Visual Studio Code (VS Code) Setup Guide](#visual-studio-code-vs-code-setup-guide)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Post‑Installation (GNOME Only)](#2-postinstallation-gnome-only)
	- [3. Recommended Extensions](#3-recommended-extensions)
	- [4. Theme](#4-theme)
	- [5. Recommended Settings](#5-recommended-settings)
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

| Category                 | Extensions                                                                                                                                                                                                                                                                 |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Core**                 | `advanced-new-file-plus`, `better comments Next`, `Bracket Pair Colorizer`, `Code Spell Checker`, `CodeSnap-plus`, `Error Lens`, `Todo Tree`, `Toggle Quotes`                                                                                                              |
| **Git**                  | `Git Graph`, `GitLens`                                                                                                                                                                                                                                                     |
| **Linting & Formatting** | `ESLint`, `Prettier - Code formatter`, `Even Better TOML`, `inifmt`, `Black Formatter`                                                                                                                                                                                     |
| **Markdown**             | `Markdown All in One`, `Markdown Table`, `Markdown Table Prettifier`, `Markdownlint`, `Markdown Preview Mermaid Support`                                                                                                                                                   |
| **Language Support**     | `JavaScript (ES6) code snippets`, `Nextjs snippets`, `node-snippets`, `ES7+ React/Redux/React-Native snippets`, `HTML CSS Support`, `lua`, `Protobuf VSC`, `Docker`, `Docker DX`, `Container Tools`, `Python`, `Python Debugger`, `Python Environments`, `nginx.conf hint` |
| **Theming & Icons**      | `Material Icon Theme`, `Neo Kiro Theme`                                                                                                                                                                                                                                    |
| **Utilities**            | `Import Cost`, `Persian - Code Spell Checker`, `Pretty TypeScript Errors`, `Selection Stats & Line Counter`                                                                                                                                                                |

> **💡 Tip:** You can install all of them at once by searching for each name in the Extensions view (`Ctrl+Shift+X`) and clicking **Install**.

---

## 4. Theme

- **Color Theme:** [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
- **Icon Theme:** `Atom Material Icons` (or any other you prefer)

Set them in your `settings.json` (see next section).

---

## 5. Recommended Settings

Create or edit your `settings.json` (`Ctrl+Shift+P` → `Preferences: Open Settings (JSON)`) and add the following configuration.

> **⚠️ Note:** The code below uses **JSON with comments** (JSONC). VS Code fully supports comments in settings files.

```jsonc
{
	/**** START: General ***********/
	"RainbowBrackets.depreciation-notice": false,
	"explorer.compactFolders": false,
	"todo-tree.highlights.enabled": false,
	"security.workspace.trust.untrustedFiles": "open",
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],
	"diffEditor.renderSideBySide": false,
	"chat.commandCenter.enabled": false,
	"extensions.ignoreRecommendations": true,
	"breadcrumbs.enabled": false,
	/*********** END: General ****/

	/**** START: Files ***********/
	"files.trimTrailingWhitespace": true,
	"files.insertFinalNewline": true,
	"files.trimFinalNewlines": true,
	"files.autoSave": "afterDelay",
	/*********** END: Files ****/

	/**** START: Zen Mode ***********/
	"zenMode.centerLayout": false,
	"zenMode.hideLineNumbers": true,
	/*********** END: Zen Mode ****/

	/**** START: Window ***********/
	"window.titleBarStyle": "custom",
	"window.menuBarVisibility": "toggle",
	"window.newWindowDimensions": "inherit",
	/*********** END: Window ****/

	/**** START: Workbench ***********/
	"workbench.layoutControl.enabled": false,
	"workbench.navigationControl.enabled": false,
	"workbench.tips.enabled": false,
	"workbench.iconTheme": "a-file-icon-vscode",
	"workbench.productIconTheme": "a-file-icon-vscode-product-icon-theme",
	"workbench.colorTheme": "Nord",
	"workbench.startupEditor": "none",
	/*********** END: Workbench ****/

	/**** START: Git & GitLens ***********/
	"git.autofetch": true,
	"gitlens.graph.layout": "editor",
	"scm.defaultViewMode": "tree",
	/*********** END: Git & GitLens ****/

	/**** START: Editor ***********/
	"editor.fontLigatures": true,
	"editor.mouseWheelZoom": true,
	"editor.insertSpaces": false,
	"editor.linkedEditing": true,
	"editor.copyWithSyntaxHighlighting": false,
	"editor.detectIndentation": false,
	"editor.glyphMargin": false,
	"editor.lineHeight": 2,
	"editor.tabSize": 2,
	"editor.fontFamily": "'JetBrainsMono Nerd Font', monospace",
	"editor.indentSize": "tabSize",
	"editor.wordBasedSuggestions": "matchingDocuments",
	"editor.cursorSmoothCaretAnimation": "on",
	"editor.lightbulb.enabled": "off",
	"editor.renderLineHighlight": "all",
	"editor.matchBrackets": "never",
	"editor.inlineSuggest.suppressSuggestions": true,
	"javascript.preferences.quoteStyle": "single",
	"typescript.preferences.quoteStyle": "single",
	"editor.tokenColorCustomizations": {
		"textMateRules": [
			{ "name": "string color", "scope": ["string"], "settings": { "foreground": "#fdee00" } },
			{ "name": "variable color", "scope": ["variable"], "settings": { "foreground": "#ffffee" } },
			{
				"name": "parameter color",
				"scope": ["variable.parameter"],
				"settings": { "foreground": "#ffd390" },
			},
			{
				"name": "number color in env files",
				"scope": ["source.ini"],
				"settings": { "foreground": "#76fd00" },
			},
		],
	},
	/*********** END: Editor ****/

	/**** START: Terminal ***********/
	"terminal.integrated.env.linux": {},
	"terminal.integrated.fontFamily": "JetBrainsMono Nerd Font",
	"terminal.integrated.tabs.enabled": false,
	/*********** END: Terminal ****/

	/**** START: Prettier ***********/
	"prettier.useTabs": true,
	"prettier.tabWidth": 2,
	"prettier.endOfLine": "lf",
	"prettier.singleQuote": true,
	"prettier.trailingComma": "all",
	"prettier.bracketSpacing": true,
	"prettier.semi": true,
	"prettier.arrowParens": "always",
	"prettier.printWidth": 100,
	/*********** END: Prettier ****/

	/**** START: cSpell ***********/
	"cSpell.userWords": ["fastify", "liara"],
	"cSpell.language": "en,fa",
	/*********** END: cSpell ****/

	/**** START: Selected line ***********/
	"selectline.alignment": "right",
	/*********** END: Selected line ****/

	/**** START: Formatter ***********/
	"editor.formatOnSave": true,
	"editor.formatOnType": true,
	"editor.formatOnPaste": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"[javascript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[lua]": { "editor.defaultFormatter": "yinfei.luahelper" },
	"[toml]": { "editor.defaultFormatter": "tamasfe.even-better-toml" },
	"[typescript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[dockercompose]": { "editor.defaultFormatter": "ms-azuretools.vscode-docker" },
	"[plaintext]": { "editor.defaultFormatter": "lkrms.inifmt" },
	/*********** END: Formatter ****/

	/**** START: Github copilot ***********/
	"github.copilot.enable": {
		"*": false,
		"plaintext": false,
		"markdown": false,
		"scminput": false,
	},
	/**** END: Github copilot ***********/
}
```

> **💡 Tip:** The settings above disable GitHub Copilot by default. If you have a Copilot subscription, you can enable it or remove those lines.

---

## 6. Custom Keybindings

Create or edit your `keybindings.json` (`Ctrl+Shift+P` → `Preferences: Open Keyboard Shortcuts (JSON)`) and add the following overrides. These remap many common actions to more convenient shortcuts.

```jsonc
[
	// Copy line down
	{
		"key": "ctrl+d",
		"command": "editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly",
	},
	{
		"key": "ctrl+shift+alt+down",
		"command": "-editor.action.copyLinesDownAction",
		"when": "editorTextFocus && !editorReadonly",
	},
	// Add selection to next find match (old Ctrl+D) moved to Alt+D
	{ "key": "alt+d", "command": "editor.action.addSelectionToNextFindMatch", "when": "editorFocus" },
	{
		"key": "ctrl+d",
		"command": "-editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus",
	},

	// Delete line
	{
		"key": "ctrl+y",
		"command": "editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly",
	},
	{
		"key": "ctrl+shift+k",
		"command": "-editor.action.deleteLines",
		"when": "textInputFocus && !editorReadonly",
	},
	{ "key": "ctrl+y", "command": "-redo" }, // remove original redo binding

	// Nested comments
	{
		"key": "ctrl+shift+/",
		"command": "extension.nestComments",
		"when": "editorHasSelection && editorTextFocus",
	},
	{
		"key": "ctrl+alt+/",
		"command": "-extension.nestComments",
		"when": "editorHasSelection && editorTextFocus",
	},

	// Block comment
	{
		"key": "ctrl+alt+/",
		"command": "editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly",
	},
	{
		"key": "ctrl+shift+a",
		"command": "-editor.action.blockComment",
		"when": "editorTextFocus && !editorReadonly",
	},

	// Fold / unfold all
	{
		"key": "ctrl+shift+numpad_subtract",
		"command": "editor.foldAll",
		"when": "editorTextFocus && foldingEnabled",
	},
	{
		"key": "ctrl+shift+numpad_add",
		"command": "editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled",
	},
	{
		"key": "ctrl+k ctrl+0",
		"command": "-editor.foldAll",
		"when": "editorTextFocus && foldingEnabled",
	},
	{
		"key": "ctrl+k ctrl+j",
		"command": "-editor.unfoldAll",
		"when": "editorTextFocus && foldingEnabled",
	},

	// Terminal toggle
	{ "key": "ctrl+alt+`", "command": "workbench.action.terminal.toggleTerminal" },
	{
		"key": "ctrl+`",
		"command": "-workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},

	// Close folder
	{
		"key": "ctrl+meta+w",
		"command": "workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'",
	},
	{
		"key": "ctrl+k f",
		"command": "-workbench.action.closeFolder",
		"when": "emptyWorkspaceSupport && workbenchState != 'empty'",
	},

	// Git graph
	{ "key": "ctrl+alt+g", "command": "git-graph.view" },
	{ "key": "ctrl+alt+x", "command": "gitlens.showGraphPage" },

	// Format selection
	{
		"key": "ctrl+alt+f",
		"command": "editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly",
	},
	{
		"key": "ctrl+k ctrl+f",
		"command": "-editor.action.formatSelection",
		"when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly",
	},

	// Go to line
	{ "key": "ctrl+g", "command": "-workbench.action.gotoLine" },
	{ "key": "alt+g", "command": "workbench.action.gotoLine" },

	// Collapse explorer
	{ "key": "shift+alt+e", "command": "workbench.files.action.collapseExplorerFolders" },

	// Sidebar explorer focus
	{
		"key": "alt+e",
		"command": "workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled",
	},
	{
		"key": "ctrl+shift+e",
		"command": "-workbench.view.explorer",
		"when": "viewContainer.workbench.view.explorer.enabled",
	},

	// Focus groups (use with Ctrl+Shift+C prefix)
	{ "key": "ctrl+shift+c ctrl+shift+up", "command": "workbench.action.focusAboveGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+down", "command": "workbench.action.focusBelowGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+left", "command": "workbench.action.focusLeftGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+right", "command": "workbench.action.focusRightGroup" },
	{ "key": "ctrl+k ctrl+up", "command": "-workbench.action.focusAboveGroup" },
	{ "key": "ctrl+k ctrl+down", "command": "-workbench.action.focusBelowGroup" },
	{ "key": "ctrl+k ctrl+left", "command": "-workbench.action.focusLeftGroup" },
	{ "key": "ctrl+k ctrl+right", "command": "-workbench.action.focusRightGroup" },

	// Zen mode toggle
	{
		"key": "ctrl+k z",
		"command": "-workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},
	{
		"key": "ctrl+alt+z",
		"command": "workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},

	// Remove overtype toggle conflict
	{ "key": "ctrl+shift+i", "command": "-overtype.toggle", "when": "editorFocus" },

	// Todo tree
	{ "key": "shift+alt+t", "command": "workbench.view.extension.todo-tree-container" },

	// Window zoom (editor + window)
	{ "key": "ctrl+numpad_add", "command": "editor.action.fontZoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "editor.action.fontZoomOut" },
	{ "key": "ctrl+numpad_multiply", "command": "editor.action.fontZoomReset" },
	{ "key": "shift+alt+numpad_add", "command": "workbench.action.zoomIn" },
	{ "key": "shift+alt+numpad_subtract", "command": "workbench.action.zoomOut" },
	{ "key": "ctrl+numpad_add", "command": "-workbench.action.zoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "-workbench.action.zoomOut" },

	// Cody AI (if installed)
	{
		"key": "shift+alt+a",
		"command": "cody.menu.custom-commands",
		"when": "cody.activated && workspaceFolderCount > 0",
	},
	{
		"key": "shift+alt+c",
		"command": "-cody.menu.custom-commands",
		"when": "cody.activated && workspaceFolderCount > 0",
	},
	{ "key": "shift+alt+c", "command": "cody.chat.focus" },

	// Run tasks
	{ "key": "ctrl+alt+s", "command": "workbench.action.tasks.runTask" },
]
```

> **⚠️ Note:** Some keybindings assume you have certain extensions installed (e.g., `git-graph`, `cody`). If you don’t use those extensions, you can safely remove the corresponding lines.

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
