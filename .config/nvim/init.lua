local plugins = {
	"nvim-treesitter/nvim-treesitter",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"rose-pine/neovim",
	"mbbill/undotree",
}

vim.api.nvim_create_user_command("UpdatePlugins", function ()
	local PLUGIN_PATH = os.getenv("HOME") .. "/.config/nvim/pack/vendor/start/"
	local cmds = {}
	vim.system({"rm", "-rf", PLUGIN_PATH}):wait()
	print("Installing plugins")
	for i = 1, #plugins do
		local url = "https://github.com/" .. plugins[i] .. ".git"
		local dst = PLUGIN_PATH .. string.gsub(plugins[i], "/", "-")
		table.insert(cmds, vim.system({"git", "clone", url, dst}))
	end
	for i = 1, #cmds do
		cmds[i]:wait()
		print("Installed " .. plugins[i])
	end
	print("Done")
end, {})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.mouse = ""

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")
vim.keymap.set("n", "<leader>=", "byiwwwviwpbbbviwpw")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- nvim-treesitter/nvim-treesitter
local parsers = { "c", "lua", "python" }
require("nvim-treesitter").install(parsers)
vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function() vim.treesitter.start() end,
})

-- nvim-telescope/telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

-- rose-pine/neovim
require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd.colorscheme("rose-pine")

-- mbbill/undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

