-- =================================== Key Mappings =====================================

-- Use SPACE as leader
vim.g.mapleader = " "

-- Open NetRw directory listing
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRw directory listing" })

-- Use "jj" to go from INSERT to NORMAL mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape INSERT mode" })

-- Move highlighted text up and down (respects indentation)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift highlighted text up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift highlighted text down" })

-- Simplify moving between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Turn highlighting off (used after successful search)
vim.keymap.set("n", "<C-i>", ":nohlsearch<CR>", { desc = "Turn off highlighting after search" })

-- Add versions of yank that copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank highlighted text to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank rest of line to clipboard" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- ===================================== Settings ========================================

-- Include line numbers in gutter
vim.opt.number = true

-- Use relative numbers (for jumping)
vim.opt.relativenumber = true

-- Use auto indenting for new lines
vim.opt.smartindent = true

-- Do not wrap text
vim.opt.wrap = false

-- Do not use swap files
vim.opt.swapfile = false

-- Do not create a backup file
vim.opt.backup = false

-- Ybnq va gur onpxhc svyr fgberq va haqbqve
vim.opt.undofile = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Incrementally match as search is being typed in
vim.opt.incsearch = true

-- Enable 24-bit color in the terminal UI
vim.opt.termguicolors = true

-- Cursor offset from top and bottom of page
vim.opt.scrolloff = 10

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- ================================== Plugin Manager =====================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Telescope (Fuzzy Finder) --
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Colortheme --
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	-- Tree Sitter --
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"bash",
					"c",
					"html",
					"lua",
					"markdown",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/playground", -- :TSPlayground generates an AST
	},

	-- Autoformat --
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				python = { "isort", "black" },
			},
		},
	},

	-- LSP & Autocomplete --
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "VeryLazy",
	},

	-- Comment Plugins --
	{
		"numToStr/Comment.nvim",
		opts = {
			ignore = "^$", -- ignore empty lines
			toggler = {
				line = "<leader>cl",
				block = "<leader>cb",
			},
			opleader = {
				line = "<leader>cl",
				block = "<leader>cb",
			},
		},
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Miscellaneous Plugins --
	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%21:%2v"
			end
		end,
	},

	-- File Tree --
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				filters = { dotfiles = false },
			})
		end,
	},
})

-- ==================================== Color Plugin =====================================

-- Set color scheme
vim.cmd.colorscheme("rose-pine")

-- ================================= Telescope Plugin ====================================

require("telescope").setup({
	defaults = {
		mappings = {
			n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- =============================== Autocomplete Plugin ==================================

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm(cmp_select),
		["<C-Space>"] = cmp.mapping.complete,
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- =================================== LSP Plugin =======================================

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(event, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	lsp_zero.default_keymaps({ buffer = bufnr })

	map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
	map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	map("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "rust_analyzer" },
	handlers = { lsp_zero.default_setup },
})

vim.diagnostic.config({ virtual_text = true })

-- ============================== Neovim File Tree =====================================

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", { desc = "Open [P]roject [V]iew" })

require("nvim-tree").setup({
	sort = { sorter = "case_sensitive" },
	view = { width = 30 },
	renderer = { group_empty = true },
	filters = { dotfiles = true },
})

-- ================================ Highlight Yank =====================================

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highllight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- =========================== Context-Aware Comments ==================================

require("Comment").setup({
	enable_autocmd = false,
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
