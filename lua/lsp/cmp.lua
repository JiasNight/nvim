local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    vim.notify("没有找到 cmp")
  return
end

-- local luasnip_status, luasnip = pcall(require, "luasnip")
-- if not luasnip_status then
--     vim.notify("没有找到 luasnip")
--   return
-- end

-- require("luasnip.loaders.from_vscode").lazy_load()

-- -- 下面会用到这个函数
-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end


cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  -- 这里重要
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "vsnip" },
    { name = 'luasnip' },
  }, { 
    { name = "buffer" }, { name = "path" } 
  }),

  -- 快捷键设置
  mapping = require("keybindings").cmp(cmp),

  -- 使用lspkind-nvim显示类型图标 (新增)
  formatting = require('lsp.ui').formatting

})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
