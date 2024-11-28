local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("没有找到 cmp")
  return
end

cmp.setup({
  -- 补全菜单和文档框，是否要有边框，以及高亮组等
  window = {
    completion = cmp.config.window.bordered({
      border = "none",
      winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:MyCmpSel", -- 重点是CursorLine
    }),
    documentation = cmp.config.window.bordered({
      border = "none",
    }),
  },
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)

    end,
  },

  -- 补全源
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp', menu = "[LSP]" },
      { name = "vsnip", menu = "[Vsnip]" },
      -- { name = 'luasnip' },
      -- { name = 'ultisnips' },
      -- { name = 'snippy' },

    },
    {
      { name = "buffer", menu = "[Buf]" },
      { name = "path", menu = "[Path]" } 
    }
),

  -- 快捷键设置
  mapping = require("keybindings").cmp(cmp),

  -- 使用lspkind-nvim显示类型图标 (新增)
  formatting = require('lsp.ui').formatting

})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer", menu = "[Buf]" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline", menu = "[Cmd]" },
  }),
})
