require("telescope").setup {}

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap("n", "<leader>.", ":Telescope file_browser<CR>", { noremap = true})

vim.api.nvim_set_keymap("n", "<leader>g", ":tab G<CR>", { noremap = true})

local map = vim.keymap.set

map("n", "<leader><leader>", '<cmd>lua require("telescope.builtin").find_files()<CR>')
map("n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map("n", "<leader>,", '<cmd>lua require("telescope.builtin").buffers()<CR>')
map("n", "<leader>'", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").resume()<CR>')
