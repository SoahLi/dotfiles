return {
	"folke/flash.nvim",
	event = "VeryLazy",
	--@type Flash.Config
	opts = {
		search = {
			mode = "fuzzy", -- ✅ enable fuzzy finding properly
		},
	},
	config = function()
		require("mini.surround").setup({
			custom_surroundings = {
				["("] = { output = { left = "(", right = ")" } },
				["["] = { output = { left = "[", right = "]" } },
				["{"] = { output = { left = "{", right = "}" } },
				["<"] = { output = { left = "<", right = ">" } },
			},
		})
	end,
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
