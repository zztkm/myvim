"My vimrc
syntax on

filetype indent on

set number
set expandtab
set shiftwidth=2
set tabstop=2
set termguicolors

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

"""""""""""""""
"dein.vim setup
"""""""""""""""
"plugins install dir
let s:dein_dir = expand('$DATA/dein')
"dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"don't have dein.vim
if &runtimepath !~# '/dein.vim'
  " Auto Download
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"start setup
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, expand('<sfile>'))

  "set toml dir
  let g:toml_dir = expand('$CONFIG/nvim/dein')

  " load toml
  call dein#load_toml(g:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(g:toml_dir . '/lazy.toml', {'lazy': 1})
  "python3 dependent
  if has('python3')
    call dein#load_toml(g:toml_dir . '/python.toml', {'lazy': 1})
  endif
  
  "end setup
  call dein#end()
  call dein#save_state()
endif

" If there is any uninstalled one installed
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
