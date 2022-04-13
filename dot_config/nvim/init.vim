lua << EOF
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'mbbill/undotree' -- Navigate undos
  use 'tpope/vim-surround' -- change/append sourroundings of sommething - cs'} = change sourrounding single quotes with wavy brackets
  use 'tpope/vim-repeat' -- make surround actions repeatable
  use 'kdheepak/lazygit.nvim'
  use 'rhysd/git-messenger.vim' -- <leader>gm show last git commit for current line (similar to gitlens)
  use 'tpope/vim-sleuth' -- Autodetect indentation rules
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'tpope/vim-abolish' -- crs > convert to snake case
  use 'christoomey/vim-system-copy' -- cpit > this copies the content of a tag into your clipboard
  use 'vim-airline/vim-airline' -- shows buffers for files
  use 'vim-airline/vim-airline-themes'
  use 'ntpeters/vim-better-whitespace' -- better whitespace cleaning
  use 'nelstrom/vim-visual-star-search' -- use * to jump to next instace of current word
  use 'psliwka/vim-smoothie' -- smooth scrolling
  use 'kyazdani42/nvim-web-devicons' -- for file icons
  use 'andymass/vim-matchup' -- improve % and add text objects i% and a%
  use 'chaoren/vim-wordmotion' -- camelcasemotion
  use 'cocopon/iceberg.vim'
  use 'rafamadriz/neon'
  use {'folke/tokyonight.nvim', branch = 'main' }
  use 'ku-s-h/summerfruit256.vim'
  use 'kana/vim-textobj-user' -- Add new textobjects easily
  use 'wellle/targets.vim' -- more text objects, enables stuff like ci, or ci/
  use 'pechorin/any-jump.nvim' -- Use regex to 'go to definition' anywhere (<leader>j)
  use 'rbgrouleff/bclose.vim' -- Dependency of ranger.vim
  use 'francoiscabrol/ranger.vim' -- Use ranger inside of vim
  use 'machakann/vim-highlightedyank' -- highlight yanked text
  use 'vim-scripts/ReplaceWithRegister' -- <gr>motion replaces text with register
  use 'Matt-A-Bennett/vim-surround-funk' -- <dsf> delete sourrounding fuction, <gs> wrap current fuction with the one in register
  use 'jremmen/vim-ripgrep'
  use 'dhruvasagar/vim-table-mode'
  use 'godlygeek/tabular'
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  use {'junegunn/fzf', run = function()
    vim.fn['fzf#install']()
  end
  }
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-rmarkdown'
  use 'vim-pandoc/vim-pandoc-after'
  use 'airblade/vim-rooter'
  use 'farmergreg/vim-lastplace'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {'earthly/earthly.vim', branch = 'main' }
  use 'hashivim/vim-hashicorp-tools'
  use 'alker0/chezmoi.vim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'petertriho/cmp-git'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'cmp-nvim-lsp-signature-help'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/cmp-path'
  use "rafamadriz/friendly-snippets"
  use {
    "hrsh7th/nvim-cmp",
    branch = "dev", --float menu
    after = "friendly-snippets",
  }
  use 'github/copilot.vim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true
        }
    }
    end

  }
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      mode = "document_diagnostics",
      height = 10,
    }
  end
  }
  use 'mattn/emmet-vim'
  use {
  "jose-elias-alvarez/null-ls.nvim",
  requires = "nvim-lua/plenary.nvim",
  }
  use 'petertriho/nvim-scrollbar'
  use 'ggandor/lightspeed.nvim'
  use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
EOF

lua << EOF
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.icm = 'split'

vim.opt.mouse = 'a'
vim.opt.shell = 'bash'
vim.opt.title = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

EOF

" Add digraph
digr bo 8904

let mapleader="\<SPACE>"

vmap <C-c> cp


" au BufNewFile,BufRead *.py set foldmethod=indent
au BufRead,BufNewFile playbook*.yml set filetype=yaml.ansible

au BufRead,BufNewFile *.java set tabstop=2
au BufRead,BufNewFile *.java set shiftwidth=2
au BufRead,BufNewFile *.java set softtabstop=2

au BufRead,BufNewFile *.kbd set filetype=lisp


" don't keep files for secrets
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"

let g:python3_host_prog = '/usr/bin/python'

" don't fuck with pasting
set pastetoggle=<C-A-v>
let g:wordmotion_prefix = '\'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:html_indent_style1 = 'inc'
set virtualedit=block

set scrollback=100000
" }}}
" Colortheme {{{
syntax on
colorscheme tokyonight
set background=light
let g:airline_theme='papercolor'
set termguicolors
highlight Search ctermfg=0
" }}}
" Plugin Configuration {{{

lua << EOF


require("scrollbar").setup()

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.ktlint,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.uncrustify,
    null_ls.builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.flake8.with({
        prefer_local = ".venv/bin",
    }),
    null_ls.builtins.diagnostics.mypy.with({
        prefer_local = ".venv/bin",
    }),
    null_ls.builtins.diagnostics.ktlint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.code_actions.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
    sources = sources,
})


vim.diagnostic.config({
virtual_text = {
    source = "always",
    format = function(diagnostic)
     if diagnostic.code ~= nil then
         return string.format("%s: %s", diagnostic.code, diagnostic.message)
     end
    return diagnostic.message
end,
},
})

EOF


" TreeSitter {{{
lua <<EOF
EOF
" }}}
" coq {{{
" let g:coq_settings = {'auto_start': 'shut-up', 'keymap.jump_to_mark' : '<C-j>' }
set completeopt=menu,menuone,noselect
lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'treesitter' },
      { name = 'nvim_lsp_document_symbol' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'path' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

require('gitsigns').setup()

local lsp_installer = require("nvim-lsp-installer")
local servers = {
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "html",
    "pyright",
    "sourcery",
    "sumneko_lua",
    "terraformls",
    "tflint",
    "tsserver",
    "vimls",
    "vuels",
    "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local attached = function(_, bufnr)

  local opts = { noremap=true, silent=true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp_installer.on_server_ready(function(server)
    local opts = {}
    capabilities = capabilities
    if server.name == "tsserver" then
        opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            attached(client, bufnr)
        end
    else
        opts.on_attach = function(client, bufnr)
            attached(client, bufnr)
        end
    end
    server:setup(opts)
end)
EOF

nnoremap <leader>q :TroubleToggle<CR>

" }}}
" Pandoc {{{
let g:pandoc#after#modules#enabled = ["tablemode"]

" }}}
vnoremap <leader>ca :'<,'>lua vim.lsp.buf.range_code_action()<CR>
nnoremap ]q :lua vim.diagnostic.goto_next()<CR>
nnoremap [q :lua vim.diagnostic.goto_prev()<CR>

" Ranger {{{
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
" }}}
" quick-scope{{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" }}}
" Undo and backup Settings {{{
set undodir=~/.vim/undodir//
set undofile
set undolevels=1000
set undoreload=10000

set backup
set backupdir=~/.vim/backupdir//
set directory=~/.vim/swapdir//
" }}}
" Search {{{
set ignorecase      " Make searching case insensitive
set smartcase       " ... unless the query has capital letters.
set hlsearch        " highlight matches
set path +=**
set wildmenu
" }}}
" Folding {{{
" set foldenable      " enable folding
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10  " 10 nested fold max
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" }}}
" Mappings {{{

" buffer navigation
nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprevious<CR>
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" Use Q to execute default register.
nnoremap Q @q
" Ranger
nnoremap <leader>d :RangerWorkingDirectory<CR>
nnoremap <leader>t :RangerCurrentFile<cr>


nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fu <cmd>Telescope lsp_document_symbols default_text=:function:<cr>
nnoremap <leader>fl <cmd>Telescope lsp_document_symbols default_text=:class:<cr>

nnoremap <leader>6 :b term<cr>


" Use Ctrl D to delete the next char
imap <C-d> <Del>
" Dedent with C-M-d instead
inoremap <C-S-d> <C-d>

nnoremap <Leader>l :lua vim.lsp.buf.formatting()<CR>
nmap <leader>i :wa<CR>

" key rebinding compatibility
nmap <S-End><BS> 
imap <S-End><BS> 

nnoremap <leader>gs :LazyGit<CR>
command! Install :w | :source % | :PackerSync
" Scrolling {{{
if !&scrolloff
    set scrolloff=5 " Show next 5 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5 " Show next 5 columns while side-scrolling.
endif
" }}}
