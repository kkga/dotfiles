" vim:foldmethod=marker:foldlevel=0

" PLUGINS {{{
call plug#begin('~/.config/nvim/plugged')

" basics
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-flagship'

" themes
Plug 'romainl/Apprentice'
Plug 'hardselius/warlock'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-colortemplate'

" markdown and note-taking
" Plug 'tpope/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lifepillar/vim-outlaw'
Plug 'lervag/wiki.vim'
" Plug 'Alok/notational-fzf-vim'
Plug 'junegunn/goyo.vim'
Plug 'previm/previm/'
Plug 'jceb/vim-orgmode'

" snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" file browsing
Plug 'justinmk/vim-dirvish'
Plug 'preservim/nerdtree'

" utils
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'
Plug 'nelstrom/vim-visual-star-search'
Plug 'konfekt/fastfold'
Plug 'lifepillar/vim-cheat40'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'

" searching
Plug 'mhinz/vim-grepper'
let g:grepper = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jump = 1
nnoremap <leader>/ :GrepperRg<Space>
nnoremap gs :Grepper -cword -noprompt<CR>
xmap gs <Plug>(GrepperOperator)

" linting
Plug 'dense-analysis/ale'

" Autocomplete
Plug 'maralla/completor.vim'

" lang
Plug 'sheerun/vim-polyglot'
Plug 'calviken/vim-gdscript3'
call plug#end()
"}}}
" PLUGIN SETTINGS {{{
" Colorscheme {{{
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1
let g:solarized_statusline = "flat"
let g:solarized_extra_hi_groups = 1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set notermguicolors
colorscheme solarized8
" }}}
" Colortemplate {{{
let b:colortemplate_outdir = "/Users/kkga/.config/nvim"
" }}}
" Wiki {{{
let g:wiki_root = '~/Documents/notes/'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_list_todos = ['[ ]', '[x]']
let g:wiki_link_target_type = 'md'
let g:wiki_mappings_use_defaults = 1
let g:wiki_mappings_global = {
	\ '<plug>(wiki-list-toggle)' : '<c-t>',
	\ '<plug>(wiki-link-next)' : '<c-j>',
	\ '<plug>(wiki-link-prev)' : '<c-k>',
	\}
" }}}
" Markdown {{{
let g:pencil#autoformat = 0
let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pandoc#folding#mode = "syntax"
let g:pandoc#folding#level = 2
let g:pandoc#folding#fdc = 4
let g:pandoc#spell#enabled = 0
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
" let g:pandoc#filetypes#pandoc_markdown = 1
let g:previm_open_cmd = 'open -a Min'

" }}}
" ALE {{{
let g:ale_lintes = {
\   'markdown': ['']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'markdown': ['prettier']
\}
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1
" }}}
" FZF {{{
let $FZF_DEFAULT_COMMAND = 'rg --files'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }
" let g:fzf_layout = { 'window': { 'width': 0.8 , 'height': 0.6 } }


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
augroup fzf_statusline
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" }}}
" Fastfold {{{
" nmap zz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
" }}}
" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']
" }}}
" Completor {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" }}}
" Flagship {{{
let g:tabprefix = ''
set laststatus=2
set showtabline=2
set guioptions-=e
" }}}
" sleuth {{{
let g:sleuth_automatic = 1
" }}}
" Outlaw {{{
let g:outlaw_indent = 2
let g:outlaw_auto_close = 0
" }}}
" }}}
" SETTINGS {{{

filetype plugin indent on       " no idea
synta on

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
" set conceallevel=0              " Conceals markdown syntax
" set foldlevelstart=1
" set foldcolumn=4
set nospell
set mouse=a

" disable backups and swap
set nobackup
set nowb
set noswapfile

" text, tabs and indents
" set expandtab                   " Tabs are spaces
set shiftwidth=2                " # of spaces to use for autoindent
set tabstop=4                   " # of spaces that a tab counts for
set softtabstop=4               " # of spaces in tab when editing
set linebreak                   " Wrap lines when convenient
set wrap                        " Wrap lines
set autoindent                  " Minimal automatic indenting for any filetype
" set listchars=tab:▸\ ,eol:¬,
" set list

" lines and numbers
" set nonumber                      " Show line number
" set norelativenumber              " Relative numbers are good
" set numberwidth=4               " Wider linenumbers
set cursorline                  " Show line
set nocursorcolumn
set norelativenumber
" set synmaxcol=200
" let loaded_matchparen = 1

" splits
set splitright                  " Splitting will put the new window right
set splitbelow                  " Splitting will put the new window below

" columns
set nojoinspaces                " Set 1 space btwn lines/periods to be joined

" scrollin
set scrolloff=8               " Working line will always be in the center

" undo
set undodir=$HOME/.vim/undodir  " Set persistent undodir path
set undofile                    " Write changes to the undofile
set undolevels=1000             " Max # of changes that can be undone
set undoreload=10000            " Max # of lines to save for undo on buf reload
set directory=$HOME/.vim/swp//  " Write swap files in one directory, unique nms
" }}}
" MAPPINGS {{{

" leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" theme switcher
nnoremap <Leader>cd :set bg=dark<CR>
nnoremap <Leader>cl :set bg=light<CR>

" ¯\_(ツ)_/¯
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>
map <silent> Q q<Cr>

" yank/put to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" motion across wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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

" easier one-off navigation in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" use arrows to resize panes in normal mode
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" don't use arrows for movement in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" highlight last inserted text
nnoremap gV `[v`]<Paste>

" disable Ex mode
nnoremap Q nop

" toggle wrap
nnoremap <leader>tw :ToggleWrap<CR>

" clear search highlight
nnoremap <esc><esc> :nohl<CR>

" change/source config
nnoremap <leader>vr :vsp $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>

" fzf mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>cm :Commands<CR>
nnoremap <leader>nf :WikiFzfPages<CR>
nnoremap <leader>rg :Rg<CR>

" quick save
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> <esc>:w<cr>
nnoremap <leader>fs :w<CR>

" split faster
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" tabs
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tc :tabclose<CR>

" jump between ALE warnings
" nmap <silent> <C-n> <Plug>(ale_next_wrap)
" nmap <silent> <C-p> <Plug>(ale_previous_wrap)

" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

"move lines around
xnoremap <leader>j :m'>+<cr>gv=gv
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv

" open goyo
nnoremap <leader>go :Goyo<CR>

" quick folding
nnoremap <tab> za

"}}}
" FUNCTIONS {{{

" show highlight
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" toggle wrap
function! ToggleWrap()
    if(&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunc

command! ToggleWrap call ToggleWrap()

" }}}
" AUGROUPS {{{
" markdown {{{
augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md setlocal filetype=markdown.pandoc
augroup END
" }}}
" outlaw {{{
augroup Outlaw
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *-outline.* set filetype=outlaw
  " autocmd FileType outlaw setlocal tw=80 sw=4 ts=4 sts=0 et
augroup END
" }}}
" }}}
" NOTETAKING {{{
" https://vimways.org/2019/personal-notetaking-in-vim/
func! ZettelEdit(...)

  " build the file name
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif
  let l:fname = expand('~/Documents/Notes/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

  " edit the new file
  exec "e " . l:fname

  " enter the title and timestamp (using ultisnips) in the new file
  if len(a:000) > 0
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr> " . join(a:000) . "\<cr>\<esc>G"
  else
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr>\<cr>\<esc>G"
  endif
endfunc

" new note creation
command! -nargs=* Zet call ZettelEdit(<f-args>)

command! -bang -nargs=? -complete=dir NoteFiles
    \ call fzf#vim#files('/home/kkga/Documents/notes/', {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)

" }}}

