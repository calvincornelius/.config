local options = {
	laststatus = 3,
	ruler = false,
	showmode = false,
	showcmd = false,
	wrap = false,
	mouse = "",
	history = 100,
	swapfile = false,
	backup = false,
	undofile = true,
	cursorline = false,
	ttyfast = true,
	smoothscroll = true,
	title = true,
	winborder = "rounded",
	tabstop = 4,
	shiftwidth = 4,
	signcolumn = "yes",
	number = true,
	relativenumber = true,
	numberwidth = 4,
	smarttab = true,
	cindent = true,
	autoindent = false,
	foldmethod = "expr",
	foldlevel = 99,
	foldexpr = "nvim_treesitter#foldexpr()",
	termguicolors = true,

	hlsearch = false,
	ignorecase = true,
	smartcase = true,

	conceallevel = 2,
	concealcursor = "nc",

	splitkeep = 'screen',
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
	signs = false,
})
