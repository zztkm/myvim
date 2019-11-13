" set dein.vim
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " プラグインリスト用TOMLファイルの準備
  let s:dein_toml = '~/.vim/rc/dein.toml'
  let s:dein_lazy_toml = '~/.vim/rc/deinlazy.toml'

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
colorscheme onedark

set number
set shiftwidth=4
set tabstop=4
set expandtab
set clipboard=unnamed
set hls
