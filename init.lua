--TODO: finish highlights, bar, and LSP.
vim.o.termguicolors = true
require('plugins')
require('keymaps')
require('top-bufferline')
require('line')
require'lspconfig'.pyright.setup{}

--Autostart 
vim.g.coq_settings = {auto_start = true}
vim.g.coq_settings = {auto_start = 'shut-up'}

--Incremental live completion
vim.o.inccommand = "nosplit"

--plugin loading
require("colorizer").setup()
require('nord').set()

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Save undo history
vim.cmd[[set undofile]]
vim.cmd[[set termguicolors]]
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)
--relative number
vim.opt.number = true
vim.opt.relativenumber = true

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
