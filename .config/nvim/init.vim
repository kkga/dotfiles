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
Plug 'tpope/vim-endwise'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'konfekt/fastfold'
Plug 'lifepillar/vim-cheat40'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
Plug 'ap/vim-buftabline'
Plug 'unblevable/quick-scope'
Plug 'rstacruz/vim-closer'
Plug 'mhinz/vim-signify'

" themes
Plug 'romainl/Apprentice'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-colortemplate'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'habamax/vim-polar'
Plug 'axvr/photon.vim'

" markdown and note-taking
Plug 'plasticboy/vim-markdown'
" Plug 'lifepillar/vim-outlaw'
Plug 'previm/previm/'
Plug 'cweagans/vim-taskpaper'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" file browsing
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lang
Plug 'habamax/vim-godot'

call plug#end()
"}}}
" PLUGIN SETTINGS {{{
" Colorscheme {{{
" let g:solarized_visibility = "high"
" let g:solarized_termtrans = 1
" let g:solarized_statusline = "flat"
" let g:solarized_extra_hi_groups = 1
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set notermguicolors
set t_Co=256
colorscheme envy
" }}}
" Colortemplate {{{
let b:colortemplate_outdir = "/Users/kkga/.config/nvim"
" }}}
" Markdown {{{
let g:previm_open_cmd = 'open -a Min'

" Configuration for vim-markdown
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
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

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
" Completion {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" }}}
" sleuth {{{
let g:sleuth_automatic = 1
" }}}
" sneak {{{
let g:sneak#s_next = 1
" }}}
" todo {{{
let g:Todo_txt_prefix_creation_date=1
let g:Todo_fold_char='+'
" }}}
" }}}
" SETTINGS {{{

filetype plugin indent on       " no idea
syntax on

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
set conceallevel=1              " Conceals markdown syntax
set foldlevel=6
set nospell
set mouse=a

" text, tabs and indents
" set expandtab                   " Tabs are spaces
set shiftwidth=2                " # of spaces to use for autoindent
set tabstop=4                   " # of spaces that a tab counts for
set softtabstop=4               " # of spaces in tab when editing
set linebreak                   " Wrap lines when convenient
set nowrap                      " Wrap lines
set autoindent                  " Minimal automatic indenting for any filetype
set listchars=tab:>-\ ,
set nolist

" lines and numbers
set nonumber                      " Show line number
set norelativenumber              " Relative numbers are good
set nocursorline                  " Show line
set nocursorcolumn
set foldcolumn=0
set signcolumn=yes 
set synmaxcol=200
let loaded_matchparen = 1

" splits
set splitright                  " Splitting will put the new window right
set splitbelow                  " Splitting will put the new window below

" columns
set nojoinspaces                " Set 1 space btwn lines/periods to be joined

" scrollin
set scrolloff=8               " Working line will always be in the center

" disable backups and swap
set nobackup
set nowb
set noswapfile

" undo
set undodir=$HOME/.vim/undodir  " Set persistent undodir path
set undofile                    " Write changes to the undofile
set undolevels=1000             " Max # of changes that can be undone
set undoreload=10000            " Max # of lines to save for undo on buf reload

" }}}
" STATUSLINE {{{
" Statusline colors
" Get current mode
let g:currentmode={
      \'n' : 'N ',
      \'no' : 'N·Operator Pending ',
      \'v' : 'V ',
      \'V' : 'V·L ',
      \'^V' : 'V·B ',
      \'s' : 'Select ',
      \'S': 'S·Line ',
      \'^S' : 'S·Block ',
      \'i' : 'I ',
      \'R' : 'Replace ',
      \'Rv' : 'V·Replace ',
      \'c' : 'Command ',
      \'cv' : 'Vim Ex ',
      \'ce' : 'Ex ',
      \'r' : 'Prompt ',
      \'rm' : 'More ',
      \'r?' : 'Confirm ',
      \'!' : 'Shell ',
      \'t' : 'Terminal '
      \}

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Get current git branch
function! GitBranch(git)
  if a:git == ""
    return '-'
  else
    return a:git
  endif
endfunction

" " Git changes
" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    return expand('%:t').' *'
  else
    return expand('%:t')
  endif
endfunction

" Coc status
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W ' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Set active statusline
function! ActiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#StatusLine# "

  " Current mode
  let statusline .= "%{ModeCurrent()}|"

  " Current modified status and filename
  let statusline .= " %{CheckMod(&modified)} "

  " Align items to right
  let statusline .= "%="

  let statusline .= "| %{StatusDiagnostic()}"
  
  " Current git branch
  let statusline .= "| %{GitBranch(fugitive#head())} "

  " Current filetype
  let statusline .= "| %{CheckFT(&filetype)} "

  " Current line and column
  let statusline .= "| %3l/%3L %2c %P "
  return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#StatusLineNC#"

  " Full path of the file
  let statusline .= "%F "

  return statusline
endfunction
" }}}
" MAPPINGS {{{

" leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" esc alternative
inoremap jk <esc>
inoremap kj <esc>

" quick save
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :w<cr>

" Quick Cmd mode
nnoremap <leader><space> :

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
" close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" navigate buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

" theme switcher
nnoremap <Leader>cd :set bg=dark<CR>
nnoremap <Leader>cl :set bg=light<CR>

" ¯\_(ツ)_/¯
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>

" disable Ex mode
nnoremap Q nop

" yank/put to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

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

" highlight last inserted text
nnoremap gV `[v`]<Paste>

" toggle wrap
nnoremap <leader>tw :ToggleWrap<CR>

" toggle checkbox
nnoremap <leader>tt :ToggleTask<CR>

" clear search highlight
nnoremap <esc><esc> :nohl<CR>

" change/source config
nnoremap <leader>vr :vsp $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>

" fzf mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>n :NoteFiles<CR>
 
" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" move lines around
xnoremap <leader>j :m'>+<cr>gv=gv
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv

" coc
nnoremap <silent> <leader>ch :call CocAction('doHover')<CR>

"}}}
" FUNCTIONS {{{

" checkbox toggle
function! ToggleTask()
  let b:line = getline(".")
  let b:linenum = line(".")
  if b:line =~ '^\s*\(-\|*\|+\|\d\+\.\) \[ \] .*$'
    let b:newline = substitute(b:line, '\[ \] ', '\[X\] ', "")
    call setline(b:linenum, b:newline)
  elseif b:line =~ '^\s*\(-\|*\|+\|\d\+\.\) \[X\] .*$'
    let b:newline = substitute(b:line, '\[X\] ', '\[ \] ', "")
    call setline(b:linenum, b:newline)
  elseif b:line =~ '^\s*\(-\|*\|+\|\d\+\.\) .*$'
    let b:newline = substitute(b:line, '\(^\s*\)\(-\|*\|+\|\d\+\.\)\s', '\1\2 \[ \] ', "")
    call setline(b:linenum, b:newline)
  endif
endfunction
command! ToggleTask call ToggleTask()


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
" statusline {{{
" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
  autocmd FileType nerdtree setlocal statusline=%!NERDLine()
augroup END
" }}}
" markdown {{{
" augroup markdown_syntax
"     autocmd!
"     autocmd BufNewFile,BufFilePre,BufRead *.md setlocal filetype=markdown
" augroup END
" }}}
" todo {{{
augroup todo
  autocmd!
  autocmd filetype todo setlocal omnifunc=todo#Complete
  autocmd filetype todo imap <buffer> + +<C-X><C-O>
  autocmd filetype todo imap <buffer> @ @<C-X><C-O>
  autocmd filetype todo setlocal completeopt-=preview
augroup END
" }}}
" outlaw {{{
augroup Outlaw
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *-outline.* set filetype=outlaw
  " autocmd FileType outlaw setlocal tw=80 sw=4 ts=4 sts=0 et
augroup END
" }}}
" godot {{{
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal signcolumn=yes
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
" }}}
" }}}
" SYNTAX {{{
" markdown lists {
syntax match  listItem "^\s*\(-\|*\|+\|\d\+\.\)\s.*$"
highlight default link listItem Normal
syntax match  listMarker "^\s*\(-\|*\|+\|\d\+\.\)\s" contained containedin=listItem
syntax match  listMarker "^\s*\(-\|*\|+\|\d\+\.\)\s\(\[ \]\|\[X\]\)" contained containedin=listItem
highlight default link listMarker LineNr
syntax match  taskBox "\[ \]" contained containedin=listMarker
highlight default link taskBox Todo
syntax match  doneBox "\[X\]" contained containedin=listMarker
highlight default link doneBox Comment
" }
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
    \ call fzf#vim#files('$HOME/notes/', {'options': ['--info=inline', '--preview', 'sh ~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" }}}

