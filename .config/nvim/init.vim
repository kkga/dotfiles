" vim:foldmethod=marker:foldlevel=0

" PLUGINS {{{
lua require('plugins')

" Telescope {{{
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  }
}
EOF
" }}}
" coc {{{

let g:coc_global_extensions = [
      \  'coc-svelte',
      \  'coc-prettier',
      \  'coc-tsserver', 
      \  'coc-html', 
      \  'coc-css', 
      \  'coc-json', 
      \  'coc-git',
      \  'coc-lists',
      \  'coc-yank',
      \]

set updatetime=300
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> ga <Plug>(coc-codeaction)
xmap <silent> gf <Plug>(coc-format-selected)
nmap <silent> gf <Plug>(coc-format-selected)
nnoremap <silent> gK :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
nnoremap <silent><nowait> <space>ll  :<C-u>CocList<cr>
nnoremap <silent><nowait> <space>lf  :<C-u>CocList files<cr>
nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>lr  :<C-u>CocListResume<CR>
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
" ale {{{
" let g:ale_disable_lsp = 1
" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '●'
" let g:ale_virtualtext_cursor = 1
" let g:ale_echo_msg_format = '[%linter%]: %s'
" let g:ale_lint_on_enter = 1
" let g:ale_fix_on_save = 1
" let g:ale_fix_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'css': ['prettier'],
" \   'html': ['prettier'],
" \   'javascript': ['prettier'],
" \   'typescript': ['prettier'],
" \   'json': ['prettier'],
" \   'lua': ['luafmt'],
" \   'markdown': ['prettier'],
" \}
" let g:ale_linters = {
" \   'rust': ['analyzer', 'cargo', 'rls'],
" \   'html': ['prettier'],
" \   'markdown': ['alex']
" \}

" nmap <silent> <leader>k <Plug>(ale_previous)
" nmap <silent> <leader>j <Plug>(ale_next)

" }}}
" grepper {{{
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'grep']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.prompt_text   = '$c>'
let g:grepper.quickfix      = 0
" }}}
" picker {{{
nmap <C-p>e <Plug>(PickerEdit)
nmap <C-p>s <Plug>(PickerSplit)
nmap <C-p>t <Plug>(PickerTabedit)
nmap <C-p>v <Plug>(PickerVsplit)
nmap <C-p>b <Plug>(PickerBuffer)
nmap <C-p>] <Plug>(PickerTag)
nmap <C-p>w <Plug>(PickerStag)
nmap <C-p>o <Plug>(PickerBufferTag)
nmap <C-p>h <Plug>(PickerHelp)
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
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
" }}}
" solarized8 {{{
" let g:solarized_visibility = "low"
" let g:solarized_diffmode = "normal"
" let g:solarized_termtrans = 1
" let g:solarized_statusline = "flat"
" let g:solarized_use16 = 1
" let g:solarized_extra_hi_groups = 1
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
set nonumber
set norelativenumber
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

" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))

"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors

"     return l:counts.total == 0 ? 'OK' : printf(
"     \   'W:%d E:%d',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction

set statusline=%<\ %f\ %m%r
set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
" set statusline+=%=[%{LinterStatus()}]\ %{fugitive#statusline()}\ [%{&filetype}]\ %3l/%3L\ (%2c\)
set statusline+=%=%{coc#status()}\ [%{&filetype}]\ %3l/%3L\ (%2c\)

" }}}
" MAPPINGS {{{

" leader
let mapleader = "\<space>"
let maplocalleader = "\,"

" telescope {{{
nmap <leader>f [find]
xmap <leader>f [find]

nnoremap <silent> [find]f <cmd>Telescope find_files<cr>
nnoremap <silent> [find]F <cmd>Telescope file_browser<cr>
nnoremap <silent> [find]n <cmd>Telescope file_browser cwd=~/notes/<cr>
nnoremap <silent> [find]c <cmd>Telescope find_files cwd=~/.config/<cr>
nnoremap <silent> [find]r <cmd>Telescope oldfiles<cr>
nnoremap <silent> [find]g <cmd>Telescope live_grep<cr>
nnoremap <silent> [find]b <cmd>Telescope buffers<cr>
nnoremap <silent> [find]h <cmd>Telescope help_tags<cr>
nnoremap <silent> [find]l <cmd>Telescope current_buffer_fuzzy_find<cr>
" }}}

nmap <leader>hh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" esc alternative
inoremap jk <esc>
inoremap kj <esc>

" create a new buffer
nnoremap <leader>B :enew<cr>
" close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" quick save
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :w<cr>

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
