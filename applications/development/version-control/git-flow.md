# Git Flow (AVH Edition) Setup Guide

`git-flow-avh` is a collection of Git extensions that provide high-level repository operations for Vincent Driessen’s branching model. It helps manage feature branches, releases, and hotfixes in a structured way.

> **ℹ️ Note:** The AVH edition is the modern, actively maintained fork of the original git‑flow. It is available in the official Arch Linux repositories.

---

## Table of Contents

- [Git Flow (AVH Edition) Setup Guide](#git-flow-avh-edition-setup-guide)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Basic Concepts](#2-basic-concepts)
	- [3. Initialising Git Flow in a Repository](#3-initialising-git-flow-in-a-repository)
	- [4. Common Commands](#4-common-commands)
		- [Feature Branches](#feature-branches)
		- [Release Branches](#release-branches)
		- [Hotfix Branches](#hotfix-branches)
		- [Support Branches (optional)](#support-branches-optional)
	- [5. Configuration](#5-configuration)
	- [6. Uninstalling](#6-uninstalling)
	- [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S git-flow-avh
```

Verify the installation:

```bash
git flow version
```

Expected output: `git-flow version x.x.x (AVH edition)`

---

## 2. Basic Concepts

The git‑flow branching model defines several branch types:

| Branch type          | Purpose                                   |
| -------------------- | ----------------------------------------- |
| `main` (or `master`) | Production‑ready code.                    |
| `develop`            | Integration branch for features.          |
| `feature/*`          | New features (branched from `develop`).   |
| `release/*`          | Preparing a new production release.       |
| `hotfix/*`           | Urgent fixes applied to `main`.           |
| `support/*`          | Maintenance of older releases (optional). |

> **💡 Tip:** The AVH edition is backward compatible with the original git‑flow and adds bug fixes and more flexibility.

---

## 3. Initialising Git Flow in a Repository

Inside your existing Git repository, run:

```bash
git flow init
```

You will be prompted to set branch names (defaults are usually fine).
Accept the defaults by pressing `Enter` unless you have custom naming preferences.

After initialisation, you will be on the `develop` branch.

> **⚠️ Note:** Your repository must already be initialised with `git init` or cloned from a remote.

---

## 4. Common Commands

All commands follow the pattern `git flow <subcommand> <action>`.

### Feature Branches

| Task                                       | Command                                   |
| ------------------------------------------ | ----------------------------------------- |
| Start a new feature                        | `git flow feature start <feature-name>`   |
| Publish a feature to remote                | `git flow feature publish <feature-name>` |
| Finish a feature (merge back to `develop`) | `git flow feature finish <feature-name>`  |
| List all features                          | `git flow feature list`                   |

> **💡 Tip:** After finishing, the feature branch is deleted locally. Use `git flow feature finish -k` to keep it.

### Release Branches

| Task                                         | Command                              |
| -------------------------------------------- | ------------------------------------ |
| Start a release                              | `git flow release start <version>`   |
| Publish a release                            | `git flow release publish <version>` |
| Finish a release (merges to `main` and tags) | `git flow release finish <version>`  |

When you finish a release, Git Flow:

- Merges the release branch into `main`
- Tags the release with the version number
- Merges the release back into `develop`
- Deletes the release branch

### Hotfix Branches

| Task            | Command                            |
| --------------- | ---------------------------------- |
| Start a hotfix  | `git flow hotfix start <version>`  |
| Finish a hotfix | `git flow hotfix finish <version>` |

Hotfixes are branched from `main` and merged back into both `main` and `develop`.

### Support Branches (optional)

Used to maintain older releases:

```bash
git flow support start <release-version>
```

---

## 5. Configuration

Git Flow uses `git config` settings under the `gitflow` namespace. View your current configuration:

```bash
git config --get-regexp gitflow
```

Common settings (set them globally or per repository):

```bash
# Disable automatic prefix for branch names (if you prefer)
git config --global gitflow.prefix.feature "feature/"
git config --global gitflow.prefix.release "release/"
git config --global gitflow.prefix.hotfix "hotfix/"
git config --global gitflow.prefix.support "support/"
```

To set the default branch names (instead of `master` and `develop`):

```bash
git config --global gitflow.branch.main "main"
git config --global gitflow.branch.develop "develop"
```

> **💡 Tip:** These can also be set locally per project by omitting `--global`.

---

## 6. Uninstalling

```bash
sudo pacman -R git-flow-avh
```

Removing the package does not affect any repositories that have already been initialised with Git Flow.

---

## 7. Troubleshooting

| Problem                                           | Solution                                                                                  |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `git flow: command not found`                     | Git Flow is not installed. Install with `sudo pacman -S git-flow-avh`.                    |
| `Not a git repository`                            | Run `git init` first.                                                                     |
| `git flow init` uses `master` but you want `main` | Configure `git flow branch.main` before initialising.                                     |
| Finish fails because of unmerged changes          | Commit or stash all changes before finishing.                                             |
| How to abort a feature/hotfix                     | Delete the branch manually: `git branch -D feature/<name>` then switch back to `develop`. |

---

Your Git Flow installation is now ready to bring structure to your branching workflow.
