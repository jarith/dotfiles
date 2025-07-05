return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--glob=!**/.log",
	},
        mappings = {
          n = {
            ["<Esc>"] = actions.close, -- ESC to close in normal mode
          },
        },
      },
      pickers = {
        live_grep = {
          cwd = require("telescope.utils").get_git_root,
        },
        find_files = {
          cwd = require("telescope.utils").get_git_root,
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
  end,
}

