" Name:         Envy
" Description:  Template for a colorscheme with dark and light variants
" Author:       Myself <myself@somewhere.org>
" Maintainer:   Myself <myself@somewhere.org>
" Website:      https://me.org
" License:      Public domain
" Last Updated: Mon Aug  3 11:59:25 2020

" Generated by Colortemplate v2.0.0

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'envy'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

hi! link QuickFixLine Search
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Debug Special
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor

if (has('termguicolors') && &termguicolors) || has('gui_running')
  if &background ==# 'dark'
    let g:terminal_ansi_colors = ['#1c1c1c', '#af5f5f', '#5f875f', '#87875f',
          \ '#5f87af', '#5f5f87', '#5f8787', '#bcbcbc', '#262626', '#ff8700',
          \ '#87af87', '#ffffaf', '#87afd7', '#8787af', '#5fafaf', '#ffffff']
    if has('nvim')
      let g:terminal_color_0 = '#1c1c1c'
      let g:terminal_color_1 = '#af5f5f'
      let g:terminal_color_2 = '#5f875f'
      let g:terminal_color_3 = '#87875f'
      let g:terminal_color_4 = '#5f87af'
      let g:terminal_color_5 = '#5f5f87'
      let g:terminal_color_6 = '#5f8787'
      let g:terminal_color_7 = '#bcbcbc'
      let g:terminal_color_8 = '#262626'
      let g:terminal_color_9 = '#ff8700'
      let g:terminal_color_10 = '#87af87'
      let g:terminal_color_11 = '#ffffaf'
      let g:terminal_color_12 = '#87afd7'
      let g:terminal_color_13 = '#8787af'
      let g:terminal_color_14 = '#5fafaf'
      let g:terminal_color_15 = '#ffffff'
    endif
    if get(g:, 'dark_and_light_transp_bg', 0) && !has('gui_running')
      hi Normal guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE cterm=NONE
      hi Terminal guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE cterm=NONE
    else
      hi Normal guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
      hi Terminal guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    endif
    hi ColorColumn guifg=NONE guibg=#262626 guisp=NONE gui=NONE cterm=NONE
    hi Conceal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Cursor guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi CursorColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorLine guifg=NONE guibg=#262626 guisp=NONE gui=NONE cterm=NONE
    hi CursorLineNr guifg=#bcbcbc guibg=#262626 guisp=NONE gui=NONE cterm=NONE
    hi DiffAdd guifg=#87af87 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi DiffChange guifg=#8787af guibg=NONE guisp=NONE gui=bold cterm=bold
    hi DiffDelete guifg=#ff8700 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi DiffText guifg=#bcbcbc guibg=#262626 guisp=NONE gui=bold,reverse cterm=bold,reverse
    hi Directory guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi EndOfBuffer guifg=#262626 guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi ErrorMsg guifg=#1c1c1c guibg=#af5f5f guisp=NONE gui=bold,reverse cterm=bold,reverse
    hi FoldColumn guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Folded guifg=#6c6c6c guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
    hi IncSearch guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=standout cterm=standout
    hi LineNr guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi MatchParen guifg=#ffffff guibg=#6c6c6c guisp=NONE gui=NONE cterm=NONE
    hi ModeMsg guifg=#8787af guibg=#1c1c1c guisp=NONE gui=bold cterm=bold
    hi MoreMsg guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi NonText guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi Pmenu guifg=#bcbcbc guibg=#262626 guisp=NONE gui=NONE cterm=NONE
    hi PmenuSbar guifg=#bcbcbc guibg=#6c6c6c guisp=NONE gui=NONE cterm=NONE
    hi PmenuSel guifg=#ffffff guibg=#6c6c6c guisp=NONE gui=NONE cterm=NONE
    hi PmenuThumb guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi Question guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi Search guifg=#1c1c1c guibg=#87afd7 guisp=NONE gui=NONE cterm=NONE
    hi SignColumn guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi SpecialKey guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi SpellBad guifg=#bcbcbc guibg=NONE guisp=#af5f5f gui=NONE cterm=NONE
    hi SpellCap guifg=#bcbcbc guibg=NONE guisp=#5f87af gui=NONE cterm=NONE
    hi SpellLocal guifg=#bcbcbc guibg=NONE guisp=#5f5f87 gui=NONE cterm=NONE
    hi SpellRare guifg=#bcbcbc guibg=NONE guisp=#5f8787 gui=reverse cterm=reverse
    hi StatusLine guifg=#1c1c1c guibg=#6c6c6c guisp=NONE gui=bold cterm=bold
    hi StatusLineNC guifg=#6c6c6c guibg=#262626 guisp=NONE gui=bold cterm=bold
    hi TabLine guifg=#1c1c1c guibg=#6c6c6c guisp=NONE gui=bold cterm=bold
    hi TabLineFill guifg=#6c6c6c guibg=#262626 guisp=NONE gui=NONE cterm=NONE
    hi TabLineSel guifg=#1c1c1c guibg=#bcbcbc guisp=NONE gui=bold cterm=bold
    hi Title guifg=#ffffff guibg=NONE guisp=NONE gui=bold cterm=bold
    hi VertSplit guifg=#262626 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Visual guifg=#ffffff guibg=#6c6c6c guisp=NONE gui=NONE cterm=NONE
    hi VisualNOS guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi WarningMsg guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi WildMenu guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=NONE cterm=NONE
    hi Comment guifg=#6c6c6c guibg=NONE guisp=NONE gui=italic cterm=italic
    hi Constant guifg=#ffffaf guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Error guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Identifier guifg=#87afd7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Ignore guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi PreProc guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Special guifg=#87afd7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Statement guifg=#ffffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Todo guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Type guifg=#8787af guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Underlined guifg=#bcbcbc guibg=NONE guisp=NONE gui=underline cterm=underline
    hi CursorIM guifg=NONE guibg=fg guisp=NONE gui=NONE cterm=NONE
    hi ToolbarLine guifg=NONE guibg=#bcbcbc guisp=NONE gui=NONE cterm=NONE
    hi ToolbarButton guifg=#bcbcbc guibg=#1c1c1c guisp=NONE gui=bold cterm=bold
    hi gdscriptFunctionName guifg=#87afd7 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi! link gdscriptNode Special
    hi! link GitGutterAdd DiffAdd
    hi! link GitGutterChange DiffChange
    hi! link GitGutterDelete DiffDelete
    if !s:italics
      hi Folded gui=bold cterm=bold
      hi Comment gui=NONE cterm=NONE
    endif
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  let g:terminal_ansi_colors = ['#000000', '#ff0000', '#00ff00', '#ffff00',
        \ '#0000ff', '#ff00ff', '#00ffff', '#ebebeb', '#d2d2d2', '#ff6400',
        \ '#64ff00', '#ffff64', '#0064ff', '#ff64ff', '#64ffff', '#ffffff']
  if has('nvim')
    let g:terminal_color_0 = '#000000'
    let g:terminal_color_1 = '#ff0000'
    let g:terminal_color_2 = '#00ff00'
    let g:terminal_color_3 = '#ffff00'
    let g:terminal_color_4 = '#0000ff'
    let g:terminal_color_5 = '#ff00ff'
    let g:terminal_color_6 = '#00ffff'
    let g:terminal_color_7 = '#ebebeb'
    let g:terminal_color_8 = '#d2d2d2'
    let g:terminal_color_9 = '#ff6400'
    let g:terminal_color_10 = '#64ff00'
    let g:terminal_color_11 = '#ffff64'
    let g:terminal_color_12 = '#0064ff'
    let g:terminal_color_13 = '#ff64ff'
    let g:terminal_color_14 = '#64ffff'
    let g:terminal_color_15 = '#ffffff'
  endif
  if get(g:, 'dark_and_light_transp_bg', 0) && !has('gui_running')
    hi Normal guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  else
    hi Normal guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  endif
  hi ColorColumn guifg=fg guibg=#000000 guisp=NONE gui=NONE cterm=NONE
  hi Conceal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi CursorLine guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi CursorLineNr guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi DiffAdd guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
  hi DiffChange guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
  hi DiffDelete guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
  hi DiffText guifg=#000000 guibg=#ebebeb guisp=NONE gui=bold,reverse cterm=bold,reverse
  hi Directory guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi ErrorMsg guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
  hi FoldColumn guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Folded guifg=#000000 guibg=#ebebeb guisp=NONE gui=italic cterm=italic
  hi IncSearch guifg=#000000 guibg=#ebebeb guisp=NONE gui=standout cterm=standout
  hi LineNr guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi MatchParen guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi ModeMsg guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi MoreMsg guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi NonText guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi PmenuSbar guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi PmenuSel guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi PmenuThumb guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Question guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Search guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi SpellBad guifg=#000000 guibg=#ebebeb guisp=#ff0000 gui=NONE cterm=NONE
  hi SpellCap guifg=#000000 guibg=#ebebeb guisp=#0000ff gui=NONE cterm=NONE
  hi SpellLocal guifg=#000000 guibg=#ebebeb guisp=#ff00ff gui=NONE cterm=NONE
  hi SpellRare guifg=#000000 guibg=#ebebeb guisp=#00ffff gui=reverse cterm=reverse
  hi StatusLine guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi StatusLineNC guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi TabLine guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi TabLineFill guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi TabLineSel guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Title guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Visual guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi VisualNOS guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi WildMenu guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Comment guifg=#000000 guibg=NONE guisp=NONE gui=italic cterm=italic
  hi Constant guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Error guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
  hi Identifier guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Ignore guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Special guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Statement guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Todo guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Type guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Underlined guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi CursorIM guifg=NONE guibg=fg guisp=NONE gui=NONE cterm=NONE
  hi ToolbarLine guifg=NONE guibg=#000000 guisp=NONE gui=NONE cterm=NONE
  hi ToolbarButton guifg=#000000 guibg=#ebebeb guisp=NONE gui=bold cterm=bold
  if !s:italics
    hi Folded gui=NONE cterm=NONE
    hi Comment gui=NONE cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 256
  if &background ==# 'dark'
    if get(g:, 'dark_and_light_transp_bg', 0)
      hi Normal ctermfg=250 ctermbg=NONE cterm=NONE
      hi Terminal ctermfg=250 ctermbg=NONE cterm=NONE
    else
      hi Normal ctermfg=250 ctermbg=234 cterm=NONE
      if !has('patch-8.0.0616') && !has('nvim') " Fix for Vim bug
        set background=dark
      endif
      hi Terminal ctermfg=250 ctermbg=234 cterm=NONE
    endif
    hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=250 ctermbg=234 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorLineNr ctermfg=250 ctermbg=235 cterm=NONE
    hi DiffAdd ctermfg=108 ctermbg=NONE cterm=bold
    hi DiffChange ctermfg=103 ctermbg=NONE cterm=bold
    hi DiffDelete ctermfg=203 ctermbg=NONE cterm=bold
    hi DiffText ctermfg=250 ctermbg=235 cterm=bold,reverse
    hi Directory ctermfg=250 ctermbg=234 cterm=NONE
    hi EndOfBuffer ctermfg=235 ctermbg=234 cterm=NONE
    hi ErrorMsg ctermfg=234 ctermbg=131 cterm=bold,reverse
    hi FoldColumn ctermfg=242 ctermbg=NONE cterm=NONE
    hi Folded ctermfg=242 ctermbg=NONE cterm=bold,italic
    hi IncSearch ctermfg=250 ctermbg=234 cterm=reverse
    hi LineNr ctermfg=242 ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=231 ctermbg=242 cterm=NONE
    hi ModeMsg ctermfg=103 ctermbg=234 cterm=bold
    hi MoreMsg ctermfg=250 ctermbg=234 cterm=NONE
    hi NonText ctermfg=250 ctermbg=234 cterm=NONE
    hi Pmenu ctermfg=250 ctermbg=235 cterm=NONE
    hi PmenuSbar ctermfg=250 ctermbg=242 cterm=NONE
    hi PmenuSel ctermfg=231 ctermbg=242 cterm=NONE
    hi PmenuThumb ctermfg=250 ctermbg=234 cterm=NONE
    hi Question ctermfg=250 ctermbg=234 cterm=NONE
    hi Search ctermfg=234 ctermbg=110 cterm=NONE
    hi SignColumn ctermfg=242 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=250 ctermbg=NONE cterm=NONE
    hi SpellBad ctermfg=250 ctermbg=NONE cterm=NONE
    hi SpellCap ctermfg=250 ctermbg=NONE cterm=NONE
    hi SpellLocal ctermfg=250 ctermbg=NONE cterm=NONE
    hi SpellRare ctermfg=250 ctermbg=NONE cterm=reverse
    hi StatusLine ctermfg=234 ctermbg=242 cterm=bold
    hi StatusLineNC ctermfg=242 ctermbg=235 cterm=bold
    hi TabLine ctermfg=234 ctermbg=242 cterm=bold
    hi TabLineFill ctermfg=242 ctermbg=235 cterm=NONE
    hi TabLineSel ctermfg=234 ctermbg=250 cterm=bold
    hi Title ctermfg=231 ctermbg=NONE cterm=bold
    hi VertSplit ctermfg=235 ctermbg=NONE cterm=NONE
    hi Visual ctermfg=231 ctermbg=242 cterm=NONE
    hi VisualNOS ctermfg=250 ctermbg=234 cterm=NONE
    hi WarningMsg ctermfg=250 ctermbg=234 cterm=NONE
    hi WildMenu ctermfg=250 ctermbg=234 cterm=NONE
    hi Comment ctermfg=242 ctermbg=NONE cterm=italic
    hi Constant ctermfg=229 ctermbg=NONE cterm=NONE
    hi Error ctermfg=203 ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=110 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=250 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=250 ctermbg=NONE cterm=NONE
    hi Special ctermfg=110 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=231 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=203 ctermbg=NONE cterm=NONE
    hi Type ctermfg=103 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=250 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=250 cterm=NONE
    hi ToolbarButton ctermfg=250 ctermbg=234 cterm=bold
    hi gdscriptFunctionName ctermfg=110 ctermbg=NONE cterm=bold
    hi! link gdscriptNode Special
    hi! link GitGutterAdd DiffAdd
    hi! link GitGutterChange DiffChange
    hi! link GitGutterDelete DiffDelete
    if !s:italics
      hi Folded cterm=bold
      hi Comment cterm=NONE
    endif
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  if get(g:, 'dark_and_light_transp_bg', 0) && !has('gui_running')
    hi Normal ctermfg=16 ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=16 ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=16 ctermbg=255 cterm=NONE
    hi Terminal ctermfg=16 ctermbg=255 cterm=NONE
  endif
  hi ColorColumn ctermfg=fg ctermbg=16 cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=16 ctermbg=255 cterm=NONE
  hi CursorColumn ctermfg=16 ctermbg=255 cterm=NONE
  hi CursorLine ctermfg=16 ctermbg=255 cterm=NONE
  hi CursorLineNr ctermfg=16 ctermbg=255 cterm=NONE
  hi DiffAdd ctermfg=16 ctermbg=255 cterm=reverse
  hi DiffChange ctermfg=16 ctermbg=255 cterm=reverse
  hi DiffDelete ctermfg=16 ctermbg=255 cterm=reverse
  hi DiffText ctermfg=16 ctermbg=255 cterm=bold,reverse
  hi Directory ctermfg=16 ctermbg=255 cterm=NONE
  hi EndOfBuffer ctermfg=16 ctermbg=255 cterm=NONE
  hi ErrorMsg ctermfg=16 ctermbg=255 cterm=reverse
  hi FoldColumn ctermfg=16 ctermbg=255 cterm=NONE
  hi Folded ctermfg=16 ctermbg=255 cterm=italic
  hi IncSearch ctermfg=16 ctermbg=255 cterm=reverse
  hi LineNr ctermfg=16 ctermbg=255 cterm=NONE
  hi MatchParen ctermfg=16 ctermbg=255 cterm=NONE
  hi ModeMsg ctermfg=16 ctermbg=255 cterm=NONE
  hi MoreMsg ctermfg=16 ctermbg=255 cterm=NONE
  hi NonText ctermfg=16 ctermbg=255 cterm=NONE
  hi Pmenu ctermfg=16 ctermbg=255 cterm=NONE
  hi PmenuSbar ctermfg=16 ctermbg=255 cterm=NONE
  hi PmenuSel ctermfg=16 ctermbg=255 cterm=NONE
  hi PmenuThumb ctermfg=16 ctermbg=255 cterm=NONE
  hi Question ctermfg=16 ctermbg=255 cterm=NONE
  hi Search ctermfg=16 ctermbg=255 cterm=NONE
  hi SignColumn ctermfg=16 ctermbg=255 cterm=NONE
  hi SpecialKey ctermfg=16 ctermbg=255 cterm=NONE
  hi SpellBad ctermfg=16 ctermbg=255 cterm=NONE
  hi SpellCap ctermfg=16 ctermbg=255 cterm=NONE
  hi SpellLocal ctermfg=16 ctermbg=255 cterm=NONE
  hi SpellRare ctermfg=16 ctermbg=255 cterm=reverse
  hi StatusLine ctermfg=16 ctermbg=255 cterm=NONE
  hi StatusLineNC ctermfg=16 ctermbg=255 cterm=NONE
  hi TabLine ctermfg=16 ctermbg=255 cterm=NONE
  hi TabLineFill ctermfg=16 ctermbg=255 cterm=NONE
  hi TabLineSel ctermfg=16 ctermbg=255 cterm=NONE
  hi Title ctermfg=16 ctermbg=255 cterm=NONE
  hi VertSplit ctermfg=16 ctermbg=255 cterm=NONE
  hi Visual ctermfg=16 ctermbg=255 cterm=NONE
  hi VisualNOS ctermfg=16 ctermbg=255 cterm=NONE
  hi WarningMsg ctermfg=16 ctermbg=255 cterm=NONE
  hi WildMenu ctermfg=16 ctermbg=255 cterm=NONE
  hi Comment ctermfg=16 ctermbg=NONE cterm=italic
  hi Constant ctermfg=16 ctermbg=NONE cterm=NONE
  hi Error ctermfg=16 ctermbg=255 cterm=reverse
  hi Identifier ctermfg=16 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=16 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=16 ctermbg=NONE cterm=NONE
  hi Special ctermfg=16 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=16 ctermbg=NONE cterm=NONE
  hi Todo ctermfg=16 ctermbg=NONE cterm=NONE
  hi Type ctermfg=16 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=16 ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=16 cterm=NONE
  hi ToolbarButton ctermfg=16 ctermbg=255 cterm=bold
  if !s:italics
    hi Folded cterm=NONE
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  if &background ==# 'dark'
    if get(g:, 'dark_and_light_transp_bg', 0)
      hi Normal ctermfg=LightGrey ctermbg=NONE cterm=NONE
      hi Terminal ctermfg=LightGrey ctermbg=NONE cterm=NONE
    else
      hi Normal ctermfg=LightGrey ctermbg=Black cterm=NONE
      hi Terminal ctermfg=LightGrey ctermbg=Black cterm=NONE
    endif
    hi ColorColumn ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi CursorLineNr ctermfg=LightGrey ctermbg=DarkGrey cterm=NONE
    hi DiffAdd ctermfg=LightGreen ctermbg=NONE cterm=bold
    hi DiffChange ctermfg=LightMagenta ctermbg=NONE cterm=bold
    hi DiffDelete ctermfg=LightRed ctermbg=NONE cterm=bold
    hi DiffText ctermfg=LightGrey ctermbg=DarkGrey cterm=bold,reverse
    hi Directory ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi EndOfBuffer ctermfg=DarkGrey ctermbg=Black cterm=NONE
    hi ErrorMsg ctermfg=Black ctermbg=DarkRed cterm=bold,reverse
    hi FoldColumn ctermfg=Grey ctermbg=NONE cterm=NONE
    hi Folded ctermfg=Grey ctermbg=NONE cterm=bold,italic
    hi IncSearch ctermfg=LightGrey ctermbg=Black cterm=reverse
    hi LineNr ctermfg=Grey ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=White ctermbg=Grey cterm=NONE
    hi ModeMsg ctermfg=LightMagenta ctermbg=Black cterm=bold
    hi MoreMsg ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi NonText ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi Pmenu ctermfg=LightGrey ctermbg=DarkGrey cterm=NONE
    hi PmenuSbar ctermfg=LightGrey ctermbg=Grey cterm=NONE
    hi PmenuSel ctermfg=White ctermbg=Grey cterm=NONE
    hi PmenuThumb ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi Question ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi Search ctermfg=Black ctermbg=LightBlue cterm=NONE
    hi SignColumn ctermfg=Grey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi SpellBad ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi SpellCap ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi SpellLocal ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi SpellRare ctermfg=LightGrey ctermbg=NONE cterm=reverse
    hi StatusLine ctermfg=Black ctermbg=Grey cterm=bold
    hi StatusLineNC ctermfg=Grey ctermbg=DarkGrey cterm=bold
    hi TabLine ctermfg=Black ctermbg=Grey cterm=bold
    hi TabLineFill ctermfg=Grey ctermbg=DarkGrey cterm=NONE
    hi TabLineSel ctermfg=Black ctermbg=LightGrey cterm=bold
    hi Title ctermfg=White ctermbg=NONE cterm=bold
    hi VertSplit ctermfg=DarkGrey ctermbg=NONE cterm=NONE
    hi Visual ctermfg=White ctermbg=Grey cterm=NONE
    hi VisualNOS ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi WarningMsg ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi WildMenu ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi Comment ctermfg=Grey ctermbg=NONE cterm=italic
    hi Constant ctermfg=LightYellow ctermbg=NONE cterm=NONE
    hi Error ctermfg=LightRed ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=LightBlue ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi Special ctermfg=LightBlue ctermbg=NONE cterm=NONE
    hi Statement ctermfg=White ctermbg=NONE cterm=NONE
    hi Todo ctermfg=LightRed ctermbg=NONE cterm=NONE
    hi Type ctermfg=LightMagenta ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=LightGrey ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=LightGrey cterm=NONE
    hi ToolbarButton ctermfg=LightGrey ctermbg=Black cterm=bold
    hi gdscriptFunctionName ctermfg=LightBlue ctermbg=NONE cterm=bold
    hi! link gdscriptNode Special
    hi! link GitGutterAdd DiffAdd
    hi! link GitGutterChange DiffChange
    hi! link GitGutterDelete DiffDelete
    if !s:italics
      hi Folded cterm=bold
      hi Comment cterm=NONE
    endif
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  if get(g:, 'dark_and_light_transp_bg', 0) && !has('gui_running')
    hi Normal ctermfg=Black ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=Black ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi Terminal ctermfg=Black ctermbg=LightGrey cterm=NONE
  endif
  hi ColorColumn ctermfg=fg ctermbg=Black cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi CursorColumn ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi CursorLine ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi CursorLineNr ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi DiffAdd ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi DiffChange ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi DiffDelete ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi DiffText ctermfg=Black ctermbg=LightGrey cterm=bold,reverse
  hi Directory ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi EndOfBuffer ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi ErrorMsg ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi FoldColumn ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Folded ctermfg=Black ctermbg=LightGrey cterm=italic
  hi IncSearch ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi LineNr ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi MatchParen ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi ModeMsg ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi MoreMsg ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi NonText ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Pmenu ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi PmenuSbar ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi PmenuSel ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi PmenuThumb ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Question ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Search ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SignColumn ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SpecialKey ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SpellBad ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SpellCap ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SpellLocal ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi SpellRare ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi StatusLine ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi StatusLineNC ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi TabLine ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi TabLineFill ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi TabLineSel ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Title ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi VertSplit ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Visual ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi VisualNOS ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi WarningMsg ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi WildMenu ctermfg=Black ctermbg=LightGrey cterm=NONE
  hi Comment ctermfg=Black ctermbg=NONE cterm=italic
  hi Constant ctermfg=Black ctermbg=NONE cterm=NONE
  hi Error ctermfg=Black ctermbg=LightGrey cterm=reverse
  hi Identifier ctermfg=Black ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=Black ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=Black ctermbg=NONE cterm=NONE
  hi Special ctermfg=Black ctermbg=NONE cterm=NONE
  hi Statement ctermfg=Black ctermbg=NONE cterm=NONE
  hi Todo ctermfg=Black ctermbg=NONE cterm=NONE
  hi Type ctermfg=Black ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=Black ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=Black cterm=NONE
  hi ToolbarButton ctermfg=Black ctermbg=LightGrey cterm=bold
  if !s:italics
    hi Folded cterm=NONE
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 2
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=NONE
  hi CursorColumn term=reverse
  hi CursorLine term=underline
  hi CursorLineNr term=bold,italic,reverse,underline
  hi DiffAdd term=reverse,underline
  hi DiffChange term=reverse,underline
  hi DiffDelete term=reverse,underline
  hi DiffText term=bold,reverse,underline
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,italic,reverse
  hi FoldColumn term=reverse
  hi Folded term=italic,reverse,underline
  hi IncSearch term=bold,italic,reverse
  hi LineNr term=reverse
  hi MatchParen term=bold,underline
  hi ModeMsg term=NONE
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=NONE
  hi PmenuSel term=NONE
  hi PmenuThumb term=NONE
  hi PopupSelected term=reverse
  hi Question term=standout
  hi Search term=italic,underline
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=italic,underline
  hi SpellCap term=italic,underline
  hi SpellLocal term=italic,underline
  hi SpellRare term=italic,underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=reverse
  hi TabLine term=italic,reverse,underline
  hi TabLineFill term=reverse,underline
  hi TabLineSel term=bold
  hi Title term=bold
  hi VertSplit term=reverse
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi Comment term=italic
  hi Constant term=bold,italic
  hi Error term=reverse
  hi Identifier term=italic
  hi Ignore term=NONE
  hi PreProc term=italic
  hi Special term=bold,italic
  hi Statement term=bold
  hi Todo term=bold,underline
  hi Type term=bold
  hi Underlined term=underline
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  if !s:italics
    hi CursorLineNr term=bold,reverse,underline
    hi ErrorMsg term=bold,reverse
    hi Folded term=reverse,underline
    hi IncSearch term=bold,reverse
    hi Search term=underline
    hi SpellBad term=underline
    hi SpellCap term=underline
    hi SpellLocal term=underline
    hi SpellRare term=underline
    hi TabLine term=reverse,underline
    hi Comment term=NONE
    hi Constant term=bold
    hi Identifier term=NONE
    hi PreProc term=NONE
    hi Special term=bold
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: black         #1c1c1c           234               Black
" Color: grey          #6c6c6c           242               Grey
" Color: red           #af5f5f           131               DarkRed
" Color: green         #5f875f           65                DarkGreen
" Color: yellow        #87875f           101               DarkYellow
" Color: blue          #5f87af           67                DarkBlue
" Color: magenta       #5f5f87           60                DarkMagenta
" Color: cyan          #5f8787           66                DarkCyan
" Color: white         #bcbcbc           250               LightGrey
" Color: brightblack   #262626           235               DarkGrey
" Color: brightred     #ff8700           203               LightRed
" Color: brightgreen   #87af87           108               LightGreen
" Color: brightyellow  #ffffaf           229               LightYellow
" Color: brightblue    #87afd7           110               LightBlue
" Color: brightmagenta #8787af           103               LightMagenta
" Color: brightcyan    #5fafaf           73                LightCyan
" Color: brightwhite   #ffffff           231               White
" Term colors: black red green yellow blue magenta cyan white
" Term colors: brightblack brightred brightgreen brightyellow
" Term colors: brightblue brightmagenta brightcyan brightwhite
" Background: light
" Color: black                rgb(  0,   0,   0)     ~        Black
" Color: red                  rgb(255,   0,   0)     ~        DarkRed
" Color: green                rgb(  0, 255,   0)     ~        DarkGreen
" Color: yellow               rgb(255, 255,   0)     ~        DarkYellow
" Color: blue                 rgb(  0,   0, 255)     ~        DarkBlue
" Color: magenta              rgb(255,   0, 255)     ~        DarkMagenta
" Color: cyan                 rgb(  0, 255, 255)     ~        DarkCyan
" Color: white                rgb(235, 235, 235)     ~        LightGrey
" Color: brightblack          rgb(210, 210, 210)     ~        DarkGrey
" Color: brightred            rgb(255, 100,   0)     ~        LightRed
" Color: brightgreen          rgb(100, 255,   0)     ~        LightGreen
" Color: brightyellow         rgb(255, 255, 100)     ~        LightYellow
" Color: brightblue           rgb(  0, 100, 255)     ~        LightBlue
" Color: brightmagenta        rgb(255, 100, 255)     ~        LightMagenta
" Color: brightcyan           rgb(100, 255, 255)     ~        LightCyan
" Color: brightwhite          #ffffff                231      White
" Term colors: black red green yellow blue magenta cyan white
" Term colors: brightblack brightred brightgreen brightyellow
" Term colors: brightblue brightmagenta brightcyan brightwhite
" Background: any
" vim: et ts=2 sw=2