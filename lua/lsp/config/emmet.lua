return {
  on_setup = function(server)
    server.setup({
      filetypes = { "html", "css", "sass", "scss", "less", "typescriptreact", "javascriptreact" },
    })
  end,
}
