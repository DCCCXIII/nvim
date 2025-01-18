-- Visual stuff on editor
vim.g.mapleader= " "
vim.cmd("set relativenumber")
vim.cmd("set colorcolumn=80")
vim.cmd("set scrolloff=12")

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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim'}
	},
	{"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"}
}

require("lazy").setup(plugins, opts)

-- catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	-- see supported languages in https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
	ensure_installed = {"lua", "javascript", "go", "rust"},
	highlight = { enable = true },
	indent = { enable = true }
})
