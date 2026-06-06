# Cursor AI Editor Setup Guide

Cursor AI Editor is an advanced, AI‑powered code editor built on VS Code. It provides intelligent code suggestions, AI chat, and modern development features while being fully compatible with VS Code extensions and settings.

> **ℹ️ Note:** This guide assumes you are using **Arch Linux** or an Arch‑based distribution (like EndeavourOS). Package manager commands (`yay`) are specific to Arch.

---

## Table of Contents

- [Cursor AI Editor Setup Guide](#cursor-ai-editor-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Cursor](#2-launching-cursor)
  - [3. Recommended Extensions](#3-recommended-extensions)
  - [4. Theme](#4-theme)
  - [5. Recommended Settings](#5-recommended-settings)
  - [6. Custom Keybindings](#6-custom-keybindings)
  - [7. Final Steps](#7-final-steps)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install `cursor-bin` from the AUR using `yay` (or your preferred AUR helper):

```bash
yay -S cursor-bin
```

> **💡 Tip:** Cursor is updated frequently. To update it later, run `yay -Syu` (the AUR package will be updated along with other packages).

---

## 2. Launching Cursor

After installation, you can launch Cursor:

- From your application menu (search for **Cursor**)
- From the terminal: `cursor`

> **⚠️ Note:** If the `cursor` command is not found, close and reopen your terminal, or log out and back in.

---

## 3. Recommended Extensions

Because Cursor is based on VS Code, it supports **all VS Code extensions** from the [Open VSX Registry](https://open-vsx.org/) (and can also use the Microsoft Marketplace with some configuration). The following extensions are recommended for a productive environment. You can install them via the Extensions view (`Ctrl+Shift+X`) in Cursor.

| Category                 | Extensions                                                                                                                                                                                                                   |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Core**                 | `advanced-new-file`, `better comments`, `Code Spell Checker`, `Error Lens`, `Todo Tree`                                                                                                                                      |
| **Git**                  | `Git Graph`, `GitLens`                                                                                                                                                                                                       |
| **Linting & Formatting** | `ESLint`, `Prettier`, `Even Better TOML`, `Prettify Json`, `inifmt`                                                                                                                                                          |
| **Markdown**             | `Markdown All in One`, `Markdown Preview Github Styling`, `Markdown Table`, `Markdown Table Prettifier`, `Markdownlint`                                                                                                      |
| **Language Support**     | `JavaScript (ES6) code snippets`, `node-snippets`, `GraphQL`, `HTML CSS Support`, `lua`, `Proto Lint`, `vscode-proto3`, `Docker`, `Docker DX`                                                                                |
| **Theming & Icons**      | `Atom Material Icons`, `Nord Theme`                                                                                                                                                                                          |
| **Utilities**            | `CodeSnap`, `Explorer Exclude`, `Ignore files`, `Import Cost`, `Nested Comments`, `Persian - Code Spell Checker`, `Pretty TypeScript Errors`, `Rainbow Brackets`, `Select Line Status Bar`, `Toggle Quotes`, `Settings Sync` |

> **💡 Tip:** To sync your settings across machines, consider using the **Settings Sync** extension (`Shan/code-settings-sync`).

---

## 4. Theme

- **Color Theme:** [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
- **Icon Theme:** `Atom Material Icons`

These are set in the `settings.json` (see next section).

---

## 5. Recommended Settings

Create or edit your `settings.json` in Cursor (`Ctrl+Shift+P` → `Preferences: Open Settings (JSON)`) and add the following configuration. It is very similar to the VS Code settings, with a few Cursor‑specific additions.

> **⚠️ Note:** The code below uses **JSON with comments** (JSONC), which is fully supported in Cursor.

```jsonc
{
	/**** START: General ***********/
	"RainbowBrackets.depreciation-notice": false,
	"explorer.compactFolders": false,
	"todo-tree.highlights.enabled": false,
	"security.workspace.trust.untrustedFiles": "open",
	"errorLens.enabledDiagnosticLevels": ["error", "warning"],
	"extensions.ignoreRecommendations": true,
	"breadcrumbs.enabled": false,
	"docker.extension.enableComposeLanguageServer": false,
	"cursor.cpp.disabledLanguages": ["plaintext"], // allows Cursor Tab to work with .txt/.md files
	"cursor.composer.shouldChimeAfterChatFinishes": true,
	/*********** END: General ****/

	/**** START: Files ***********/
	"files.trimTrailingWhitespace": true,
	"files.insertFinalNewline": true,
	"files.trimFinalNewlines": true,
	"files.autoSave": "afterDelay",
	"update.releaseTrack": "prerelease", // get early access to new features
	/*********** END: Files ****/

	/**** START: Zen Mode ***********/
	"zenMode.centerLayout": false,
	"zenMode.hideLineNumbers": false,
	/*********** END: Zen Mode ****/

	/**** START: Window ***********/
	"window.commandCenter": true,
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
	"diffEditor.ignoreTrimWhitespace": false,
	/*********** END: Git & GitLens ****/

	/**** START: Editor ***********/
	"editor.minimap.enabled": true,
	"editor.fontLigatures": true,
	"editor.mouseWheelZoom": true,
	"editor.insertSpaces": false,
	"editor.linkedEditing": true,
	"editor.codeActionsOnSave": { "source.organizeImports": "always" },
	"editor.copyWithSyntaxHighlighting": false,
	"editor.detectIndentation": false,
	"editor.glyphMargin": false,
	"editor.lineHeight": 2,
	"editor.tabSize": 2,
	"editor.fontFamily": "Fira Code, JetBrainsMono Nerd Font, Consolas, monospace",
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
	"[dockercompose]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
	"[plaintext]": { "editor.defaultFormatter": "lkrms.inifmt" },
	"[proto3]": { "editor.defaultFormatter": "zxh404.vscode-proto3" },
	"[NGINX]": { "editor.defaultFormatter": "hangxingliu.vscode-nginx-conf-hint" },
	/*********** END: Formatter ****/

	/**** START: Sync ***********/
	"sync.autoUpload": true,
	"sync.autoDownload": true,
	"sync.quietSync": true,
	/*********** END: Sync ****/
}
```

> **💡 Tip:** The `cursor.cpp.disabledLanguages` setting prevents the Cursor Tab AI from interfering with plaintext files (like logs or `.txt`).

---

## 6. Custom Keybindings

Create or edit your `keybindings.json` in Cursor (`Ctrl+Shift+P` → `Preferences: Open Keyboard Shortcuts (JSON)`) and add the following overrides. These remap many common actions for a more efficient workflow.

```jsonc
[
	// Copy line down (use Ctrl+D instead of Ctrl+Shift+Alt+Down)
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

	// Delete line (use Ctrl+Y instead of Ctrl+Shift+K)
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

	// Nested comments (Ctrl+Shift+/)
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

	// Block comment (Ctrl+Alt+/)
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

	// Terminal toggle (Shift+` instead of Ctrl+`)
	{ "key": "shift+`", "command": "workbench.action.terminal.toggleTerminal" },
	{
		"key": "ctrl+`",
		"command": "-workbench.action.terminal.toggleTerminal",
		"when": "terminal.active",
	},
	// New terminal (Ctrl+Shift+`)
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

	// Git graph (Ctrl+Alt+G) and GitLens graph (Ctrl+Alt+X)
	{ "key": "ctrl+alt+g", "command": "git-graph.view" },
	{ "key": "ctrl+alt+x", "command": "gitlens.showGraphPage" },

	// Git fetch and checkout
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

	// Focus groups (prefixed with Ctrl+Shift+C)
	{ "key": "ctrl+shift+c ctrl+shift+up", "command": "workbench.action.focusAboveGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+down", "command": "workbench.action.focusBelowGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+left", "command": "workbench.action.focusLeftGroup" },
	{ "key": "ctrl+shift+c ctrl+shift+right", "command": "workbench.action.focusRightGroup" },
	{ "key": "ctrl+k ctrl+up", "command": "-workbench.action.focusAboveGroup" },
	{ "key": "ctrl+k ctrl+down", "command": "-workbench.action.focusBelowGroup" },
	{ "key": "ctrl+k ctrl+left", "command": "-workbench.action.focusLeftGroup" },
	{ "key": "ctrl+k ctrl+right", "command": "-workbench.action.focusRightGroup" },

	// Zen mode toggle (Ctrl+Alt+Z)
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

	// Zoom (editor font vs window zoom)
	{ "key": "ctrl+numpad_add", "command": "editor.action.fontZoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "editor.action.fontZoomOut" },
	{ "key": "ctrl+numpad_multiply", "command": "editor.action.fontZoomReset" },
	{ "key": "shift+alt+numpad_add", "command": "workbench.action.zoomIn" },
	{ "key": "shift+alt+numpad_subtract", "command": "workbench.action.zoomOut" },
	{ "key": "ctrl+numpad_add", "command": "-workbench.action.zoomIn" },
	{ "key": "ctrl+numpad_subtract", "command": "-workbench.action.zoomOut" },

	// Move editor to next/previous group (Ctrl+Alt+Right/Left)
	{ "key": "ctrl+alt+right", "command": "workbench.action.moveEditorToNextGroup" },
	{ "key": "ctrl+alt+left", "command": "workbench.action.moveEditorToPreviousGroup" },

	// Cursor AI Chat (Ctrl+Alt+L)
	{ "key": "ctrl+alt+l", "command": "composer.newAgentChat" },
	{
		"key": "ctrl+alt+i",
		"command": "-workbench.panel.chat",
		"when": "workbench.panel.chat.view.copilot.active",
	},
	{ "key": "ctrl+shift+i", "command": "-composer.newAgentChat" },
	{ "key": "ctrl+shift+l", "command": "-composer.newAgentChat" },

	// Add selected code to chat (Shift+Alt+L)
	{
		"key": "shift+alt+l",
		"command": "addCursorsAtSearchResults",
		"when": "fileMatchOrMatchFocus && searchViewletVisible",
	},
	{
		"key": "ctrl+shift+l",
		"command": "-addCursorsAtSearchResults",
		"when": "fileMatchOrMatchFocus && searchViewletVisible",
	},
]
```

> **⚠️ Note:** Some keybindings assume you have certain extensions installed (e.g., `git-graph`, `GitLens`, `Todo Tree`). If you don’t use those extensions, you can remove the corresponding lines.

---

## 7. Final Steps

1. **Restart Cursor** to apply all settings and keybindings.
2. **Install the recommended extensions** listed in section 3.
3. **Verify that formatting works** – open a JavaScript/TypeScript file and save it; Prettier should reformat according to the rules.
4. **Test Cursor AI features** – press `Ctrl+Alt+L` to open the AI chat, or use `Ctrl+K` to invoke inline AI edits (default Cursor shortcuts).

---

## 8. Troubleshooting

| Problem                                      | Solution                                                                                                                                                        |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cursor` command not found in terminal       | Close and reopen your terminal, or log out and back in.                                                                                                         |
| Extensions not loading / settings ignored    | Ensure your `settings.json` is valid JSONC. Run `Developer: Reload Window` from the command palette.                                                            |
| Prettier not formatting on save              | Check that Prettier extension is installed and enabled. Verify `"editor.formatOnSave": true` and that the default formatter is set correctly for the file type. |
| GitLens or Git Graph not showing             | Make sure you have opened a folder that is a Git repository. These extensions only activate in a Git workspace.                                                 |
| Cursor Tab AI not working in plaintext files | The setting `cursor.cpp.disabledLanguages` includes `"plaintext"` – remove it from the array if you want AI there.                                              |
| AI chat not responding                       | Check that you are logged into Cursor (File → Sign In). Also verify internet connection.                                                                        |

---

Your Cursor AI Editor is now fully configured for a modern, AI‑enhanced development environment. Enjoy coding!
