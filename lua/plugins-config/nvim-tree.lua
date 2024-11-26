local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
	sort_by = "case_sensitive",
	-- 是否显示 git 状态
	git = {
		enable = true,
	},
	-- project plugin 需要这样设置
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- 过滤文件
	filters = {
		-- 过滤 dotfile
		dotfiles = true,
		 -- 其他过滤目录
		custom = { "node_modules" },
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
	view = {
		-- 文件浏览器展示位置，左侧：left, 右侧：right
		side = "left",
		-- 行号是否显示
		number = false,
		relativenumber = false,
		-- 显示图标
		signcolumn = "yes",
		-- 宽度
		width = 30,
		-- 隐藏根目录
			-- hide_root_folder = false,
			-- 自定义列表中快捷键
			--- mappings = {
					-- custom_only = false,
					-- list = list_keys,
			-- },
	},
	renderer = {
		group_empty = true,
	},
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])