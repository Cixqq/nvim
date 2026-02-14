# Cirq's Neovim Config
[![Neovim](https://img.shields.io/badge/Neovim–0.12+-339933?logo=neovim&logoColor=white)](https://neovim.io) [![License](https://img.shields.io/github/license/Cixqq/nvim)](https://github.com/Cixqq/nvim/blob/main/LICENSE)

My minimal and fast Neovim configuration.

## Features

- Lean setup focused on speed and simplicity
- Built-in LSP support (Lua, C/C++, Go, Python)
- Fuzzy finder with `fzf-lua`
- File explorer using `oil.nvim`

## Requirements

- **Neovim**: dev/nightly build or `>=0.12.0`
- `git`: to clone the repository  
- `fzf`: for fuzzy finding
- [Optional] LSP servers for full language support

## Installation

Linux/MacOS:
```bash
git clone https://github.com/Cixqq/nvim ~/.config/nvim
```
Windows (cmd):
```batch
git clone https://github.com/Cixqq/nvim %userprofile%\AppData\Local\nvim\
```

## Plugins
Managed via `vim.pack`:
-   `gruvbox.nvim`
-   `fzf-lua`
-   `oil.nvim`
-   `nvim-ts-autotag`

## Keymaps (Highlights)
-   `<Space>` — leader key
-   `<leader>sf` — file search
-   `<leader>sg` — live grep
-   `<leader>f` — format buffer
-   `<C-n>` — file explorer
