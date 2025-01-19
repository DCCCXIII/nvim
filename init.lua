-- Visual stuff on editor
vim.cmd("set colorcolumn=120")
vim.g.mapleader= " "
vim.cmd("set relativenumber")
vim.cmd("set colorcolumn=80")
vim.cmd("set scrolloff=12")

-- some remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Check for Lazy, install if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim'}
	},
	{"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"},
	{"mbbill/undotree"},
	{
	  'projekt0n/github-nvim-theme',
	  name = 'github-theme',
	  lazy = false, -- make sure we load this during startup if it is your main colorscheme
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
	    require('github-theme').setup({
	    })

	    vim.cmd('colorscheme github_dark_high_contrast')
	  end,
	}
}

require("lazy").setup(plugins, opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	-- see supported languages in https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
	ensure_installed = {"lua", "javascript", "go", "rust"},
	highlight = { enable = true },
	indent = { enable = true }
})


-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
