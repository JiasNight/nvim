-- 设置 lazy.nvim 的路径，在~\AppData\Local\nvim-data\lazy\lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 导入并初始化 lazy.nvim
require("lazy").setup({
  spec = {
    -- 导入插件
    { import = "plugins" },
  },
  ui = {
    border = "rounded"
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight", "habamax" } },
  -- 自动检查插件更新
  checker = { enabled = false },
  -- 表示插件默认将以懒加载模式加载
  defaults = {
    lazy = true,
    version = false,
  }
})