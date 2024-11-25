-- 基础配置
require("basic")
-- lazy初始化
require("lazy-init")
-- 快捷键映射
require("keybindings")
-- 主题设置
require("colorscheme")
-- 加载插件的配置
require("plugins-config.startup")
require("plugins-config.nvim-tree")
require("plugins-config.bufferline")
require("plugins-config.lualine")
require("plugins-config.nvim-treesitter")
require("plugins-config.telescope")
require("plugins-config.nvim-autopairs")
require("plugins-config.project")
require("lsp.setup")
require("plugins-config.cmp")