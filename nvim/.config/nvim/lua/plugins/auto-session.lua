return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>fs", "<cmd>AutoSession search<CR>", desc = "Session search" },
	},
	opts = {
		enabled = false,
		cwd_change_handling = false,
		auto_create = false,
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
		session_lens = {
			picker = "telescope",
			mappings = {
				delete_session = { { "i", "n" }, "<C-d>" },
			},
			theme_conf = {
				prompt_title = "Session Search (<C-d> to delete)",
			},
		},
	},
}
