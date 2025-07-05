local map = vim.keymap.set 

local function with_default_opts(opts)
  local defaultOpts = { noremap = true, silent = true }
  return vim.tbl_extend("force", defaultOpts, opts)
end


-- === Neotree ===
map("n", "<leader>t", ":Neotree reveal<CR>", with_default_opts({ desc = "Reveal file in Neo-tree" }))

-- === Workspace ===
map("n", "<leader>qq", "<cmd>qa!<CR>", with_default_opts({ desc = "Force quit Neovim" }))

-- === Pane and splits ===
map("n", "sv", "<cmd>vsplit<CR>", with_default_opts({ desc = "Split Right" }))
map("n", "ss", "<cmd>split<CR>", with_default_opts({ desc = "Split Down" }))
map("n", "sl", "<C-w>l", with_default_opts({ desc = "Focus Pane Right" }))
map("n", "sh", "<C-w>h", with_default_opts({ desc = "Focus Pane Left" }))
map("n", "sk", "<C-w>k", with_default_opts({ desc = "Focus Pane Up" }))
map("n", "sj", "<C-w>j", with_default_opts({ desc = "Focus Pane Down" }))

-- === Telescope ===
map("n", "<leader>m", "<cmd>Telescope buffers<CR>", with_default_opts({ desc = "Buffer Switcher" }))
map("n", "<leader>f", "<cmd>Telescope live_grep<CR>", with_default_opts({ desc = "Search in files" }))
map("n", "<C-f>", "<cmd>Telescope find_files<CR>", with_default_opts({ desc = "Find files" }))
