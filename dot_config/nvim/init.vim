" vim-plug  {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree' " Navigate undos
Plug 'tpope/vim-surround' " change/append sourroundings of sommething - cs'} = change sourrounding single quotes with wavy brackets
Plug 'tpope/vim-repeat' " make surround actions repeatable
Plug 'kdheepak/lazygit.nvim'
Plug 'rhysd/git-messenger.vim' " <leader>gm show last git commit for current line (similar to gitlens)
Plug 'tpope/vim-sleuth' " Autodetect indentation rules
Plug 'numToStr/Comment.nvim' " Comment stuff
Plug 'tpope/vim-abolish' " crs > convert to snake case
Plug 'christoomey/vim-system-copy' " cpit > this copies the content of a tag into your clipboard
Plug 'vim-airline/vim-airline' " shows buffers for files
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace' " better whitespace cleaning
Plug 'nelstrom/vim-visual-star-search' " use * to jump to next instace of current word
Plug 'psliwka/vim-smoothie' " smooth scrolling
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'andymass/vim-matchup' " improve % and add text objects i% and a%
Plug 'chaoren/vim-wordmotion' " camelcasemotion
Plug 'cocopon/iceberg.vim'
Plug 'rafamadriz/neon'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ku-s-h/summerfruit256.vim'
Plug 'kana/vim-textobj-user' " Add new textobjects easily
Plug 'wellle/targets.vim' " more text objects, enables stuff like ci, or ci/
" Plug 'jeetsukumaran/vim-pythonsense' " Add python text objects: ac (around class), ic, af, if (inner function)
Plug 'pechorin/any-jump.nvim' " Use regex to 'go to definition' anywhere (<leader>j)
Plug 'rbgrouleff/bclose.vim' " Dependency of ranger.vim
Plug 'francoiscabrol/ranger.vim' " Use ranger inside of vim
" Plug 'unblevable/quick-scope' " Improve f key
Plug 'machakann/vim-highlightedyank' " highlight yanked text
Plug 'vim-scripts/ReplaceWithRegister' " <gr>motion replaces text with register
Plug 'Matt-A-Bennett/vim-surround-funk' " <dsf> delete sourrounding fuction, <gs> wrap current fuction with the one in register
" Plug 'christianrondeau/vim-base64' " Encodes/decodes base64 strings
" Plug 'artur-shaik/vim-javacomplete2'
Plug 'jremmen/vim-ripgrep'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'kevinhwang91/nvim-bqf'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-after'
" Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'airblade/vim-rooter'
Plug 'farmergreg/vim-lastplace'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'alker0/chezmoi.vim'
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'folke/trouble.nvim'
Plug 'mattn/emmet-vim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'dpelle/vim-LanguageTool'
Plug 'ggandor/lightspeed.nvim'
Plug 'github/copilot.vim'

" Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'mfussenegger/nvim-dap-python'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
" }}}
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

let g:languagetool_jar = '/usr/share/java/languagetool/languagetool-commandline.jar'
lua << EOF
require('Comment').setup()


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

require("trouble").setup {
    mode = "document_diagnostics",
    height = 10,
    }

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

lua require'colorizer'.setup()

" TreeSitter {{{
lua <<EOF
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
EOF
" }}}
" coq {{{
let g:coq_settings = {'auto_start': 'shut-up', 'keymap.jump_to_mark' : '<C-j>' }
lua << EOF
require('gitsigns').setup()

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "tsserver" then
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    end
    server:setup(opts)
end)

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
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

EOF

" }}}
" Pandoc {{{
let g:pandoc#after#modules#enabled = ["tablemode"]

" }}}
vnoremap <leader>ca :'<,'>lua vim.lsp.buf.range_code_action()<CR>
" ALE {{{
nnoremap ]q :lua vim.diagnostic.goto_next()<CR>
nnoremap [q :lua vim.diagnostic.goto_prev()<CR>

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['prettier'],
            \   'yaml': ['prettier'],
            \   'html': ['prettier'],
            \   'css': ['prettier'],
            \   'sh': ['shfmt'],
            \   'python': ['autoimport', 'black'],
            \   'java': ['uncrustify', 'google_java_format'],
            \   'terraform': ['terraform'],
            \   'hcl': ['terraform'],
            \   'pandoc': ['prettier'],
            \   'json': ['jq'],
            \   'haskell': ['stylish-haskell'],
            \   'jsonc': ['jq']
            \}
" }}}
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
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
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
command! Install :w | :source % | :PlugInstall
" Scrolling {{{
if !&scrolloff
    set scrolloff=5 " Show next 5 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5 " Show next 5 columns while side-scrolling.
endif
" }}}
