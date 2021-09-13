" https://github.com/junegunn/vim-plug

call plug#begin('~/.config/nvim/plugged')
    " ---------- Temas ----------
    " Plug 'morhetz/gruvbox'
    " Plug 'rakr/vim-one'
    " Plug 'dracula/vim'
    Plug 'ayu-theme/ayu-vim'
    " Plug 'Badacadabra/vim-archery'
    " Plug 'zacanger/angr.vim'
    " Plug 'tyrannicaltoucan/vim-deep-space'
    " Plug 'ajmwagar/vim-deus'
    " Plug 'wadackel/vim-dogrun'
    " Plug 'whatyouhide/vim-gotham'
    " Plug 'cocopon/iceberg.vim'

    " ---------- Eeasymotion ----------
    Plug 'easymotion/vim-easymotion'

    " ---------- Nerdtree ---------- 
    Plug 'scrooloose/nerdtree'

    " ---------- Icons nerdtree ----------
    Plug 'ryanoasis/vim-devicons'

    " ---------- Airline ----------
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " ---------- Completar llaver ----------
    Plug 'jiangmiao/auto-pairs'

    " ---------- Integracion de git ----------
    Plug 'mhinz/vim-signify'

    " ---------- Intellisense ----------
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ---------- Tmux navigator ----------
    " Plug 'christoomey/vim-tmux-navigator'

    " ---------- Markdown ----------
    " Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'

    " ---------- Markdown preview ----------
    "      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()}, 'for': ['markdown', 'vim-plug']}

    " ---------- Ranger ----------
    " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

call plug#end()
