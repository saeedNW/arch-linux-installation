# Installing Global npm Packages (TypeScript, NestJS, Create React App, etc.)

This guide covers installing commonly used Node.js global packages: `typescript`, `@nestjs/cli`, `create-react-app`, `generator-code`, `prettier`, `vsce`, and `yarn`.

> **ℹ️ Prerequisite:** You should have Node.js and npm installed via **NVM** (see the [NVM installation guide](./nvm.md)). This ensures you do **not** need `sudo` and that global packages are isolated per Node version.

---

## Table of Contents

- [Installing Global npm Packages (TypeScript, NestJS, Create React App, etc.)](#installing-global-npm-packages-typescript-nestjs-create-react-app-etc)
  - [Table of Contents](#table-of-contents)
  - [1. Why Install Global Packages via npm?](#1-why-install-global-packages-via-npm)
  - [2. List of Packages](#2-list-of-packages)
  - [3. Installation Commands](#3-installation-commands)
  - [4. Verification](#4-verification)
  - [5. Updating Global Packages](#5-updating-global-packages)
  - [6. Uninstalling Global Packages](#6-uninstalling-global-packages)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Why Install Global Packages via npm?

When you install a package globally, its executables are placed in a directory that is in your system `PATH`, allowing you to run commands from anywhere in your terminal.

| Package            | Command            | Purpose                                             |
| ------------------ | ------------------ | --------------------------------------------------- |
| `typescript`       | `tsc`              | TypeScript compiler                                 |
| `@nestjs/cli`      | `nest`             | Create and manage NestJS projects                   |
| `create-react-app` | `create-react-app` | Bootstrap React applications                        |
| `generator-code`   | `yo code`          | Scaffold VS Code extensions (requires `yo`)         |
| `prettier`         | `prettier`         | Opinionated code formatter                          |
| `vsce`             | `vsce`             | Package and publish VS Code extensions              |
| `yarn`             | `yarn`             | Fast, reliable package manager (alternative to npm) |

> **⚠️ Important:** Because we are using **NVM**, global packages are installed inside `~/.nvm/versions/node/<version>/lib/node_modules/`. You **never need sudo**, and each Node version has its own independent set of global packages.

---

## 2. List of Packages

| Package Name                     | npm Command        | Provides executable(s)      |
| -------------------------------- | ------------------ | --------------------------- |
| TypeScript                       | `typescript`       | `tsc`, `tsserver`           |
| NestJS CLI                       | `@nestjs/cli`      | `nest`                      |
| Create React App                 | `create-react-app` | `create-react-app`          |
| VS Code Extension Generator      | `generator-code`   | `yo code` (requires Yeoman) |
| Prettier                         | `prettier`         | `prettier`                  |
| VSCE (VS Code Extension Manager) | `vsce`             | `vsce`                      |
| Yarn                             | `yarn`             | `yarn`                      |

---

## 3. Installation Commands

Run the following commands in your terminal **after** ensuring you are using the desired Node version (e.g., `nvm use --lts`).

```bash
# Install TypeScript globally
npm install -g typescript

# Install NestJS CLI
npm install -g @nestjs/cli

# Install Create React App
npm install -g create-react-app

# Install Yeoman (required for generator-code) and the VS Code extension generator
npm install -g yo generator-code

# Install Prettier
npm install -g prettier

# Install VSCE (VS Code Extension Manager)
npm install -g vsce

# Install Yarn package manager
npm install -g yarn
```

> **💡 Tip:** You can combine them into a single line:
>
> ```bash
> npm install -g typescript @nestjs/cli create-react-app yo generator-code prettier vsce yarn
> ```

---

## 4. Verification

After installation, verify each command works:

| Package                 | Verification Command                 | Expected Output (example)         |
| ----------------------- | ------------------------------------ | --------------------------------- |
| TypeScript              | `tsc --version`                      | `Version 5.x.x`                   |
| NestJS CLI              | `nest --version`                     | `x.x.x`                           |
| Create React App        | `create-react-app --version`         | `x.x.x`                           |
| Yeoman + generator-code | `yo --version` and `yo --generators` | version and list including `code` |
| Prettier                | `prettier --version`                 | `x.x.x`                           |
| VSCE                    | `vsce --version`                     | `x.x.x`                           |
| Yarn                    | `yarn --version`                     | `x.x.x`                           |

---

## 5. Updating Global Packages

To update a specific global package:

```bash
npm update -g <package-name>
```

Example:

```bash
npm update -g typescript
```

To update all global packages at once:

```bash
npm update -g
```

> **⚠️ Note:** Global packages are tied to the Node version they were installed under. If you switch Node versions with `nvm use`, you will need to reinstall global packages for that version or use `nvm reinstall-packages` to copy them.

---

## 6. Uninstalling Global Packages

Remove a global package:

```bash
npm uninstall -g <package-name>
```

Example:

```bash
npm uninstall -g create-react-app
```

---

## 7. Troubleshooting

| Problem                                                   | Solution                                                                                                                                                     |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `command not found` after installation                    | Ensure you are using the same terminal session or restart the terminal. The global binaries are in `~/.nvm/versions/node/.../bin`, which NVM adds to `PATH`. |
| `EACCES: permission denied`                               | You are not using NVM, or NVM is not properly loaded. Run `nvm use` first.                                                                                   |
| `npm install -g` wants `sudo`                             | Do **not** use sudo. Switch to NVM.                                                                                                                          |
| Packages installed but not recognised                     | Run `nvm reinstall-packages <current>` to copy global packages from another version. Or simply reinstall after switching.                                    |
| `yo: command not found` after installing `generator-code` | You also need to install `yo` globally: `npm install -g yo`.                                                                                                 |
| `create-react-app` is deprecated?                         | The official Create React App is still maintained, but consider using Vite for new React projects. The command still works.                                  |

---

Your global Node.js tools are now ready to use from any terminal. Enjoy developing!
