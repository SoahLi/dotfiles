return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	keys = {
		{ "<leader>fo", "<cmd>NvimTreeOpen<CR>", desc = "Open NvimTree" },
		{ "<leader>fc", "<cmd>NvimTreeClose<CR>", desc = "Close NvimTree" },
    { "<leader>mb", function()
        require("nvim-tree.api").marks.bulk.move_bookmarked()
    end, desc = "Move bookmarked in NvimTree" },
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			-- Override <CR> to open file and close tree only if node is a file
			vim.keymap.set("n", "<CR>", function()
				local node = api.tree.get_node_under_cursor()
				if node and node.type == "file" then
					api.node.open.edit()
					api.tree.close()
				else
					api.node.open.edit()
				end
			end, opts("Open file and close tree if file"))

			-- Map Shift + - (i.e., _) to the same as -
			vim.keymap.del("n", "-", { buffer = bufnr }) -- Remove default mapping for '-' so I can use my other mapping with resizes the window
			vim.keymap.set("n", "_", api.tree.change_root_to_parent, opts("Up to parent directory"))
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			sort = {
				sorter = "case_sensitive",
			},
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
	end,
}
