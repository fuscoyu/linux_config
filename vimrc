"设置字符类型
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 设置主题
set background=dark
colorscheme hybrid
" colorscheme gruvbox
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
" 主题下载慢 git clone 慢 
" 方法1.  /etc/ssh/ssh_config 启用GSSAPIAuthentication no
" 方法2. 在/etc/hosts 文件中注入 github.com ip地址 
" 例如：
" 140.82.114.4 github.com
" 199.232.5.194 github.global-ssl.fastly.net
Plug 'junegunn/vim-easy-align'

Plug 'mhinz/vim-startify'
" 目录树
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
" vim主题
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
" 搜索文件
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'


" 语言插件
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'fatih/vim-go'
Plug 'davidhalter/jedi-vim'
" Initialize plugin system
call plug#end()

" autocmd VimEnter * NERDTree

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore = [
		\ '.git$', ]
" ctrlp
let g:ctrlp_map='<c-p>'

" vim-easymotion
nmap ss <Plug>(easymotion-s2)

" 关闭文档预览
set completeopt-=preview
" " python-mode
" let g:pymode = 0
" " 保存时删除空格
" let g:pymode_trim_whitespaces = 1
" " 设置最大行长度
" let g:pymode_options_max_line_length = 120
" 
" 
" let g:pymode_python = 'python3'
" " 缩进 
" let g:pymode_indent = 1
" " 代码折叠
" let g:pymode_folding = 0
" 代码检查
" let g:pymode_lint = 1
" let g:pymode_lint_message = 1
" let g:pymode_lint_unmodified = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" 
" " 打开文档脚本
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" " 运行代码
" let g:pymode_run = 0
" let g:pymode_run_bind = '<leader>r'
" " 断点
" let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_bind = '<leader>b'
" 
" rope 代码辅助
let g:pymode_rope = 1
" let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_goto_definition_bind = '<C-]>'

