return{
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      -- Configuración sin la extensión 'ui-select'
    })

    local builtin = require("telescope.builtin")
    local themes = require('telescope.themes')
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>km", ":Telescope keymaps<CR>")
    vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { noremap = true, silent = true })
  end,
}
