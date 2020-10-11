" vim:foldmethod=marker:foldlevel=0

" PLUGINS {{{

call plug#begin('~/.config/nvim/plugged')

" utils
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-endwise'
" Plug 'rstacruz/vim-closer'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'nelstrom/vim-visual-star-search'
Plug 'lifepillar/vim-cheat40'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
Plug 'ap/vim-buftabline'
" Plug 'unblevable/quick-scope'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'cohama/lexima.vim'
Plug 'kdheepak/lazygit.nvim'

" themes
Plug 'romainl/Apprentice'
Plug 'caksoylar/vim-mysticaltutor'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-colortemplate'
Plug 'lifepillar/vim-solarized8'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'jsit/disco.vim'
Plug 'pacha/vem-dark'

" markdown and note-taking
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm/'
Plug 'cweagans/vim-taskpaper'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plug 'fiatjaf/neuron.vim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" file browsing
Plug 'justinmk/vim-dirvish'
Plug 'dyng/ctrlsf.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" necessary evil
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'

Plug 'preservim/tagbar'
" Plug 'dense-analysis/ale'

" lang
Plug 'sheerun/vim-polyglot'
Plug 'habamax/vim-godot'
Plug 'rust-lang/rust.vim'
" Plug 'nvim-treesitter/nvim-treesitter'

Plug 'ThePrimeagen/vim-be-good'

call plug#end()
"}}}
" PLUGIN SETTINGS {{{

let g:sleuth_automatic = 1
let g:sneak#s_next = 1

" buftabline {{{
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0

hi link BufTabLine TabLine
" hi link BufTabLineActive
" BufTabLineHidden
" BufTabLineFill

" }}}
" ale {{{
let g:ale_disable_lsp = 1
let g:ale_linters = {'rust': ['analyzer', 'cargo', 'rls']}
" }}}
" nvim-lsp {{{
" lua << EOF
" local on_attach_vim = function(client)
"   require'completion'.on_attach(client)
"   require'diagnostic'.on_attach(client)
" end
" require'nvim_lsp'.gdscript.setup{on_attach=on_attach_vim}
" EOF

" autocmd BufEnter * lua require'completion'.on_attach()
" let g:diagnostic_enable_virtual_text = 1
" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp', 'snippet']},
"     \{'mode': '<c-p>'},
"     \{'mode': '<c-n>'}
" \]
" let g:completion_auto_change_source = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
" set shortmess+=c
" }}}
" solarized8 {{{
let g:solarized_visibility = "low"
" let g:solarized_diffmode = "normal"
" let g:solarized_termtrans = 1
let g:solarized_statusline = "flat"
let g:solarized_use16 = 0
let g:solarized_extra_hi_groups = 1
set termguicolors
" set t_Co=256
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

let g:previm_open_cmd = 'open -a Min'
" }}}
" todo-txt {{{
let g:Todo_txt_prefix_creation_date=1
let g:Todo_fold_char='+'
" }}}
" fzf {{{
" let $FZF_DEFAULT_COMMAND = 'rg --files --follow'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_layout = {
  \ 'window': {
  \   'width': 0.7,
  \   'height': 0.6,
  \   'border': 'sharp',
  \   'highlight': 'VertSplit'
  \ }
  \ }

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
" }}}
" coc {{{

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" " Use <c-space> to trigger completion.
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use to show documentation in preview window.
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}
" rust {{{
let g:rustfmt_autosave = 1
let g:rust_fold = 2
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

" }}}
" SETTINGS {{{

filetype plugin indent on       " no idea
syntax on
colorscheme paper

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
" set softtabstop=4               " # of spaces in tab when editing
" set tabstop=4                   " # of spaces that a tab counts for
set shiftwidth=4                " # of spaces to use for autoindent
set linebreak                   " Wrap lines when convenient
set nowrap                      " Wrap lines
set autoindent                  " Minimal automatic indenting for any filetype
set listchars=tab:>-\ ,
set nolist

" lines and numbers
set nonumber                      
set norelativenumber             
set nocursorline                
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

" fish doesn't always play nice in vim
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" disable backups and swap
set nobackup
set nowb
set noswapfile

" undo
set undodir=$HOME/.vim/undodir  " Set persistent undodir path
set undofile                    " Write changes to the undofile
set undolevels=1000             " Max # of changes that can be undone
set undoreload=10000            " Max # of lines to save for undo on buf reload

" statusline
set statusline=%<%m%r\ %f 
set statusline+=\ %{coc#status()}
set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
set statusline+=%=%{fugitive#statusline()}\ [%{&filetype}]\ %3l/%3L\ (%2c\)\ 

" }}}
" MAPPINGS {{{

" leader
let mapleader = "\<space>"
let maplocalleader = "\,"

" esc alternative
inoremap jj <esc>

" fzf mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fn :NoteFiles<CR>

" buffers
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

" create a new buffer 
nnoremap <leader>B :enew<cr>
" close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>


" ctrlsf
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" coc
nnoremap <silent> <leader>ch :call CocAction('doHover')<CR>

" quick save
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :w<cr>

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

" change/source config
nnoremap <leader>vr :vsp $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>

" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

"}}}
" AUGROUPS {{{
" todo {{{
augroup todo
  autocmd!
  autocmd filetype todo setlocal omnifunc=todo#Complete
  autocmd filetype todo imap <buffer> + +<C-X><C-O>
  autocmd filetype todo imap <buffer> @ @<C-X><C-O>
  autocmd filetype todo setlocal completeopt-=preview
augroup END
" }}}
" godot {{{
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal tabstop=4
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
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
  let l:fname = expand('~/notes/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

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
    \ call fzf#vim#files('$HOME/notes/', {'options': ['--info=inline', '--preview', 'bat --plain {}']}, <bang>0)

let s:notes_folder = "~/notes"
let s:notes_fileending = ".md"

" This is either called with
" 0 lines, which means there's no result and no query
" 1 line, which means there's no result, but a user query
"         in this case: create a new file, based on user query
" 2 lines, which means there are results, so open them
"
function! s:note_handler(lines)
  if len(a:lines) < 1 | return | endif

  if len(a:lines) == 1
    let query = a:lines[0]
    let new_filename = fnameescape(query . s:notes_fileending)
    let new_title = "# " . query

    execute "edit " . new_filename

    " Append the new title and an empty line
    let failed = append(0, [new_title, ''])
    if (failed)
      echo "Unable to insert title file!"
    else
      let &modified = 1
    endif
  else
    execute "edit " fnameescape(a:lines[1])
  endif
endfunction

command! -nargs=* Notes call fzf#run({
\ 'sink*':   function('<sid>note_handler'),
\ 'options': '--print-query ',
\ 'dir':     s:notes_folder
\ })

function! s:rg_to_quickfix(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:find_notes_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:rg_to_quickfix(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* FindNotes call fzf#run({
\ 'source':  printf('rg --column --color=always "%s"',
\                   escape(empty(<q-args>) ? '' : <q-args>, '"\')),
\ 'sink*':    function('<sid>find_notes_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%',
\ 'dir':     s:notes_folder
\ })

command! -bang -nargs=* FindNotesWithPreview
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': s:notes_folder}, 'right:50%'),
  \   0,
  \ )

" nmap <silent> <leader>nn :Notes<CR>
" nmap <silent> <leader>fn :FindNotes<CR>
" nmap <silent> <leader>nw :FindNotesWithPreview<CR>

" }}}

