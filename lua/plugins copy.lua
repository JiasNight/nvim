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
		"williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
	},
	{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"simrat39/rust-tools.nvim",
    },
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
	-- 补全源
	{
		"hrsh7th/vim-vsnip",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
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
	-- 代码注释，gcc和gc注释
	{
		"numToStr/Comment.nvim"
	},
	-- ************ ui ************
	{
		"onsails/lspkind-nvim"
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	}
}
