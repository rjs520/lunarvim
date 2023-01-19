--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "tokyonight-night"
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true
-- lvim.transparent_window = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-m>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<C-q>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-e>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<C-tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-w>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-t>"] = ":terminal<CR>"
lvim.keys.normal_mode["<A-f>"] = ":lua require('jdtls.setup').add_commands()<CR>"
lvim.keys.normal_mode["<C-m>"] = ":MarkdownPreviewToggle<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	--   -- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}
-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = {
	components.branch,
	components.diff,
	components.diagnostics,
}
lvim.builtin.lualine.sections.lualine_c = {
	components.filename,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.encoding,
	components.filetype,
	components.lsp,
	{
		require("noice").api.status.message.get_h1,
		cond = require("noice").api.status.message.has,
	},
	{
		require("noice").api.status.command.get,
		cond = require("noice").api.status.command.has,
		color = { fg = "#ff9e64" },
	},
	{
		require("noice").api.status.mode.get,
		cond = require("noice").api.status.mode.has,
		color = { fg = "#ff9e64" },
	},
	{
		require("noice").api.status.search.get,
		cond = require("noice").api.status.search.has,
		color = { fg = "#ff9e64" },
	},
}
lvim.builtin.lualine.sections.lualine_y = {
	components.spaces,
	components.treesitter,
}
lvim.builtin.lualine.sections.lualine_z = {
	components.location,
	components.progress,
}
-- lualine themes
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.style = "default" -- or "none"
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["w"] = { name = "vimwiki" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["C"] = { name = "test" }
lvim.builtin.which_key.mappings["t"] = {
	name = "Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["x"] = {
	name = "jdtls",
	r = { "<cmd>JdtUpdateConfig<cr>", "JdtUpdateConfig" },
	b = { "<cmd>JdtBytecode<cr>", "JdtBytecode" },
	c = { "<cmd>JdtCompile<cr>", "JdtCompile" },
	j = { "<cmd>JdtJol<cr>", "JdtJol" },
	x = { "cmd>JdtJshell<cr>", "JdtJshell" },
	w = { "<cmd>JdtRestart<cr>", "JdtRestart" },
	s = { "<cmd>JdtSetRuntime<cr>", "JdtSetRuntime" },
	u = { "<cmd>JdtShowLogs<cr>", "JdtShowLogs" },
	t = { "<cmd>JdtWipeDataAndRestart<cr>", "jdtWipeDataAndRestart" },
}
lvim.builtin.which_key.mappings["r"] = {
	name = "code_runner",
	r = { "<cmd>RunCode<cr>", "RunCode" },
	f = { "<cmd>Runfile<cr>", "RunFile" },
	p = { "<cmd>RunProject<cr>", "RunProject" },
	y = { "<cmd>RunFile tab<cr>", "RunFileTab" },
	c = { "<cmd>RunClose<cr>", "RunClose" },
	v = { "<cmd>CRFiletype<cr>", "CRFiletype" },
	z = { "<cmd>CRProjects<cr>", "CRProjects" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_intlled = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{ command = "clang-format", filetypes = { "java" } },
	{ command = "markdownlint", filetypes = { "markdown" } },
	{ command = "rustfmt", filetypes = { "rust" } },
	{ command = "stylua", filetypes = { "lua" } },
	--  { command = "autopep8", firetypes = { "python" } },
	{
		--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "eslint_d",
		--     ---@usage arguments to pass to the formatter
		--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--print-with", "100" },
		--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "typescript", "typescriptreact", "vue", "javascript" },
	},
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{
		--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "shellcheck",
		--     ---@usage arguments to pass to the formatter
		--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--severity", "warning" },
	},
	{
		command = "codespell",
		--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "javascript", "python" },
	},
})
-- -- set additional code_actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		command = "proselint",
	},
})

-- Additional Plugins
lvim.plugins = {
	{ "projekt0n/github-nvim-theme" },
	{ "echasnovski/mini.nvim" },
	{ "echasnovski/mini.animate" },
	{ "rcarriga/nvim-notify" },
	{ "gelguy/wilder.nvim" },
	{
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	},
	{
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup()
		end,
	},
	{ "CRAG666/code_runner.nvim" },
	{
		"Kasama/nvim-custom-diagnostic-highlight",
		config = function()
			require("nvim-custom-diagnostic-highlight").setup({})
		end,
	},
	{ "vimwiki/vimwiki" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "manzeloth/live-server" },
	{ "MunifTanjim/nui.nvim" },
	{ "Pocco81/DAPInstall.nvim" },
	{ "mfussenegger/nvim-dap-python" },
	{ "Weissle/persistent-breakpoints.nvim" },
	{ "jayp0521/mason-nvim-dap.nvim" },
	{ "oberblastmeister/neuron.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "ryanoasis/vim-devicons" },
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{ "ggandor/leap.nvim" },
	{ "kosayoda/nvim-lightbulb", requires = "antoinemadec/FixCursorHold.nvim" },
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{ "tpope/vim-dadbod" },
	{ "mfussenegger/nvim-lint" },
	{ "kristijanhusak/vim-dadbod-ui", after = "vim-dadbod" },
	{ "nanotee/sqls.nvim" },
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		run = "npm install --prefix server",
	},
	{ "tzachar/cmp-tabnine" },
	{ "mhartington/formatter.nvim" },
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-b>", "<C-f>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	--[[	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},]]
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"echasnovski/mini.map",
		branch = "stable",
		config = function()
			require("mini.map").setup()
			local map = require("mini.map")
			map.setup({
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.diagnostic({
						error = "DiagnosticFloatingError",
						warn = "DiagnosticFloatingWarn",
						info = "DiagnosticFloatingInfo",
						hint = "DiagnosticFloatingHint",
					}),
				},
				symbols = {
					encode = map.gen_encode_symbols.dot("4x2"),
				},
				window = {
					side = "right",
					width = 20, -- set to 1 for a pure scrollbar :)
					winblend = 15,
					show_integration_count = false,
				},
			})
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 0
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	-- You must install glow globally
	-- https://github.com/charmbracelet/glow
	-- yay -S glow
	{
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	},
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	{ "wakatime/vim-wakatime" },
	{ "kdheepak/lazygit.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
		config = function()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			-- NOTE: this is changed from v1.x, which used the old style of highlight groups
			-- in the form "LspDiagnosticsSignWarning"

			require("neo-tree").setup({
				close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				sort_case_insensitive = false, -- used when sorting files and directories in the tree
				sort_function = nil, -- use a custom function for sorting files and directories in the tree
				-- sort_function = function (a,b)
				--       if a.type == b.type then
				--           return a.path > b.path
				--       else
				--           return a.type > b.type
				--       end
				--   end , -- this sorts files and directories descendantly
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						-- expander config, needed for nesting files
						with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "ﰊ",
						-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
						-- then these will never be used.
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
						highlight = "NeoTreeFileName",
					},
					git_status = {
						symbols = {
							-- Change type
							added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
							modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "left",
					width = 40,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
						},
						["<2-LeftMouse>"] = "open",
						["<cr>"] = "open",
						["<esc>"] = "revert_preview",
						["P"] = { "toggle_preview", config = { use_float = true } },
						["S"] = "open_split",
						["s"] = "open_vsplit",
						-- ["S"] = "split_with_window_picker",
						-- ["s"] = "vsplit_with_window_picker",
						["t"] = "open_tabnew",
						-- ["<cr>"] = "open_drop",
						-- ["t"] = "open_tab_drop",
						["w"] = "open_with_window_picker",
						--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
						["C"] = "close_node",
						["z"] = "close_all_nodes",
						--["Z"] = "expand_all_nodes",
						["a"] = {
							"add",
							-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
							-- some commands may take optional config options, see `:h neo-tree-mappings` for details
							config = {
								show_path = "none", -- "none", "relative", "absolute"
							},
						},
						["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
						["d"] = "delete",
						["r"] = "rename",
						["y"] = "copy_to_clipboard",
						["x"] = "cut_to_clipboard",
						["p"] = "paste_from_clipboard",
						["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
						-- ["c"] = {
						--  "copy",
						--  config = {
						--    show_path = "none" -- "none", "relative", "absolute"
						--  }
						--}
						["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
						["q"] = "close_window",
						["R"] = "refresh",
						["?"] = "show_help",
						["<"] = "prev_source",
						[">"] = "next_source",
					},
				},
				nesting_rules = {},
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = true,
						hide_gitignored = true,
						hide_hidden = true, -- only works on Windows for hidden files/directories
						hide_by_name = {
							--"node_modules"
						},
						hide_by_pattern = { -- uses glob style patterns
							--"*.meta",
							--"*/src/*/tsconfig.json",
						},
						always_show = { -- remains visible even if other settings would normally hide it
							--".gitignored",
						},
						never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
							--".DS_Store",
							--"thumbs.db"
						},
						never_show_by_pattern = { -- uses glob style patterns
							--".null-ls_*",
						},
					},
					follow_current_file = false, -- This will find and focus the file in the active buffer every
					-- time the current file is changed while the tree is open.
					group_empty_dirs = false, -- when true, empty folders will be grouped together
					hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
					-- in whatever position is specified in window.position
					-- "open_current",  -- netrw disabled, opening a directory opens within the
					-- window like netrw would, regardless of window.position
					-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
					use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
					-- instead of relying on nvim autocmd events.
					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["D"] = "fuzzy_finder_directory",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["[g"] = "prev_git_modified",
							["]g"] = "next_git_modified",
						},
					},
				},
				buffers = {
					follow_current_file = true, -- This will find and focus the file in the active buffer every
					-- time the current file is changed while the tree is open.
					group_empty_dirs = true, -- when true, empty folders will be grouped together
					show_unloaded = true,
					window = {
						mappings = {
							["bd"] = "buffer_delete",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
						},
					},
				},
				git_status = {
					window = {
						position = "float",
						mappings = {
							["A"] = "git_add_all",
							["gu"] = "git_unstage_file",
							["ga"] = "git_add_file",
							["gr"] = "git_revert_file",
							["gc"] = "git_commit",
							["gp"] = "git_push",
							["gg"] = "git_commit_and_push",
						},
					},
				},
			})

			vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
		end,
	},
}
--[[lvim.autocommands = {
  {
    { "BufEnter", "Filetype" },
    {
      desc = "Open mini.map and exclude some filetypes",
      pattern = { "*" },
      callback = function()
        local exclude_ft = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        }

        local map = require('mini.map')
        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
          vim.b.minimap_disable = true
          map.close()
        elseif vim.o.buftype == "" then
          map.open()
        end
      end,
    },
  },
}]]
lvim.builtin.treesitter.rainbow.enable = true
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- my own config
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.notify = require("notify")

require("p-leap")

require("virtual-text")

require("lspconfig").sqls.setup({
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
})

require("impatient")

require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
		config = {
			css = "// %s",
		},
		javascript = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
	},
})
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("neo-tree").setup({
	source_selector = {
		winbar = true,
		statusline = true,
	},
})
require("code_runner").setup({
	-- choose default mode (valid term, tab, float, toggle, buf)
	mode = "term",
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = true,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	term = {
		--  Position to open the terminal, this option is ignored if mode is tab
		position = "bot",
		-- window size, this option is ignored if tab is true
		size = 8,
	},
	float = {
		-- Key that close the code_runner floating window
		close_key = "<ESC>",
		-- Window border (see ':h nvim_open_win')
		border = "none",

		-- Num from `0 - 1` for measurements
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = "FloatBorder",
		float_hl = "Normal",

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	filetype_path = "", -- No default path defined
	filetype = {
		javascript = "node",
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
		python = "python -u",
		sh = "bash",
		typescript = "ts-node",
		rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
	},
	project_path = "", -- No default path defined
	project = {},
})
-- wilder,nvim
local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
			set_pcre2_pattern = 1,
		}),
		wilder.python_search_pipeline({
			pattern = "fuzzy",
		})
	),
})

local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.basic_highlighter(),
}

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer({
			highlighter = highlighters,
		}),
		["/"] = wilder.wildmenu_renderer({
			highlighter = highlighters,
		}),
	})
)

require("mini.animate").setup()
require("telescope").load_extension("noice")
