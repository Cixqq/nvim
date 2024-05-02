# Cirq's Neovim config (fork of kickstart.nvim)
## some basic stuff
- `<space>` is the leader key
- which-key is included in the config, which makes figuring out keymaps much easier
- the config also uses lazy.nvim as a package manager

## Installation

### Installing Neovim
- Windows (using chocolatey/choco): `choco install neovim`
- Windows (Using winget): `winget install Neovim.Neovim`
- Arch Linux: `sudo pacman -S neovim`
- Debian: `sudo apt-get install neovim`
- Ubuntu: `sudo apt install neovim`

### Installing external dependencies
External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

Windows (using chocolatey/choco): `choco install -y git ripgrep wget fd unzip gzip mingw make`

Arch Linux: `sudo pacman -S gcc make git ripgrep fd unzip`

Debian: `sudo apt install make gcc ripgrep unzip git xclip curl`

Ubuntu: `sudo add-apt-repository ppa:neovim-ppa/unstable -y && sudo apt install make gcc ripgrep unzip git xclip`

### Installing the config
1. `git clone https://github.com/Cixqq/nvim ~/.config/nvim` (NOTE: the config folder path may vary from OS to OS, please refer to the [config folder path table](#config-folder-path))
2. `sudo pacman -R code`
3. unplug your mouse
4. profit

## Config folder path
| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

## basic keymaps
- `Ctrl+N` toggles NeoTree (file explorer)
- `<leader>s` is used to search for something, there are multiple search options
- `jj` or `jk` are mapped to the `<Esc>` (escape key), they can be used to switch from insert mode to normal mode
- `wq` automatically saves current file and closes neovim
