local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
  return
end
 
treesitter.setup({
	-- 添加不同语言
	ensure_installed = { "vim", "vimdoc", "bash", "c", "cpp", "java", "vue", "html", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "sql", "markdown", "markdown_inline" },
	-- 启用代码高亮模块
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	 --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
    -- 启用基于 Treesitter 的代码格式化(=)
	indent = {
		enable = true
	},
	-- 不同括号颜色区分
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
})