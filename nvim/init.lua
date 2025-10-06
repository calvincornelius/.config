-- forked from bread's neovim config

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' ..
		data_dir ..
		'/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()
vim.call('plug#begin')

Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })       --colorscheme
Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme 2
Plug('uZer/pywal16.nvim', { ['as'] = 'pywal16' })        --or, pywal colorscheme
Plug('nvim-lualine/lualine.nvim')                        --statusline
Plug('nvim-tree/nvim-web-devicons')                      --pretty icons
Plug('folke/which-key.nvim')                             --mappings popup
Plug('romgrk/barbar.nvim')                               --bufferline
Plug('goolord/alpha-nvim')                               --pretty startup
Plug('nvim-treesitter/nvim-treesitter')                  --improved syntax
Plug('mfussenegger/nvim-lint')                           --async linter
Plug('nvim-tree/nvim-tree.lua')                          --file explorer
Plug('windwp/nvim-autopairs')                            --autopairs
Plug('lewis6991/gitsigns.nvim')                          --git
Plug('numToStr/Comment.nvim')                            --easier comments
Plug('norcalli/nvim-colorizer.lua')                      --color highlight
Plug('ibhagwan/fzf-lua')                                 --fuzzy finder and grep
Plug('numToStr/FTerm.nvim')                              --floating terminal
Plug('ron-rs/ron.vim')                                   --ron syntax highlighting
Plug('MeanderingProgrammer/render-markdown.nvim')        --render md inline
Plug('emmanueltouzery/decisive.nvim')                    --view csv files
Plug('folke/twilight.nvim')                              --surrounding dim
Plug('neovim/nvim-lspconfig')                            --lsp support
Plug('stevearc/oil.nvim')                                --backup for filetree
Plug('folke/lazydev.nvim')                               --
Plug('mfussenegger/nvim-dap')
Plug('nvim-neotest/nvim-nio')                            --three horsemen of debugging
Plug('rcarriga/nvim-dap-ui')
Plug('lvimuser/lsp-inlayhints.nvim')
Plug('nvim-mini/mini.surround')
Plug('AlphaTechnolog/pywal.nvim')
Plug('brianhuster/live-preview.nvim')

vim.call('plug#end')

vim.cmd [[set completeopt+=menuone,noselect,popup]] --cmp used with lspattach autocmd

-- move config and plugin config to alternate files
require("config.theme")
require("config.mappings")
require("config.options")
require("config.autocmd")
require("plugins.alpha")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.colorscheme")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.render-markdown")
require("lsp.lazydev")
require("plugins.lspconfig")
require("plugins.surround")
require('livepreview.config').set()

vim.defer_fn(function()
	require("plugins.autopairs")
	require("plugins.fterm")
	require("plugins.fzf-lua")
	require("plugins.nvim-tree")
	require("plugins.treesitter")
	require("plugins.twilight")
	require("plugins.which-key")
end, 100)

load_theme()
