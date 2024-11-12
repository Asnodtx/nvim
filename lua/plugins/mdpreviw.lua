return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.schedule(function() vim.fn["mkdp#util#install"]() end)
  end,
  config = function()
    -- Establecer la función de navegador personalizada
    vim.cmd([[
      function! OpenMarkdownPreview(url)
        execute "silent ! firefox --new-tab " . a:url
      endfunction
      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    ]])
  end,
}

