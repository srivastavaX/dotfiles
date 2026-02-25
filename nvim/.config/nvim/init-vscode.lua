vim.notify("WELCOME, SRIVASTAVA", vim.log.levels.INFO)

-- require("vscode-neovim.set")
-- require("vscode-neovim.remap")

-- =====================================================================================
-- OPTIONS
-- =====================================================================================
local o = vim.opt

o.incsearch = true  -- INCREMENTAL SEARCH
o.hlsearch = false  -- NO PERSISTENT HIGHLIGHTING, VSCode HANDLES IT BETTER
o.ignorecase = true  -- CASE INSENSITIVE SEARCH
o.smartcase = true

o.clipboard	= "unnamedplus"
o.ttimeoutlen = 50    -- TERMINAL TIMEOUT LENGTH
o.timeoutlen = 300   -- REDUCING MAPPING TIMEOUT
o.updatetime = 100

-- =====================================================================================
-- LEADER KEYS
-- =====================================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- =====================================================================================
-- HELPER FUNCTIONS
-- =====================================================================================
local function vs_call(command)
    return string.format("<cmd>call VSCodeNotify('%s')<cr>", command)
end
-- <cmd> this executes the command silently without opening command line
-- <cr> simulates pressing enter. stands for carriage return

local function nmap(lhs, rhs,desc)
    vim.keymap.set("n", lhs, rhs, {silent = true, desc = desc})
end

local function vmap(lhs, rhs, desc)
    vim.keymap.set("v", lhs, rhs, {silent = true, desc = desc})
end

local function imap(lhs, rhs, desc)
    vim.keymap.set("i", lhs, rhs, {silent = true, desc = desc})
end

local function nvmap(lhs, rhs, desc)
    vim.keymap.set({"n", "v"}, lhs, rhs, {silent = true, desc = desc})
end


-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================
-- nmap('<leader>w', [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]])
-- nmap('<leader>q', [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>]])
nmap('<leader>w', vs_call('workbench.action.files.save'), "Save File")
nmap('<leader>q', vs_call('workbench.action.closeActiveEditor'), "Close editor")
nmap('<leader>Q', vs_call('workbench.action.closeWindow'), "Close Window")

nmap('<leader>ff', vs_call('workbench.action.quickOpen'), "Quick Open File")
nmap('<leader>fs', vs_call('workbench.action.showAllSymbols'), "Show All Symbols")

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================
nmap('<leader>b', vs_call('workbench.action.splitEditorRight'), "Split Editor Right")
nmap('<leader>v', vs_call('workbench.action.splitEditorDown'), "Split Editor Down")

nmap('<A-h>', vs_call('workbench.action.focusLeftGroup'), 'Focus left group')
nmap('<A-l>', vs_call('workbench.action.focusRightGroup'), 'Focus right group')
nmap('<A-k>', vs_call('workbench.action.focusAboveGroup'), 'Focus above group')
nmap('<A-j>', vs_call('workbench.action.focusBelowGroup'), 'Focus below group')


-- ============================================================================
-- LSP / CODE NAVIGATION
-- ============================================================================
nmap('gs', vs_call('workbench.action.gotoSymbol'), "Go To Symbol")
nmap('gd', vs_call('editor.action.revealDefinition'), "Go To Definition")
nmap('gD', vs_call('editor.action.revealDeclaration'), "Go To Declaration")
nmap('gi', vs_call('editor.action.goToImplementation'), "Go To Implementation")
nmap('gr', vs_call('editor.action.referenceSearch.trigger'), "References")
nmap('gy', vs_call('editor.action.goToTypeDefinition'), "Go To Type Definition")
nmap('K', vs_call('editor.action.showHover'), "Show Hover")

-- NAVIGATION HISTORY
nmap('<leader>h', vs_call('workbench.action.navigateBack'))
nmap('<leader>l', vs_call('workbench.action.navigateForward'))

-- ============================================================================
-- CODE EDITING
-- ============================================================================
nvmap('<leader>/', vs_call('editor.action.commentLine'), "Toggle Line Comment")
nvmap('<leader>?', vs_call('editor.action.blockComment'), "Toggle Block Comment")

vmap('J', vs_call('editor.action.moveLinesDownAction'), "Move Line Down")
vmap('K', vs_call('editor.action.moveLinesUpAction'), "Move Line Up")

nmap('<leader>lf', vs_call('editor.action.formatDocument'), "Format Document")
vmap('<leader>lf', vs_call('editor.action.formatSelection'), "Format Selection")

nmap('<leader>lr', vs_call('editor.action.rename'), "Rename Symbol")

-- ADDRESSES SPECIFIC ERRORS OR WARNINGS IN THE CODE
nvmap('<leader>la', vs_call('editor.action.quickFix'), "Quick Fix")
nvmap('<leader>ls', vs_call('editor.action.sourceAction'), "Source Action")

-- SELECT ALL OCCURRENCES OF THE CURRENT WORD (MULTI-CURSOR)
nmap('<leader>a', vs_call('editor.action.selectHighlights'), "Select All Occurrences")
vmap('<leader>a', vs_call('editor.action.selectHighlights'), "Select All Occurrences")

-- Clear search highlight (native vim)
nmap('<Esc>', '<cmd>nohlsearch<cr>', 'Clear highlights')


-- ============================================================================
-- TERMINAL
-- ============================================================================
nmap('<leader>t', vs_call('workbench.action.terminal.toggleTerminal'), "Toggle Terminal")
nmap('<leader>tt', vs_call('workbench.action.terminal.new'), "New Terminal")


-- ===========================================================================
-- MISC
-- ============================================================================
nmap('<leader>e', vs_call('workbench.view.explorer'), "Toggle Explorer")
-- nmap('<leader>b', vscode_call('workbench.action.toggleSidebarVisibility'), 'Toggle sidebar')

nmap('[c', vs_call('workbench.action.editor.previousChange'), 'Previous change')
nmap(']c', vs_call('workbench.action.editor.nextChange'), 'Next change')

-- ACCEPT SUGGESTION
imap('<Tab>', vs_call('editor.action.inlineSuggest.trigger.commit'), "Accept Suggestion")

-- TRIGGER SUGGESTION
--imap('<C-l>', vs_call('editor.action.triggerSuggest'), "Trigger Suggestion")
-- <c-space> already does that -> vscode intenrnal

-- ZEN MODE
nmap('<leader>z', vs_call('workbench.action.toggleZenMode'), "Toggle Zen Mode")

-- COMMAND PALETTE
nmap('<leader>p', vs_call('workbench.action.showCommands'), "Command Palette")
