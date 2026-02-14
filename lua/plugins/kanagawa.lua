return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup({})
    vim.cmd('colorscheme kanagawa-wave')
  end,
}
