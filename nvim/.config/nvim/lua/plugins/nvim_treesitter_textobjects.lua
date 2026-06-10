return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    require("nvim-treesitter-textobjects").setup {
      move = {
        set_jumps = true,
      },
    }

    -- Functions
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end, { desc = "Goto next function" })
    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Goto previous function" })

    -- Type definitions
    vim.keymap.set({ "n", "x", "o" }, "]t", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end, { desc = "Goto next type definition" })
    vim.keymap.set({ "n", "x", "o" }, "[t", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Goto previous type definition" })

    -- Parameters
    vim.keymap.set({ "n", "x", "o" }, "]a", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
    end, { desc = "Goto next parameter" })
    vim.keymap.set({ "n", "x", "o" }, "[a", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
    end, { desc = "Goto previous parameter" })
  end,
}
