-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- themes
  use 'romainl/Apprentice'
  use{'yorickpeterse/vim-paper', url='https://gitlab.com/yorickpeterse/vim-paper.git'}
  use 'lifepillar/vim-colortemplate'
  use '~/repos/vim-envy'

  -- utils
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-endwise'
  use 'tpope/vim-rsi'
  use 'cohama/lexima.vim'
  use 'airblade/vim-rooter'
  use 'mhinz/vim-sayonara'
  use 'rhysd/clever-f.vim'
  use 'justinmk/vim-sneak'

  -- ui
  use 'airblade/vim-gitgutter'
  use 'ap/vim-buftabline'
  use 'mbbill/undotree'
  use 'junegunn/vim-peekaboo'
  use 'machakann/vim-highlightedyank'
  
  -- notes
  use 'plasticboy/vim-markdown'
  use 'cweagans/vim-taskpaper'
  use 'https://gitlab.com/dbeniamine/todo.txt-vim'
  use 'axvr/org.vim'
  use 'junegunn/goyo.vim'
  use 'godlygeek/tabular'
  
  -- searching
  use 'justinmk/vim-dirvish'
  use 'dyng/ctrlsf.vim'
  use 'ctrlpvim/ctrlp.vim'
  use 'mhinz/vim-grepper'
  use 'srstevenson/vim-picker'
  
  -- lsp
  use 'neoclide/coc.nvim'
  use 'dense-analysis/ale'
  
  -- lang
  use 'habamax/vim-godot'
  use 'euclidianAce/BetterLua.vim'
  use 'tjdevries/manillua.nvim'
  use 'fatih/vim-go'

end)
