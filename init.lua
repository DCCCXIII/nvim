-- Visual stuff on editor
vim.g.mapleader= " "
vim.cmd("set relativenumber")
vim.cmd("set colorcolumn=80")

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
	}
}

require("lazy").setup(plugins, opts)
require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
