local status, telescope = pcall(require, "telescope.builtin")
if not status then
    vim.notify("没有找到 telescope")
  return
end
