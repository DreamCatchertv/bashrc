# Bash Config

Modular bash configuration.

## Features

- **Modular design** — each concern lives in its own file under `~/.config/bash/`
- **Smart installer** — auto-detects your package manager and installs dependencies
- **Modern tools** — eza, bat, ripgrep, starship, zoxide, mise, and more
- **Colored man pages** — readable manual pages out of the box

## Module Overview

| File | Description |
|---|---|
| `aliases.sh` | Eza and ripgrep aliases |
| `completion.sh` | Case-insensitive tab completion |
| `env.sh` | Editor, PATH, history, and XDG settings |
| `functions.sh` | `extract()` — universal archive extractor |
| `system.sh` | Distro detection and distro-specific aliases |
| `tools.sh` | Starship, zoxide, and mise initialization |
| `mancolors.sh` | Colored man page output |
| `local.example.sh` | Template for local overrides (copied to `local.sh`) |

## Installation
```
git clone https://github.com/DreamCatchertv/bashrc.git

cd bash-config

chmod +x install.sh

./install.sh
```

The installer will:

1. Detect your package manager (apt, dnf, pacman, zypper, apk, brew)
2. Install required packages (eza, bat, ripgrep, nvim, etc.)
3. Install starship, zoxide, and mise via their official installers
4. Back up your existing `~/.bashrc` to `~/.bashrc.backup`
5. Copy the modular config to `~/.config/bash/`

Restart your shell or run `source ~/.bashrc` to apply.
