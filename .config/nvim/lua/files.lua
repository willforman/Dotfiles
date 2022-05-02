require("telescope").setup {}

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser<CR>", { noremap = true})

vim.api.nvim_set_keymap("n", "<leader>g", ":tab G<CR>", { noremap = true})
