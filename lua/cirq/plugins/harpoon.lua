return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon: [A]ppend current file' })
    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():remove()
    end, { desc = '[H]arpoon: [D]elete current file' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Show mark list' })

    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon: Jump to mark 1' })
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon: Jump to mark 2' })
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon: Jump to mark 3' })
    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon: Jump to mark 4' })

    -- <C-S-...> means Ctrl+Shift+... (in case I forgot)
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
  end,
}
