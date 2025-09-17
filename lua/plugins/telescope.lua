return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')

		-- Keybindings
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Search string" })

		-- Optional: Basic telescope setup for better defaults
		require('telescope').setup({
			defaults = {
				-- Configure default options here
				prompt_prefix = "🔍 ",
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"*.pyc",
				}
			},
			pickers = {
				git_files = {
					theme = "ivy",
				},
				help_tags = {
					theme = "ivy",
				},
			},
		})
	end,
}
