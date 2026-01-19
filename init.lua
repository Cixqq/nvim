-- Globals.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options.
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.ts = 4
vim.o.sw = 4
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.guicursor = ""
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.breakindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10
vim.o.hlsearch = true
vim.o.list = true
vim.o.listchars = "tab:» ,trail:·"
vim.o.wrap = false
vim.o.undofile = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.winborder = "bold"
vim.o.showtabline = 2
vim.o.completeopt = "fuzzy,nosort,menuone,noselect,noinsert"
vim.o.pumheight = 10
vim.o.pumwidth = 5

local function map(mappings)
    for mode, value in pairs(mappings) do
        for _, mapping in ipairs(value) do
            local lhs, rhs, opts = mapping[1], mapping[2], mapping[3]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end
end

local mappings = {
    ["n"] = {
        -- General keymaps.
        { "<Esc>",            ":nohlsearch<CR>",                  { desc = "Removes search highlight.", silent = true } },
        { "wq",               ":wq<CR>",                          { desc = "Saves current file and quits." } },
        { "x",                "\"_x",                             { desc = "Prevents copying each deleted character." } },
        { "<leader>d",        "\"_dd",                            { desc = "Prevents cutting to clipboard." } },
        { "<leader>",         "",                                 { desc = "For some reason space goes to the second line. This is a hacky fix." } },
        { "<leader>o",        ":w<CR> :source<CR>",               { desc = "Saves and reloads config." } },

        -- File traversal keymaps.
        { "<C-d>",            "<C-d>zz",                          { desc = "Scrolls down." } },
        { "<C-u>",            "<C-u>zz",                          { desc = "Scrolls up." } },

        -- Split keymaps.
        { "<C-h>",            "<C-w><C-h>",                       { desc = "Moves to the left pane." } },
        { "<C-j>",            "<C-w><C-j>",                       { desc = "Moves to the pane down." } },
        { "<C-k>",            "<C-w><C-k>",                       { desc = "Moves to the pane up." } },
        { "<C-l>",            "<C-w><C-l>",                       { desc = "Moves to the right pane." } },
        { "<A-h>",            ":vertical resize -2<CR>",          { desc = "Resizes a pane horizontally from the left.", silent = true } },
        { "<A-j>",            ":resize -2<CR>",                   { desc = "Resizes a pane vertically downwards.", silent = true } },
        { "<A-k>",            ":resize +2<CR>",                   { desc = "Resizes a pane vertically upwards.", silent = true } },
        { "<A-l>",            ":vertical resize +2<CR>",          { desc = "Resizes a pan horizontally from the right.", silent = true } },
        { "<leader>|",        ":vsplit<CR><C-w>w",                { desc = "Splits the window vertically.", silent = true } },
        { "<leader>-",        ":split<CR><C-w>w",                 { desc = "Splits the windows horizontally.", silent = true } },

        -- Tab keymaps.
        { "<Tab>",            "gt",                               { desc = "Goes to next tab." } },
        { "<S-Tab>",          "gT",                               { desc = "Goes to previous tab." } },
        { "<leader>tn",       ":tab new<CR>",                     { desc = "Makes a new tab.", silent = true } },
        { "<leader>ttn",      ":tab term<CR>",                    { desc = "Spawns a terminal in a new tab.", silent = true } },
        { "<leader>tt",       ":term<CR>",                        { desc = "Spawns a terminal in the current tab/pane.", silent = true } },

        -- LSP keymaps.
        { "<leader>f",        vim.lsp.buf.format,                 { desc = "Formats current buffer." } },
        { "<leader>r",        vim.lsp.buf.rename,                 { desc = "Renames the identifier the cursor is pointing to." } },
        { "<leader>e",        vim.diagnostic.open_float,          { desc = "Shows full error message when standing on a line that has an error." } },
        { "<leader>q",        vim.diagnostic.setloclist,          { desc = "Opens up the error/warnings list." } },
        { "<leader>sr",       ":FzfLua lsp_references<CR>",       { desc = "Opens a popup with all the references to an identifier that the cursor is pointing to.", silent = true } },
        { "gd",               vim.lsp.buf.declaration,            { desc = "Jumps to declaration." } },
        { "gD",               vim.lsp.buf.definition,             { desc = "Jumps to definition." } },
        { "<leader>a",        vim.lsp.buf.code_action,            { desc = "Opens a popup with all the possible code actions." } },
        { "<leader>sd",       ":FzfLua lsp_document_symbols<CR>", { desc = "Opens a popup with all the document symbols.", silent = true } },

        -- Plugin keymaps.
        { "<leader>sf",       ":FzfLua files<CR>",                { desc = "Opens a file picker.", silent = true } },
        { "<leader>sg",       ":FzfLua live_grep<CR>",            { desc = "Opens a live grep picker.", silent = true } },
        { "<leader><leader>", ":FzfLua buffers<CR>",              { desc = "Opens a buffer picker.", silent = true } },
        { "<C-n>",            ":Oil<CR>",                         { desc = "Opens a file explorer.", silent = true } },
    },
    ["v"] = {
        --- General keymaps.
        { "<leader>",   "",                                    { desc = "For some reason space goes to the second line. This is a hacky fix." } },

        -- LSP keymaps.
        { "<leader>a",  vim.lsp.buf.code_action,               { desc = "Opens a popup with all the possible code actions." } },

        -- Buffer manipulation keymaps.
        { "<",          function() vim.cmd("normal! <gv") end, { desc = "Indents your code upwards.", silent = true } },
        { ">",          function() vim.cmd("normal! >gv") end, { desc = "Indents your code backwards.", silent = true } },
        { "J",          ":m '>+1<CR>gv=gv",                    { desc = "Moves a block of code up." } },
        { "K",          ":m '<-2<CR>gv=gv",                    { desc = "Moves a block of code down." } },
        { "<leader>sg", ":FzfLua grep_visual<CR>",             { desc = "Opens a live grep picker.", silent = true } },
    },
    ["i"] = {
        -- General keymaps.
        { "jk", "<Esc>", { desc = "Escapes to normal mode. " } },
        { "kj", "<Esc>", { desc = "Escapes to normal mode. " } }
    },
    ["t"] = {
        -- Terminal keymaps.
        { "<Esc><Esc>", "<C-\\><C-n>", { desc = "Escapes from terminal to normal mode." } },
    },
}
map(mappings)

-- Autocmds.
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd("TextYankPost", {
    group = augroup("nvim-highlight-yank", { clear = true }),
    desc = "Highlights text on yank.",
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("BufEnter", {
    pattern = "",
    command = "set fo-=c fo-=r fo-=o",
    desc = "Doesn't automatically inserts comment prefix."
})

autocmd("LspAttach", {
    desc = "Enable LSP.",
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method("textDocument/completion") then
            local function pumvisible()
                return tonumber(vim.fn.pumvisible()) ~= 0
            end
            local function feedkeys(keys)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
            end
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}; for i = 48, 122 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            local _map = vim.keymap.set
            _map("i", "<C-Space>", function()
                if pumvisible() then
                    feedkeys "<C-e>"
                else
                    if next(vim.lsp.get_clients { bufnr = 0 }) then
                        vim.lsp.completion.get()
                    else
                        if vim.bo.omnifunc == '' then
                            feedkeys "<C-x><C-n>"
                        else
                            feedkeys "<C-x><C-o>"
                        end
                    end
                end
            end, { silent = true })
            _map("i", "<C-y>", function()
                if pumvisible() then
                    local ci = vim.fn.complete_info()
                    if ci.selected == -1 then
                        return feedkeys "<C-n><C-y>"
                    else
                        return feedkeys "<C-y>"
                    end
                end
            end, { silent = true })
        end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

-- Plugins and LSP.
vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/windwp/nvim-ts-autotag",
    "https://github.com/windwp/nvim-autopairs",
})

vim.lsp.enable({ "lua_ls", "clangd", "pyright", "gopls" })

require("oil").setup()
require("nvim-ts-autotag").setup()
require("nvim-autopairs").setup()
require("gruvbox").setup({
    italic = {
        strings = false,
        comments = false,
    }
})

local height = math.floor(0.618 * vim.o.lines)
local width = math.floor(0.618 * vim.o.columns)
require("fzf-lua").setup({
    winopts = {
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = "bold",
        backdrop = 100,
        preview = {
            hidden = true,
            layout = "vertical",
            horizontal = "up:70%"
        }
    },
    keymap = {
        builtin = {
            ["<Tab>"] = "toggle-preview",
        },
        fzf = {
            -- Disabling multi selection. (Personally I don't see any use for it, for now at least.)
            ["Tab"]       = "toggle-preview",
            ["shift-tab"] = "",
        }
    },
    fzf_opts = {
        ["--prompt"] = "> ",
        ["--pointer"] = "> ",
    }
})

vim.diagnostic.config({
    virtual_text = {
        prefix = ""
    },
    signs = true
})

-- Statusline.
function _G._diag_counts()
    local err, warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
        #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local res = ""
    if err > 0 then res = res .. string.format("%dE", err) end
    if warn > 0 then res = res .. string.format(" %dW", warn) end
    return res
end

vim.o.statusline = table.concat {
    "%t",
    "%r",
    "%m",
    "%=",
    "%{%v:lua._diag_counts()%}",
    " [%2p%%] ",
    "[%l:%c]"
}

-- Colorscheme.
vim.cmd([[
    colorscheme gruvbox
    hi statusline guibg=NONE
]])
