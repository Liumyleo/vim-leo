set clipboard=unnamed
" paste
xnoremap p pgvy
" enable delete key in insert mode
set backspace=indent,eol,start

" 禁用mouse，若使用则设a
set mouse=""

" 一键执行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
       exec "!g++ % -o %<"
       exec "!time ./%<"
    elseif &filetype == 'cpp'
       exec "!g++ % -o %<"
       exec "!time ./%<"
    elseif &filetype == 'java'
       exec "!javac %"
       exec "!time java %<"
    elseif &filetype == 'sh'
       :!time bash %
    elseif &filetype == 'python'
       exec "!time python3 %"
    elseif &filetype == 'html'
       exec "!firefox % &"
    elseif &filetype == 'go'
       exec "!time go run %"
    elseif &filetype == 'mkd'
       exec "!~/.vim/markdown.pl % > %.html &"
       exec "!firefox %.html &"
    endif
endfunc

" support for xshell
set t_Co=256
" 显示序号
set number relativenumber
"set relativenumber
nnoremap <F4> :set nonu nornu!<CR>
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
" 括号自动补全
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
" 显示语法
syntax on
" 自动缩进
set autoindent
" 搜索时，高亮显示匹配结果
set hlsearch
" 输入搜索内容时就显示搜索结果
set incsearch
" Paste toggle - when pasting something in, don't indent. 否则粘贴的时候会自动每行增加缩进
set pastetoggle=<F3>
" 光标追踪
set cursorcolumn
set cursorline
highlight CursorLine   cterm=bold ctermbg=black  guibg=#2b2b2b
highlight CursorColumn   cterm=bold ctermbg=black  guibg=#2b2b2b

" vim管理插件vundle
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_invoke_completion = ''
set completeopt-=preview
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_identifier_candidate_chars = 2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中当前项
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_seed_identifiers_with_syntax=1
map <c-\> :YcmCompleter GoTo<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

Plugin 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>   # 按F6自动格式化
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

Plugin 'preservim/nerdtree'
" 启用或禁用NERD Tree的键映射
nmap <F1> :NERDTreeToggle<cr>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
nnoremap <C-w>v :vsplit<CR>
nnoremap <C-s> :split<CR>

Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1

Plugin 'ntpeters/vim-better-whitespace'
map <leader>c<space> :StripWhitespace <cr>

" 括号匹配
Plugin 'andymass/vim-matchup'
let g:loaded_matchparen=1

" Gitlens 需要vim8.2
Plugin 'APZelos/blamer.nvim'
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_insert_modes = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_prefix = ' > '

" gruvbox 主题配色
"Plugin 'morhetz/gruvbox'
"autocmd vimenter * ++nested colorscheme gruvbox
"set bg=light

" dracula 主题配色
Plugin 'dracula/vim'
syntax enable
set termguicolors
colorscheme dracula

" Powerline 状态条
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='angr'

" fzf
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
nnoremap <silent> <c-p> :Files <CR>
nnoremap <silent> ag :Ag <CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" 快速注释
Plugin 'preservim/nerdcommenter'
let g:NERDDefaultAlign = 'left'
map <leader><space> <Plug>NERDCommenterToggle <CR>

" csv
" Plugin 'chrisbra/csv.vim'

" 高亮所有选中单词
Plugin 'lfv89/vim-interestingwords'

" indentLine 缩进指示线
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
let g:indentLine_char='┆'
nnoremap <Leader>l :IndentLinesToggle<CR>

" 自动补全阔号
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" 函数与变量名tagbar
Plugin 'preservim/tagbar'
"autocmd FileType python,c,cpp TagbarOpen
nnoremap <F2> :TagbarToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


