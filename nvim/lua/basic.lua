
vim.g.mapleader = ','

-- Hint: use `:h <option>` to figure out the meaning if needed
-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = menu, menuone, noselect
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim
vim.opt.selection = 'inclusive'
vim.opt.magic = true
-- vim.opt.selectmode
vim.opt.mousemodel = popup
vim.opt.formatoptions= 'tcqmM'
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.showtabline = 1

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.ruler = true
vim.opt.foldenable = true
vim.opt.foldlevel = 100
-- vim.opt.backspace = 'indent, eol, start'
vim.opt.showmatch = true

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.syntax = 'on'

-- Python3
vim.g.python3_host_prog = '/usr/bin/python3'

-- file
vim.opt.autoread = true
vim.opt.autowrite = true

