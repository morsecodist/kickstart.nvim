-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'github/copilot.vim',
    build = ':Copilot setup',
    event = 'InsertEnter',
  },

  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        filetypes = { 'css', 'scss', 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte' },
        user_default_options = {
          tailwind = true,
          css = true,
          mode = 'background', -- or 'foreground' if you prefer
        },
      }
    end,
  },
}
