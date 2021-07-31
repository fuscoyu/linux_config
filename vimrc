set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 设置行号
set number
" 高亮关键字
syntax on

" 设置老板键 ,
let mapleader=','
" 绑定,w insert模式保存文件
inoremap <leader>w <Esc>:w<cr>
" jj 代替Esc
inoremap jj <Esc>
" command 格式化json字符串
com! FormatJSON %!python3 -m json.tool

" 安装vim-plug 插件管理器
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'mhinz/vim-startify'
" Initialize plugin system
call plug#end()
