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

| Category                 | Extensions                                                                                                                                                                                                                                                                                                                              |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Core**                 | `advanced-new-file`, `better comments`, `Bracket Pair Colorizer`, `Code Spell Checker`, `CodeSnap`, `Error Lens`, `Todo Tree`, `Toggle Quotes`                                                                                                                                                                                          |
| **Git**                  | `Git Graph`, `GitLens`                                                                                                                                                                                                                                                                                                                  |
| **Linting & Formatting** | `ESLint`, `Prettier - Code formatter`, `Even Better TOML`, `inifmt`, `Black Formatter`                                                                                                                                                                                                                                                  |
| **Markdown**             | `Markdown All in One`, `Markdown Table`, `Markdown Table Prettifier`, `Markdownlint`                                                                                                                                                                                                                                                    |
| **Language Support**     | `JavaScript (ES6) code snippets`, `Nextjs snippets`, `React - Javascript snippets`, `GraphQL: Syntax Highlighting`, `HTML CSS Support`, `lua`, `vscode-proto3`, `TooltitudePb`, `Docker`, `Docker DX`, `Container Tools`, `Python`, `Python Debugger`, `Python Environments`, `Nextjs App Directory Commands`, `Nginx Config Formatter` |
| **Theming**              | `Material Icon Theme`                                                                                                                                                                                                                                                                                                                   |
| **Utilities**            | `Import Cost`, `Pretty TypeScript Errors`, `Selection Stats & Line Counter`, `Live Server`, `Persian - Code Spell Checker`                                                                                                                                                                                                              |

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
	/**** START: General ***********/
	"bracketPairColorizer.depreciation-notice": false,
	"explorer.compactFolders": false,
	"security.workspace.trust.untrustedFiles": "open",
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],
	"breadcrumbs.enabled": false,
	"kiroAgent.enableTabAutocomplete": true,
	"kiroAgent.configureMCP": "Disabled",
	/*********** END: General ****/

	/**** START: Files ***********/
	"files.trimTrailingWhitespace": true,
	"files.insertFinalNewline": true,
	"files.trimFinalNewlines": true,
	"files.autoSave": "afterDelay",
	/*********** END: Files ****/

	/**** START: Zen Mode ***********/
	"zenMode.centerLayout": false,
	"zenMode.hideLineNumbers": false,
	/*********** END: Zen Mode ****/

	/**** START: Window ***********/
	"window.titleBarStyle": "custom",
	"window.menuBarVisibility": "toggle",
	"window.newWindowDimensions": "inherit",
	/*********** END: Window ****/

	/**** START: Workbench ***********/
	"workbench.navigationControl.enabled": false,
	"workbench.iconTheme": "material-icon-theme",
	"workbench.startupEditor": "none",
	/*********** END: Workbench ****/

	/**** START: Git & GitLens ***********/
	"git.autofetch": true,
	"gitlens.graph.layout": "editor",
	"scm.defaultViewMode": "tree",
	"diffEditor.ignoreTrimWhitespace": true,
	/*********** END: Git & GitLens ****/

	/**** START: Editor ***********/
	"editor.fontFamily": "Fira Code, JetBrainsMono Nerd Font, Consolas, monospace",
	"editor.bracketPairColorization.enabled": true,
	"editor.minimap.enabled": true,
	"editor.fontLigatures": true,
	"editor.mouseWheelZoom": true,
	"editor.insertSpaces": false,
	"editor.linkedEditing": true,
	"editor.codeActionsOnSave": { "source.organizeImports": "always" },
	"editor.copyWithSyntaxHighlighting": false,
	"editor.detectIndentation": false,
	"editor.lineHeight": 1.6,
	"editor.tabSize": 2,
	"editor.indentSize": "tabSize",
	"editor.wordBasedSuggestions": "matchingDocuments",
	"editor.cursorSmoothCaretAnimation": "on",
	"editor.lightbulb.enabled": "off",
	"editor.renderLineHighlight": "all",
	"editor.matchBrackets": "never",
	"javascript.preferences.quoteStyle": "single",
	"typescript.preferences.quoteStyle": "single",
	/*********** END: Editor ****/

	/**** START: Terminal ***********/
	"terminal.integrated.env.linux": {},
	"terminal.integrated.fontFamily": "Fira Code, JetBrainsMono Nerd Font, monospace",
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

	/**** START: Formatter ***********/
	"editor.formatOnSave": true,
	"editor.formatOnType": true,
	"editor.formatOnPaste": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"[javascript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[lua]": { "editor.defaultFormatter": "sumneko.lua" },
	"[toml]": { "editor.defaultFormatter": "tamasfe.even-better-toml" },
	"[typescript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[dockercompose]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[plaintext]": { "editor.defaultFormatter": "lkrms.inifmt" },
	"[proto3]": { "editor.defaultFormatter": "zxh404.vscode-proto3" },
	"[nginx]": { "editor.defaultFormatter": "AaaaronZhou.nginx-config-formatter-vscode-extension" },
	"[python]": { "editor.defaultFormatter": "ms-python.black-formatter" },
	/*********** END: Formatter ****/
}
```

---

## 6. Custom Keybindings

Create or edit `keybindings.json` in Kiro (`Ctrl+Shift+P` → `Preferences: Open Keyboard Shortcuts (JSON)`) and add the following overrides.

```jsonc
[
	// Copy line down (Ctrl+D)
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
	// Add selection to next find match moved to Alt+D
	{ "key": "alt+d", "command": "editor.action.addSelectionToNextFindMatch", "when": "editorFocus" },
	{
		"key": "ctrl+d",
		"command": "-editor.action.addSelectionToNextFindMatch",
		"when": "editorFocus",
	},

	// Delete line (Ctrl+Y)
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
	{ "key": "ctrl+y", "command": "-redo" },

	// Block comment (Ctrl+Shift+/)
	{
		"key": "ctrl+shift+/",
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

	// Terminal toggle (Ctrl+Escape)
	{
		"key": "ctrl+escape",
		"command": "workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},
	{
		"key": "ctrl+`",
		"command": "-workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},
	{ "key": "ctrl+escape", "command": "-quickInput.hide", "when": "inQuickInput" },
	{ "key": "ctrl+shift+`", "command": "workbench.action.terminal.new" },

	// Close folder (Ctrl+Meta+W)
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
	{ "key": "ctrl+g ctrl+f", "command": "git.fetch", "when": "!operationInProgress" },
	{ "key": "ctrl+g ctrl+c", "command": "git.checkout", "when": "!operationInProgress" },

	// Format selection (Ctrl+Alt+F)
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

	// Go to line (Ctrl+G)
	{ "key": "ctrl+g", "command": "-workbench.action.gotoLine" },
	{ "key": "alt+g", "command": "workbench.action.gotoLine" },

	// Collapse explorer (Shift+Alt+E)
	{ "key": "shift+alt+e", "command": "workbench.files.action.collapseExplorerFolders" },

	// Sidebar explorer focus (Alt+E)
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

	// Focus groups (Ctrl+Shift+C prefix)
	{ "key": "ctrl+shift+c ctrl+shift+up", "command": "workbench.action.focusAboveGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+down", "command": "workbench.action.focusBelowGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+left", "command": "workbench.action.focusLeftGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+right", "command": "workbench.action.focusRightGroup" },
	{ "key": "ctrl+k ctrl+up", "command": "-workbench.action.focusAboveGroup" },
	{ "key": "ctrl+k ctrl+down", "command": "-workbench.action.focusBelowGroup" },
	{ "key": "ctrl+k ctrl+left", "command": "-workbench.action.focusLeftGroup" },
	{ "key": "ctrl+k ctrl+right", "command": "-workbench.action.focusRightGroup" },

	// Zen mode (Ctrl+Alt+Z)
	{
		"key": "ctrl+alt+z",
		"command": "workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},
	{
		"key": "ctrl+k z",
		"command": "-workbench.action.toggleZenMode",
		"when": "!isAuxiliaryWindowFocusedContext",
	},

	// Todo tree (Shift+Alt+T)
	{ "key": "shift+alt+t", "command": "workbench.view.extension.todo-tree-container" },

	// Zoom
	{ "key": "ctrl+numpad_add", "command": "editor.action.fontZoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "editor.action.fontZoomOut" },
	{ "key": "ctrl+numpad_multiply", "command": "editor.action.fontZoomReset" },
	{ "key": "shift+alt+numpad_add", "command": "workbench.action.zoomIn" },
	{ "key": "shift+alt+numpad_subtract", "command": "workbench.action.zoomOut" },
	{ "key": "ctrl+numpad_add", "command": "-workbench.action.zoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "-workbench.action.zoomOut" },

	// Move editor between groups
	{ "key": "ctrl+alt+right", "command": "workbench.action.moveEditorToNextGroup" },
	{ "key": "ctrl+alt+left", "command": "workbench.action.moveEditorToPreviousGroup" },

	// Kiro AI chat
	{ "key": "ctrl+alt+l", "command": "kiroAgent.focusContinueInputWithoutClear" },
	{ "key": "ctrl+shift+l", "command": "-kiroAgent.focusContinueInputWithoutClear" },
	{
		"key": "ctrl+alt+k",
		"command": "kiroAgent.focusContinueInput",
		"when": "!kiroAgent.experiments.acpChat",
	},
	{
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusContinueInput",
		"when": "!kiroAgent.experiments.acpChat",
	},
	{
		"key": "ctrl+alt+k",
		"command": "kiroAgent.focusChatInput",
		"when": "kiroAgent.experiments.acpChat",
	},
	{
		"key": "ctrl+shift+l",
		"command": "-kiroAgent.focusChatInput",
		"when": "kiroAgent.experiments.acpChat",
	},

	// Accept Kiro diffs
	{ "key": "ctrl+shift+alt+enter", "command": "kiroAgent.acceptDiff" },
	{ "key": "ctrl+shift+enter", "command": "-kiroAgent.acceptDiff" },
]
```

> **⚠️ Note:** Some keybindings reference extensions like `Git Graph`, `GitLens`, or `Todo Tree`. If you do not use those extensions, remove the corresponding lines.

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
