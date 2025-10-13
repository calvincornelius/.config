-- mappings, including plugins

local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<leader>q", ":BufferClose<CR>")
map("n", "<leader>Q", ":BufferClose!<CR>")
map("n", "<leader>U", "::bufdo bd<CR>")         --close all
map('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer


-- windows - ctrl nav, fn resize
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<F5>", ":resize +2<CR>")
map("n", "<F6>", ":resize -2<CR>")
map("n", "<F7>", ":vertical resize +2<CR>")
map("n", "<F8>", ":vertical resize -2<CR>")

--default maps
map("n", "<leader>w", ":w<CR>")                           --write but one less key
map("n", "<leader>o", ":update<CR>:source<CR>")
map('n', '<leader>z', ":lua require('FTerm').open()<CR>") --open term
map("n", "<leader>e", ":NvimTreeToggle<CR>")              --open file explorer
map("n", "<leader>s", ":%s//g<Left><Left>")               --replace all
map("n", "<leader>Q", ":qa<CR>")

--lsp
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gk', vim.lsp.buf.hover)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gK', vim.lsp.buf.signature_help)
map('n', '<space>D', vim.lsp.buf.type_definition)
map('n', '<space>rn', vim.lsp.buf.rename)
map('n', '<space>ca', vim.lsp.buf.code_action)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<space>lf', function() vim.lsp.buf.format { async = true } end)
map('i', '<c-e>', function() vim.lsp.completion.get() end)

--clipboard
map({ 'n', 'v' }, '<leader>n', ':norm ')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')
map({ 'n', 'v' }, '<leader>p', '"+p')

map("n", "<leader>t", switch_theme)                                   --cycle themes
map("n", "<leader>P", ":PlugInstall<CR>")                             --vim-plug
map('t', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").close()<CR>') --preserves session
map("n", "<leader>ch", "<cmd>!chmod +x %<CR>")                        --make a file executable
map("n", "<leader>mv", ":!mv % ")                                     --move a file to a new dir
--map("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>')            --open a url under cursor
map("v", "<leader>i", "=gv")                                          --auto indent
map("n", "<leader>T", ":Twilight<CR>")                                --surrounding dim
map("n", "<leader>f", ":FZF<CR>")									  --rough fzf... replace with telescope


map("n", "<leader>ma", function() --quick make in dir of buffer
	local bufdir = vim.fn.expand("%:p:h")
	vim.cmd("lcd " .. bufdir)
	vim.cmd("!sudo make uninstall && sudo make clean install %")
end)
