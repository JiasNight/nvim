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
	}
})