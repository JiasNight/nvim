local mason_status, mason = pcall(require, "mason")
if not mason_status then
    vim.notify("没有找到 mason")
  return
end

local mason_lspconfig = require("mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")
 
mason.setup({
	ui = {
		icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
	}
})

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
      -- "tsserver",
      "html",
      "cssls",
      "lua_ls",
      -- "jedi_language_server",
      "jsonls",
      -- "clangd",
      -- "omnisharp_mono",
      -- "rust_analyzer",
      "yamlls",
      "taplo",
      -- "marksman",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
  ensure_installed = {
      "prettier", -- prettier formatter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "pylint", -- python linter
      "eslint_d", -- js linter
  },
  automatic_installation = true,
})


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