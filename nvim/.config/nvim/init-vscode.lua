vim.notify("VS CODE INIT LOADED", vim.log.levels.INFO)

-- require("vscode-neovim.set")
-- require("vscode-neovim.remap")

local o = vim.opt

o.incsearch = true  -- show search matches as you type
o.hlsearch = true  -- false, unless you like neon text everywhere
o.ignorecase = true
o.smartcase = true

o.mouse = "a"   -- enable in "all" modes
o.clipboard	= "unnamedplus"
o.ttimeoutlen = 50    -- terminal timeout length
o.timeoutlen = 300   -- reducing mapping timeout
o.updatetime = 100
o.isfname:append("@-@")  -- Allows filenames(like: my-file@.js)


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function nmap(lhs, rhs)
    vim.keymap.set("n", lhs, rhs)
end

local function vmap(lhs, rhs)
    vim.keymap.set("v", lhs, rhs)
end

-- <cmd> this executes the command silently without opening command line
-- <cr> simulates pressing enter. stands for carriage return

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- WORKBENCH
nmap('<leader>w', [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]])
nmap('<leader>q', [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>]])

nmap('<leader>b', [[<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>]])
nmap('<leader>e', [[<cmd>call VSCodeNotify('workbench.view.explorer')<cr>]])

nmap('ff', [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])

nmap('<A-[>', [[<cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<cr>]])
nmap('<A-]>', [[<cmd>call VSCodeNotify('workbench.action.focusRightGroup')<cr>]])

nmap('<leader>v', [[<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<cr>]])
nmap('<leader>vv', [[<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<cr>]])

nmap('<leader>h', [[<cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>]])

nmap('<S-Tab>', [[<cmdall VSCodeNotify('editor.action.triggerSuggest')<cr>]])
nmap('<Tab>', [[<cmd>call VSCodeNotify('editor.action.inlineSuggest.commit')<cr>]])

-- EDITOR
nmap('<leader>c', [[<cmd>call VSCodeNotify('editor.action.commentLine')<cr>]])
nmap('<leader>cc', [[<cmd>call VSCodeNotify('editor.action.blockComment')<cr>]])
vmap('<leader>c', [[<cmd>call VSCodeNotify('editor.action.commentLine')<cr>]])
vmap('<leader>cc', [[<cmd>call VSCodeNotify('editor.action.blockComment')<cr>]])

vmap('J', [[<cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<cr>]])
vmap('K', [[<cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<cr>]])

nmap('<leader>p', [[<cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<cr>]])

vmap('<leader>a', [[<cmd>call VSCodeNotify('editor.action.selectHighlights')<cr>]])
nmap('<leader>a', [[<cmd>call VSCodeNotify('editor.action.selectHighlights')<cr>]])


-- TERMINAL
nmap('<leader>t', [[<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<cr>]])
