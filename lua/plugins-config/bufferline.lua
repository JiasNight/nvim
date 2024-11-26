local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
  return
end
 
bufferline.setup({
	options = {
		-- 点击关闭按钮关闭
		close_command = "bdelete! %d",
		-- 右键点击关闭
		right_mouse_command = "bdelete! %d",
		indicator = {
			-- 分割线
			icon = '▎',
			style = 'underline',
		},
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer" ,
				text_align = "left",
				separator = true,
			}
		},
		-- 使用 nvim 内置 LSP  后续课程会配置
		diagnostics = "nvim_lsp",
		-- 可选，显示 LSP 报错图标
		--- @diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end
	}
})