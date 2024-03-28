-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-web-devicons').setup({default = true})

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", "<leader>-", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader><Tab>", "<C-w>w")
