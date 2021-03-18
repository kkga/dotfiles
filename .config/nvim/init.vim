" vim:foldmethod=marker:foldlevel=0

" PLUGINS {{{
lua require('lua_config')

" prettier {{{
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
" let g:prettier#exec_cmd_path = "prettier --plugin-search-dir=."
autocmd BufWritePre *.svelte,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" autocmd BufWritePre,TextChanged,InsertLeave *.svelte,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" }}}
" neoformatter {{{
" augroup fmt
" 	autocmd!
" 	autocmd BufWritePre * Neoformat
" augroup END

" let g:neoformat_basic_format_align = 1
" let g:neoformat_basic_format_retab = 1
" let g:neoformat_basic_format_trim = 1
" }}}
" lsp {{{
set updatetime=300
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" }}}
" completion {{{
" set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noselect
set shortmess+=c

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:false
let g:compe.source.treesitter = v:false
let g:compe.source.omni = v:true

" NOTE: Order is important. You can't lazy loading lexima.vim.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })




" autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}
" vim-go {{{
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_highlight_trailing_whitespace_error = 0
" }}}
" sneak {{{
let g:sleuth_automatic = 1
let g:sneak#s_next = 1
" }}}
" grepper {{{
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'grep']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.prompt_text   = '$c>'
let g:grepper.quickfix      = 0
" }}}
" ctrlsf {{{
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
" }}}
" buftabline {{{
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
" }}}
" markdown {{{
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0

let g:previm_open_cmd = 'open -a Min'
" }}}
" todo-txt {{{
let g:Todo_txt_prefix_creation_date=1
let g:Todo_fold_char='+'
" }}}
" treesitter {{{
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
"   refactor = {
"     highlight_definitions = { enable = true },
"     -- highlight_current_scope = { enable = true },
"     navigation = {
"       enable = true,
"       keymaps = {
"         goto_definition = "gnd",
"         list_definitions = "gnD",
"         goto_next_usage = "<a-*>",
"         goto_previous_usage = "<a-#>",
"       },
"     },
"   },
" }
" EOF
" }}}
" colortemplate {{{
let g:colortemplate_toolbar = 0
" }}}

"}}}
" SETTINGS {{{

filetype plugin indent on
syntax on
set termguicolors
colorscheme envy

" various
set encoding=utf8               " Set UTF-8 encoding
set backspace=indent,eol,start  " Proper backspace behavior
set hidden                      " Possibility to have more than one unsaved buffers
set autoread                    " Reload files changed outside vim
set incsearch                   " Incremental search, hit CR to stop
set ignorecase                  " Ignore case when searching
set lazyredraw                  " Don't redraw during macros
set ruler                       " Shows the current line number at the bottom-right of the screen
set wildmenu                    " Great command-line completion, use `<Tab>` to move aet wraound and CR to validate
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.o,.git,tmp,node_modules,*.pyc
set backspace=indent,eol,start  " Allow backspace in insert mode
set ttimeoutlen=2               " Exit insert/visual mode without ESC delay
set inccommand=split            " Highlight search results and show in preview split
set conceallevel=0              " Conceals markdown syntax
set foldlevel=6
set nospell
set mouse=a

" text, tabs and indents
set noexpandtab                 " Tabs are spaces
set softtabstop=4               " # of spaces in tab when editing
set tabstop=4                   " # of spaces that a tab counts for
set shiftwidth=4                " # of spaces to use for autoindent
set linebreak                   " Wrap lines when convenient
set nowrap                      " Wrap lines
set autoindent                  " Minimal automatic indenting for any filetype
set list
set listchars=tab:\|-,extends:»,precedes:«,space:.

" lines and numbers
set number
set relativenumber
set cursorline
set nocursorcolumn
set colorcolumn=80
set foldcolumn=0
set signcolumn=yes
set synmaxcol=200

" splits
set splitright                  " Splitting will put the new window right
set splitbelow                  " Splitting will put the new window below

" columns
set nojoinspaces                " Set 1 space btwn lines/periods to be joined

" scrollin
set scrolloff=8               " Working line will always be in the center

" fish doesn't always play nice in vim
set shell=/bin/dash
let $SHELL = "/bin/dash"

" disable backups and swap
set nobackup
set nowb
set noswapfile

" undo
set undodir=$HOME/.vim/undodir  " Set persistent undodir path
set undofile                    " Write changes to the undofile
set undolevels=1000             " Max # of changes that can be undone
set undoreload=10000            " Max # of lines to save for undo on buf reload

function! LspStatus() abort
	if luaeval('#vim.lsp.buf_get_clients() > 0')
		return luaeval("require('lsp-status').status()")
	endif
	return ''
endfunction

set statusline=%<\ %f\ %m%r
set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
set statusline+=%=%{LspStatus()}\ [%{&filetype}]\ %3l/%3L\ (%2c\)

" }}}
" MAPPINGS {{{

" leader
let mapleader = "\<space>"
let maplocalleader = "\,"

" telescope {{{
nmap <leader>f [find]
xmap <leader>f [find]

" general
nnoremap <silent> [find]f <cmd>Telescope find_files<cr>
nnoremap <silent> [find]F <cmd>Telescope file_browser<cr>
nnoremap <silent> [find]o <cmd>Telescope oldfiles<cr>
nnoremap <silent> [find]g <cmd>Telescope live_grep<cr>
nnoremap <silent> [find]b <cmd>Telescope buffers<cr>
nnoremap <silent> [find]h <cmd>Telescope help_tags<cr>
nnoremap <silent> [find]l <cmd>Telescope current_buffer_fuzzy_find<cr>

" specific
nnoremap <silent> [find]n <cmd>Telescope file_browser cwd=~/notes/<cr>
nnoremap <silent> [find]c <cmd>Telescope find_files cwd=~/.config/<cr>

" lsp
nnoremap <silent> [find]r <cmd>Telescope lsp_references<cr>
nnoremap <silent> [find]s <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent> [find]S <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <silent> [find]d <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <silent> [find]D <cmd>Telescope lsp_workspace_diagnostics<cr>
" }}}

" ¯\_(ツ)_/¯
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>

" disable Ex mode
nnoremap Q nop

" yank/put to system clipboard
" vnoremap <leader>y "+y
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p
" vnoremap <leader>p "+p

" motion across wrapped lines
nnoremap <silent>j gj
nnoremap <silent>k gk
vnoremap <silent>j gj
vnoremap <silent>k gk

" move to beginning/end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" move up/down across empty lines
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {

" use arrows to resize panes in normal mode
nnoremap <Left> :vertical resize -8<CR>
nnoremap <Right> :vertical resize +8<CR>
nnoremap <Up> :resize -8<CR>
nnoremap <Down> :resize +8<CR>

" change/source config
nnoremap <leader>vr :vsp $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>

" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

"}}}
