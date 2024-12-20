local keybindings = require("keybindings")
local ts_utils = require("nvim-lsp-ts-utils")
local opts = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    keybindings.mapLSP(buf_set_keymap)
    -- TypeScript 增强
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,
      -- import all ms
      import_all_timeout = 5000,
      -- lower numbers = higher priority
      import_all_priorities = {
        -- add to existing import statement
        same_file = 1,
        -- git files or files with relative path markers
        local_files = 2,
        -- loaded buffer content
        buffer_content = 3,
        -- loaded buffer names
        buffers = 4,
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- if false will avoid organizing imports
      always_organize_imports = true,
      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},
      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    })
    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)
    -- 绑定增强插件快捷键
    keybindings.mapTsLSP(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
