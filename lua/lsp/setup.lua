local mason_status, mason = pcall(require, "mason")
if not mason_status then
    vim.notify("没有找到 mason")
  return
end

mason.setup({
	ui = {
		icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
	}
})

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_status then
    vim.notify("没有找到 mason_lspconfig")
  return
end

mason_lspconfig.setup({
  -- mason要安装的服务器列表
  ensure_installed = {
      "lua_ls",
      "html",
      "cssls",
      "ts_ls",
      "volar",
      "jedi_language_server",
      "java_language_server",
      "jsonls",
      "clangd",
      "yamlls",
      "marksman",
  },
  -- 自动安装已配置的服务器 (使用 lspconfig)
  automatic_installation = true,
})


local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    vim.notify("没有找到 lspconfig")
  return
end

lspconfig.lua_ls.setup({
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['lua_ls'] = {},
  },
})


local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.jedi_language_server.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
  end,
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
  end,
})


-- local mason_lspconfig = require("mason-lspconfig")

-- local mason_tool_installer = require("mason-tool-installer")


-- mason_tool_installer.setup({
--   ensure_installed = {
--       "prettier", -- prettier formatter
--       "stylua", -- lua formatter
--       "isort", -- python formatter
--       "black", -- python formatter
--       "pylint", -- python linter
--       "eslint_d", -- js linter
--   },
--   automatic_installation = true,
-- })


-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- local servers = {
--   lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
--   html = require("lsp.config.html"),
--   -- cssls = require("lsp.config.css"),
--   -- jsonls = require("lsp.config.json"),
-- }

-- for name, config in pairs(servers) do
--   if config ~= nil and type(config) == "table" then
--     -- 自定义初始化配置文件必须实现 on_setup 方法
--     config.on_setup(lspconfig[name])
--   else
--     -- 使用默认参数
--     lspconfig[name].setup({})
--   end
-- end