return {
	"nvim-telescope/telescope.nvim",
  branch = "master",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope help tags",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Telescope diagnostics",
		},
	},

	-- Uses config instead of opts, because require is non-static, and will throw error. Come back to this when you understand it better
	-- Use this option if you want one key escapes. removes vim actions from list
	--[[
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    })
  end,
  --]]
}
