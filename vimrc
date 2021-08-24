"设置字符类型
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 设置主题
set background=dark
colorscheme hybrid
" colorscheme gruvbox

" 共享剪贴板
set clipboard+=unnamed
" 设置行号
set number

" 折叠代码
set foldmethod=indent
set foldlevel=99
" nnoremap <space> za
" 高亮关键字
syntax on

" 设置老板键 ,
let mapleader=','

" 绑定,w insert模式保存文件
inoremap <leader>w <Esc>:w<cr>

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

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
"
" 翻译插件
Plug 'voldikss/vim-translate-me'
" 高亮单词
Plug 'lfv89/vim-interestingwords'
" 括号自动补全
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/vim-easy-align'

Plug 'mhinz/vim-startify'
" 目录树
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 代码线
Plug 'yggdroot/indentline'
" vim主题
Plug 'w0ng/vim-hybrid'
" 搜索文件
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 注释插件
Plug 'tpope/vim-commentary'

" 语言插件
Plug 'fatih/vim-go'
Plug 'vim-python/python-syntax'
" Plug 'davidhalter/jedi-vim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" 下载语言服务器 pip install python-language-servers 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 格式化
Plug 'sbdchd/neoformat'
" 静态检查
Plug 'dense-analysis/ale'
" Initialize plugin system
call plug#end()

" 高亮单词
" Highlight with <Leader>k
" Navigate highlighted words with n and N
" Clear every word highlight with <Leader>K throughout the buffer

" 翻译插件
""" Configuration example
" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>x <Plug>TranslateX

" autocmd VimEnter * NERDTree
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore = [
		\ '.git$', '.swp', '.pyc', 'idea']

" fzf.vim
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
" 搜索文件
nnoremap <silent> <c-p> :Files <CR>

" vim-easymotion
nmap ss <Plug>(easymotion-s2)

" 关闭文档预览
set completeopt-=preview

" vim-go 安装
" go env -w GO111MODULE=on
" go env -w GOPROXY=https://goproxy.cn,direct
" GoInstall+Tab
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" vim-python/python-syntax
" 高亮Python关键字
let g:python_highlight_all = 1

" coc.nvim
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" LSP
let g:LanguageClient_rootMarkers = {
    \ 'go': ['.git', 'go.mod'],
    \ }
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'shell': ['shellcheck'],
    \ 'java':['/opt/jdt/jdtls.sh'],
    \ 'go': ['bingo', '--mode', 'stdio','--pprof', ':6060'],
    \ }
" LanguageClient
nnoremap <space>li :call LanguageClient_textDocument_implementation()<CR>
nnoremap <space>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <space>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <space>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <space>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <space>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <space>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <space>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <space>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <space>lc :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <space>lu :call *LanguageClient#textDocument_documentHighlight()<CR>
nnoremap <space>lm :call LanguageClient_contextMenu()<CR>
nnoremap <space>pc :pc<CR>
