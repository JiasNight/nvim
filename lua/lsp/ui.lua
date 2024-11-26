-- 自定义图标
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspkind
local lspkind = require('lspkind')
lspkind.init({
    -- default: true
    -- with_text = true,
    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',
    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

local lspsaga = require("lspsaga")
lspsaga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
      edit = "<CR>",
      keys = {
          edit = "o",
          tabe = "i",
          vsplit = "s",
          split = "S",
      },
  },
  ui = {
      -- border type can be single,double,rounded,solid,shadow.
      border = "rounded",
      code_action = "",
  },
  symbol_in_winbar = {
      separator = "  ",
      respect_root = true,
      folder_level = 0,
  },
})

vim.keymap.set("n", "<leader>dw", ":Lspsaga show_workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>db", ":Lspsaga show_buf_diagnostics<CR>")
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga term_toggle<CR>')
vim.keymap.set('t', '<leader>tt', '<cmd>Lspsaga term_toggle<CR>')
vim.keymap.set({'n','t'}, '<C-t>', '<cmd>Lspsaga term_toggle<CR>')

local M ={}
-- 为 cmp.lua 提供参数格式
M.formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      --mode = 'symbol', -- show only symbol annotations

      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end
    })
}

return M
