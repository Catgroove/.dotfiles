return {
	-- Filetree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					local lib = require("nvim-tree.lib")

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					local function grep_at_dir()
						local node = lib.get_node_at_cursor()
						if not node then
							return
						end
						require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
					end

					-- default mappings
					api.config.mappings.default_on_attach(bufnr)

					-- custom mappings
					vim.keymap.set("n", "<leader>gr", grep_at_dir, opts("grep at dir"))
				end,
				filters = {
					dotfiles = false,
					exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
				},
				disable_netrw = true,
				hijack_netrw = true,
				hijack_cursor = true,
				hijack_unnamed_buffer_when_opening = false,
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = false,
				},
				view = {
					adaptive_size = false,
					side = "left",
					width = 30,
					preserve_window_proportions = true,
				},
				git = {
					enable = false,
					ignore = true,
				},
				filesystem_watchers = {
					enable = true,
				},
				actions = {
					open_file = {
						resize_window = true,
					},
				},
				renderer = {
					highlight_git = false,
					highlight_opened_files = "none",
					root_folder_label = false,

					indent_markers = {
						enable = false,
					},

					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = false,
						},

						glyphs = {
							default = "",
							symlink = "",
							folder = {
								default = "",
								empty = "",
								empty_open = "",
								open = "",
								symlink = "",
								symlink_open = "",
								arrow_open = "",
								arrow_closed = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
			})
			vim.g.nvimtree_side = "left"
		end,
	},

	-- Search and Replace
	"MagicDuck/grug-far.nvim",
	config = function()
		local grug = require("grug-far")
		grug.setup({})

		vim.keymap.set("n", "<leader>S", grug.open, { desc = "[S]earch and Replace" })
	end,
}
