local options = {
	laststatus = 3,
	ruler = false, --disable extra numbering
	showmode = false, --not needed due to lualine
	showcmd = false,
	wrap = false,
	mouse = "", --enable mouse
	clipboard = "unnamedplus", --system clipboard integration
	history = 100, --command line history
	swapfile = false, --swap just gets in the way
	backup = false,
	undofile = true, --undos are saved to file
	cursorline = false, --highlight line
	ttyfast = true, --faster scrolling
	smoothscroll = true,
	title = true,
	winborder = "rounded",
	tabstop = 4,
	shiftwidth = 4,
	signcolumn = "yes",
	number = true, --numbering lines
	relativenumber = true, --toggle bound to leader nn
	numberwidth = 4,
	smarttab = true, --indentation stuff
	cindent = true,
	autoindent = false,
	foldmethod = "expr",
	--foldlevel = 20, --disable folding, lower #s enable
	foldexpr = "nvim_treesitter#foldexpr()",
	termguicolors = true,

	hlsearch = false,
	ignorecase = true, --ignore case while searching
	smartcase = true, --but do not ignore if caps are used

	conceallevel = 2, --markdown conceal
	concealcursor = "nc",

	splitkeep = 'screen', --stablizie window open/close
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
	signs = false,
})
