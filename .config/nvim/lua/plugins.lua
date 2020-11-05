vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- themes
  use 'romainl/Apprentice'
  use 'yasukotelin/shirotelin'
  use 'robertmeta/nofrils'
  use 'https://gitlab.com/yorickpeterse/vim-paper.git'
  use 'lifepillar/vim-colortemplate'
  -- use 'kkga/vim-envy'
  use '~/repos/vim-envy'

  -- utils
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  -- use 'tpope/vim-commentary'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-unimpaired'
  use 'airblade/vim-rooter'
  use 'junegunn/vim-easy-align'
  use 'cohama/lexima.vim'
  use 'mhinz/vim-sayonara'

  -- ui
  use 'airblade/vim-gitgutter'
  use 'ap/vim-buftabline'
  use 'mbbill/undotree'
  use 'junegunn/vim-peekaboo'
  use 'machakann/vim-highlightedyank'

  -- motions
  use 'justinmk/vim-sneak'
  use 'rhysd/clever-f.vim'

  -- notes
  use 'plasticboy/vim-markdown'
  use 'previm/previm'
  use 'cweagans/vim-taskpaper'
  use 'https://gitlab.com/dbeniamine/todo.txt-vim'

  -- searching
  -- use {'nvim-lua/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
  use 'justinmk/vim-dirvish'
  use 'dyng/ctrlsf.vim'
  use 'ctrlpvim/ctrlp.vim'
  use {'mhinz/vim-grepper', cmd = 'Grepper'}

  -- lsp
  use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'neovim/nvim-lspconfig'                                                                             
  -- use 'nvim-lua/completion-nvim'                                                                          
  -- use 'nvim-lua/diagnostic-nvim'                                                                          
  -- use 'nvim-treesitter/nvim-treesitter'

  -- lang
  use 'habamax/vim-godot'
  use 'rust-lang/rust.vim'

end)
