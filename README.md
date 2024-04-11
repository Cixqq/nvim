# Cirq's Neovim config (fork of kickstart.nvim)
## some basic stuff
- `<space>` is the leader key
- which-key is included in the config, which makes finding keybinds much easier
- the installation is very simple:
1- `git clone https://github.com/Cixqq/nvim ~/.config/nvim` (note: the config folder location may vary from OS to OS, currently I'm using Linux so my config folder location is `~/.config/nvim`)
2- install some dependencies by using the following command: `sudo pacman -S fzf && sudo pacman -S ripgrep`
3- `sudo pacman -R code`
4- unplug your mouse
5- profit
## basic keybinds
- `Ctrl+N` opens up the file explorer
- `<leader>s` is used to search for something, there are multiple search options
- `jj` or `jk` exits insert mode and goes to normal mode
- `wq` automatically saves and closes neovim
