return {
	-- 启动页
	{
		"startup-nvim/startup.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	},
	-- 主题
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		  vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- 文件树
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},
	-- 状态栏
	{
    "akinsho/bufferline.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"}
  },
	{
    "nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"}
  },
	{
    "arkav/lualine-lsp-progress",
  },
	-- 通过ctr-h,ctr-j,ctr-k,ctr-l来聚焦窗口
	{
		"christoomey/vim-tmux-navigator",
    },
	-- 语法高亮
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
  },
	-- 不同括号颜色区分，搭配treesitter
	{
		"p00f/nvim-ts-rainbow"
	},
	-- 自动补全括号
	{
		"windwp/nvim-autopairs"
	},
	-- 代码缩进块显示
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
	},
	-- 搜索文件
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		opts = {
			rocks = { "fzy", "pathlib.nvim ~> 1.0" },
		},
	},
	-- 项目管理
	{
		"ahmedkhalf/project.nvim"
	},
	-- ************ lsp配置 **************
	{
		"williamboman/mason.nvim"
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},
	{
    "neovim/nvim-lspconfig"
	},
	-- ************ 自动补全 ************
	-- 补全引擎
	{
		"hrsh7th/nvim-cmp"
	},
	-- snippet 引擎
	{
		"hrsh7th/vim-vsnip"
	},
	{
		"hrsh7th/cmp-vsnip"
	},
	-- Neovim 内置 LSP 提供的补全
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- 补全buffer
	{
		"hrsh7th/cmp-buffer",
	},
	-- 补全路径
	{
		"hrsh7th/cmp-path",
	},
	-- 补全cmd
	{
		"hrsh7th/cmp-cmdline",
	},
	-- 常见编程语言代码段
	{
		"rafamadriz/friendly-snippets",
	},
	-- 代码格式化
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	-- DAP,Debug Adapter Protocol
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
	},
	-- JSON增强
	{
		"b0o/schemastore.nvim"
	},
	-- TS增强
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils"
	},
	-- 代码注释，gcc和gc注释
	{
		"numToStr/Comment.nvim"
	},
	-- ************ ui ************
	{
		"onsails/lspkind-nvim"
	},
	{
		"lewis6991/gitsigns.nvim"
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
    }
	}
}
