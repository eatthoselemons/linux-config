vim.cmd([[
  set expandtab
  set shiftwidth=2
  set tabstop=2

  filetype plugin indent on
  
  set smartcase
  set ignorecase
  set smartindent
  syntax on
]])

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set({"n", "v"}, "J", "10j")
vim.keymap.set({"n", "v"}, "K", "10k")
vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

-- indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.expandtab = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- More intuitive splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Line breaks
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.wrap = true

-- space as a dot
-- ,space:·
-- multispace changes what the tabcharacter looks like
-- this errors out for some reason the character won't display
-- eol:\\u21B4,
vim.o.list = true
vim.o.listchars = "tab:| ,trail:+,precedes:<,extends:>,nbsp:␣,space: ,multispace:  ,"


-- from u/caagr98 on reddit: https://www.reddit.com/r/neovim/comments/17aponn/comment/k5f2n7t/
local function update_lead()
  local lcs = vim.opt_local.listchars:get()
  local tab = vim.fn.str2list(lcs.tab)
  local space = vim.fn.str2list(lcs.multispace or lcs.space)
  local lead = {tab[1]}
  for i = 1, vim.bo.tabstop-1 do
      lead[#lead+1] = space[i % #space + 1]
  end
  -- vim.o.listchars = "tab:» ,trail:+,precedes:<,extends:>,nbsp:␣,eol:↴,leadmultispace:" + vim.fn.list2str(lead)
  -- vim.opt_local.listchars = vim.opt_local.listchars + 'leadmultispace:' + vim.fn.list2str(lead)
  vim.opt_local.listchars:append({ leadmultispace = vim.fn.list2str(lead) })
end

vim.api.nvim_create_autocmd("OptionSet", { pattern = { "listchars", "tabstop", "filetype" }, callback = update_lead })
vim.api.nvim_create_autocmd("VimEnter", { callback = update_lead, once = true })

vim.wo.number = true

require("config.lazy")
-- require('plugins.leap.nvim').set_default_mappings()

vim.cmd("colorscheme habamax")

vim.api.nvim_create_user_command('SyntaxHere', function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local line, col = pos[1], pos[2] + 1
	print 'Regex (legacy) Syntax Highlights'
	print '--------------------------------'
	print(' effective: ' .. vim.fn.synIDattr(vim.fn.synID(line, col, true), 'name'))
	for _, synId in ipairs(vim.fn.synstack(line, col)) do
		local synGroupId = vim.fn.synIDtrans(synId)
		print(' ' .. vim.fn.synIDattr(synId, 'name') .. ' -> ' .. vim.fn.synIDattr(synGroupId, 'name'))
	end
	print ' '
	print 'Tree-sitter Syntax Highlights'
	print '--------------------------------'
	vim.print(vim.treesitter.get_captures_at_cursor(0))
end, {})
