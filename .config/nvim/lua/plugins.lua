vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}

        -- themes
        use "~/repos/vim-envy"
        use "romainl/Apprentice"
        use {"yorickpeterse/vim-paper", url = "https://gitlab.com/yorickpeterse/vim-paper.git"}
        use "lifepillar/vim-colortemplate"
        use  "jonathanfilip/vim-lucius"
        use "axvr/photon.vim"
        use 'caksoylar/vim-mysticaltutor'

        -- utils
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use "tpope/vim-commentary"
        use "tpope/vim-sleuth"
        use "tpope/vim-eunuch"
        use "tpope/vim-unimpaired"
        use "tpope/vim-rsi"
        use "cohama/lexima.vim"
        use "airblade/vim-rooter"
        use "rhysd/clever-f.vim"
        use "justinmk/vim-sneak"

        -- ui
        use "airblade/vim-gitgutter"
        use "ap/vim-buftabline"
        use "mbbill/undotree"
        use "junegunn/vim-peekaboo"

        -- notes
        use "plasticboy/vim-markdown"
        use {"iamcco/markdown-preview.nvim", run = "cd app & yarn install"}
        use "cweagans/vim-taskpaper"
        use "https://gitlab.com/dbeniamine/todo.txt-vim"
        use "junegunn/goyo.vim"
        use "godlygeek/tabular"

        -- searching
        use "justinmk/vim-dirvish"
        use "dyng/ctrlsf.vim"
        use "mhinz/vim-grepper"
        use 'srstevenson/vim-picker'
        use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end  }
        use 'junegunn/fzf.vim'
        use {
              'nvim-telescope/telescope.nvim',
              requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
            }

        -- lsp
        use "neoclide/coc.nvim"

        -- lang
        use "habamax/vim-godot"
        use "axvr/org.vim"
        use "HerringtonDarkholme/yats.vim"
        use "evanleck/vim-svelte"
        use "pangloss/vim-javascript"
        use {
            "fatih/vim-go",
            run = ":GoUpdateBinaries",
            opt = true,
            ft = "go"
        }
    end
)
