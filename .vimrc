" vim configure
if has('python3')
  silent! python3 1
endif

let mapleader = ','

syntax enable               " 开启语法高亮功能
syntax on                   " 允许用指定语法高亮配色方案替换默认方案

set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
" set cursorline              "为光标所在行加下划线
set cursorcolumn
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set ruler                   " 显示光标当前位置 
set hlsearch                " 高亮显示搜索结果

set ignorecase              "检索时忽略大小写
set hls                     "检索时高亮显示匹配项
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" FFmepg 代码格式
filetype indent on          " 自适应不同语言的智能缩进
filetype plugin indent on
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set tabstop=4
set shiftwidth=4
set softtabstop=4
" indentation rules for FFmpeg: 4 spaces, no tabs
set cindent
set incsearch               " 开启实时搜索功能
set nocompatible            " 关闭兼容模式
" set wildmenu                " vim 自身命令行模式智能补全
" 设置剪切板为系统默认
" set clipboard=unnamed
" vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
" nmap <silent> <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
" imap <silent> <leader>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
" nmap <silent> <leader>y :.w !pbcopy<CR><CR>
" vmap <silent> <leader>y :w !pbcopy<CR><CR>
nmap <silent> <leader>P "*P
imap <silent> <leader>P <Esc>"*P
nmap <silent> <leader>p "*p
imap <silent> <leader>p <Esc>"*p
nmap <silent> <leader>y "*y
vmap <silent> <leader>y "*y

" 根据括号缩进
" autocmd FileType c set cinoptions=(0
" JS文件使用2个空格缩进
autocmd FileType javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue.html.javascript.css set expandtab tabstop=2 shiftwidth=2 softtabstop=2
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
" Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=darkred ctermfg=white guibg=#660000
match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" 代码折叠
" autocmd FileType javascript set foldmethod=indent
" autocmd FileType javascript set foldnestmax=2
" autocmd FileType javascript set nofoldenable
" autocmd FileType javascript set foldlevel=2

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
" nnoremap <C-l> gt
" nnoremap <C-h> gT
" nnoremap <leader>t : tabe<CR>
" nnoremap <C-]> gd
" nnoremap <C-t> gt

" 参考线 80
" VIM 7.3+ has support for highlighting a specified column.
if exists('+colorcolumn')
    set colorcolumn=80
else
    " Emulate
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" Column 80 marker 超出80显示红色
highlight OverLength ctermbg=darkred ctermfg=white guibg=#660000
match OverLength /\%81v.\+/

"设置使用系统拷贝不自动插入注释
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"防止换行自动插入注释
autocmd BufWinEnter,BufNewFile,BufRead * setlocal formatoptions-=cro
" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 添加映射总是将光标移动在屏幕中央
" nnoremap <esc> :noh<cr>zz
" noremap j gjzz
" noremap k gkzz
noremap n nzz
" noremap <s-n> <s-n>zz
" noremap * *zz
" noremap # #zz
" noremap <c-o> <c-o>zz
" noremap <c-i> <c-i>zz

call plug#begin('~/.vim/plugged')

    Plug 'Shougo/vimproc.vim', {'do' : 'make'}

    " Color schemes
    " Plug 'joshdick/onedark.vim'
    " Plug 'exitface/synthwave.vim'
    " Plug 'raphamorim/lucario'
    " Plug 'benjaminwhite/Benokai'
    " Plug 'w0ng/vim-hybrid'
    "Plug 'vivkin/flatland.vim'
    "Plug 'flazz/vim-colorschemes'
    " Plug 'altercation/vim-colors-solarized'
    "Plug 'ColorSchemeMenuMaker'
    "Plug 'rainux/vim-desert-warm-256'
    " Plug 'mhartington/oceanic-next'
    Plug 'rakr/vim-one'

    " Files
    Plug 'mileszs/ack.vim', { 'on': 'Ack' }
    Plug 'scrooloose/nerdtree'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'

    " FZF
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Utility
    Plug 'godlygeek/tabular'
    " Plug 'easymotion/vim-erasymotion'
    Plug 'justinmk/vim-sneak'
    Plug 'vim-airline/vim-airline'
    Plug 'Raimondi/delimitMate'           " 括号补全
    Plug 'nathanaelkane/vim-indent-guides'
    " Plug 'scrooloose/syntastic'
    Plug 'tomtom/tcomment_vim'              " 注释
    " Plug 'lrvick/Conque-Shell'            " shell运行
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    " Plug 'kshenoy/vim-signature'          " 给代码行做标记

    " Complete
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer' }
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } 
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    " set encoding=utf-8
    " set runtimepath+=~/.vim/plugged/deoplete.nvim
    " set pyxversion=3
    " let g:deoplete#enable_at_startup = 1
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
    " " call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
    "
    " call deoplete#custom#source('buffer', 'is_debug_enabled', 1)
    " " let g:deoplete#num_processes = 1
    "
    " call deoplete#custom#option('sources', {
    " \ '_': ['buffer'],
    " \})

    " Cocoa
    "Plug 'msanders/cocoa.vim'

    " Nodejs
    " Plug 'moll/vim-node', { 'for': 'javascript' }
    " Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }

    " Javascript
    " Plug 'jelera/vim-javascript-syntax'
    " Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    " Plug 'othree/yajs.vim', {'for': 'javascript'}
    "Plug 'walm/jshint.vim'

    " Markdown
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'mtth/scratch.vim', { 'for': 'markdown' }
    Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Cpp
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
    Plug 'derekwyatt/vim-fswitch', { 'for': ['cpp'] }     " cpp和h切换

    " Syntax
    Plug 'sheerun/vim-polyglot'             " 多种语言语法支持
    Plug 'w0rp/ale'                         " 语法lint

    " Vue
    Plug 'posva/vim-vue', { 'for': ['vue'] }

    " jsx
    Plug 'alampros/vim-styled-jsx', { 'for': ['jsx'] } " CSS
    Plug 'ap/vim-css-color', { 'for': ['css'] }

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-l> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-h> :TmuxNavigateRight<cr>
    " nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
    Plug 'benmills/vimux'
    " Prompt for a command to run
    map <Leader>vp :VimuxPromptCommand<CR>
    " Run last command executed by VimuxRunCommand
    map <Leader>vl :VimuxRunLastCommand<CR>
    " Inspect runner pane
    map <Leader>vi :VimuxInspectRunner<CR>
call plug#end()

" Global
" set background=dark
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" colorscheme hybrid 
" colorscheme solarized
" colorscheme onedark

" set Vim-specific sequences for RGB colors
" if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app'
"   set t_8f=^[[38;2;%lu;%lu;%lum
"   set t_8b=^[[48;2;%lu;%lu;%lum
"   set termguicolors
" endif
" for vim 8
" if (has("termguicolors"))
  " set termguicolors
" endif
"
" for vim 7
" set t_Co=256

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

set background=dark
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
if has('termguicolors') && (exists('$TMUX') || has("gui_running"))
    set termguicolors
else
    hi! link Conceal Normal
    if !has('gui_running')
        hi! Normal ctermbg=NONE guibg=NONE
        hi! NonText ctermbg=NONE guibg=NONE
    endif
endif

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" tcomment_vim
"Toggle comments
map <C-\> :TComment<CR>
"Toggle comments as a block
map <C-\/> :TCommentBlock<CR>

" DelimitMate
"BreakLine: Return TRUE if in the middle of {} or () in INSERT mode
if !exists('*BreakLine')
  fun BreakLine()
      if (mode() == 'i')
          return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
                      \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
      else
          return 0
      endif
  endfun
endif

" Remap <Enter> to split the line and insert a new line in between if
" BreakLine return True
" inoremap <expr> <CR> BreakLine() ? "<CR><CR><C-o>k<Tab>" : "<CR>"
inoremap <expr> <CR> BreakLine() ? "<CR><CR><C-o>k<C-t>" : "<CR>"
" inoremap <C-Return> <CR><CR><C-o>k<C-t>
" imap <C-Return> <CR><CR><C-o>k<Tab>

" YouCompleteMe
let g:ycm_enable_diagnostic_signs       = 0
let g:ycm_always_populate_location_list = 0 "default 0
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments = 1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf    = 0
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=~/tags/tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_error_symbol                 = '>>'
" let g:ycm_warning_symbol               = '>*'
"nnoremap gd :YcmCompleter GoToDefinition<CR>
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gd :YcmCompleter GoTo subcommand<CR>
" autocmd FileType javascript nnoremap gt :YcmCompleter GetType<CR>
autocmd FileType javascript nnoremap gD :YcmCompleter GoTo subcommand<CR>
autocmd FileType javascript nnoremap gc :YcmCompleter GetDoc<CR>
autocmd FileType python nnoremap gr :YcmCompleter GoToReferences<CR>
" autocmd FileType typescript nnoremap gr :YcmCompleter GoToReferences<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_filetype_blacklist = {
      \ 'tagbar'    : 1,
      \ 'qf'        : 1,
      \ 'notes'     : 1,
      \ 'markdown'  : 1,
      \ 'md'        : 1,
      \ 'unite'     : 1,
      \ 'text'      : 1,
      \ 'vimwiki'   : 1,
      \ 'pandoc'    : 1,
      \ 'infolog'   : 1,
      \ 'mail'      : 1,
      \ 'gitcommit' : 1,
      \ 'sql'       : 1
      \}
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}

" Ack
let g:ackprg = 'ag --nogroup --column'

" tern
" autocmd FileType javascript nmap <buffer> gd :TernDef<CR>
"autocmd FileType javascript nmap <buffer> gt :TernType<CR>
" autocmd FileType javascript nmap <buffer> gr :TernRefs<CR>
" autocmd FileType javascript nmap <leader> na :TernRename<CR>

"""""""""""""""""
" Tern settings
"""""""""""""""""
" let g:tern_show_argument_hints='on_hold'
" and 
" let g:tern_map_keys=1
" let g:tern_map_prefix = '<leader>'

" Easymotion
" let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" 2-character search motion
" nmap <Leader>s <Plug>(easymotion-s2)
" nmap <Leader>t <Plug>(easymotion-t2)
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
" n-character search motion
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" 重复上一次操作, 类似repeat插件, 很强大
" map <Leader>. <Plug>(easymotion-repeat)

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
"nmap <Leader>a| :Tabularize /|<CR>
"vmap <Leader>a| :Tabularize /|<CR>
"nmap <Leader>a: :Tabularize /:\zs<CR>
"vmap <Leader>a: :Tabularize /:\zs<CR>

" Enable Powerline fonts for airline
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
" let g:airline_theme='onedark'
" let g:airline_theme='oceanicnext'
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:Powerline_symbols = 'fancy'

" Indent guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup = 1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level = 2
" 色块宽度
let g:indent_guides_guide_size  = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg  = darkgrey ctermbg = 23
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg = darkgrey ctermbg = 24
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg  = darkgrey ctermbg = 252
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg = darkgrey ctermbg = 251
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" eslint
" let g:syntastic_javascript_checkers = ['standard']
" let g:syntastic_javascript_standard_generic = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint'

" Markdown
let g:vim_markdown_folding_disabled = 1
" Markdown Preview
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" or
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

" " Currently broken due to Vim/Semicolon issues
" " Alt+; to toggle comments
" nnoremap <silent> <M-;> gc
" vnoremap <silent> <M-;> gc
" inoremap <silent> <M-;> <esc>gci

" Scratch splits the current window in half
let g:scratch_height = 0.50
" Scratch opens in Markdown format
let g:scratch_filetype = 'markdown'

" fswitch
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" NerdTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
 "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd BufEnter * lcd %:p:h
map <leader><leader>f :NERDTreeFind<cr>

" NerdTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_autofind=1
" let g:nerdtree_tabs_open_on_console_startup=1

" auto add node header comment
autocmd bufnewfile *.js so /Users/zhangmin/headers/node_header.txt
autocmd bufnewfile *.js exe "1," . 6 . "g/{date}.*/s//" .strftime("%Y-%m-%d")
" autocmd bufnewfile *.js exe "1," . 6 . "g/{author}.*/s//张闽"
" autocmd bufnewfile *.js exe "1," . 6 . "g/{company}.*/s//厦门初莘科技有限公司"
autocmd Bufwritepre,filewritepre *.js execute "normal ma"
"autocmd Bufwritepre,filewritepre *.js exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%Y-%m-%d %H:%M:%S %Z")
"autocmd bufwritepost,filewritepost *.c execute "normal `a"

" auto add react header comment
autocmd bufnewfile *.jsx so /Users/zhangmin/headers/react_header.txt
autocmd bufnewfile *.jsx exe "1," . 6 . "g/{date}.*/s//" .strftime("%Y-%m-%d")
" autocmd bufnewfile *.jsx exe "1," . 6 . "g/{author}.*/s//张闽"
" autocmd bufnewfile *.jsx exe "1," . 6 . "g/{company}.*/s//厦门初莘科技有限公司"
autocmd Bufwritepre,filewritepre *.js execute "normal ma"

" Vim-vue
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart

" " please install ConqueShell (https://github.com/lrvick/Conque-Shell)
" function! DebugJs()
"   let cmd="node --debug-brk "
"   if( expand('%:e') == "coffee")
"     let cmd="coffee --nodejs --debug-brk "
"   endif
"   exec "silent ConqueTermVSplit bash -ic \"(" . cmd . @% . " &) ; sleep 1s && node-vim-inspector\""
" endfunction
"
" " launch debug on ctrl-d
" nnoremap <C-d> :call DebugJs()<CR>  

" ctrlp
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.(git|hg|svn)|(temp|build|dist))$',
"   \ 'file': '\v\.(exe|so|dll|meta)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](node_modules|temp|build|target|dist)|(\.(swp|ico|git|svn|hg))$',
"   \ 'file': '\v\.(exe|so|dll|meta)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" FZF
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

set exrc
set secure

" vim-vue wpy
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_linters = {'javascript': ['tsserver', 'standard']}
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
" let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:airline#extensions#ale#enabled = 1
autocmd FileType javascript nmap <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType javascript nmap <buffer> gr :ALEFindReferences<CR>
autocmd FileType javascript nmap <buffer> gt :ALEHover<CR>
autocmd FileType typescript nmap <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType typescript nmap <buffer> gr :ALEFindReferences<CR>
" autocmd FileType typescript nmap <buffer> gt :ALEHover<CR>

" Enable completion where available.
" let g:ale_completion_enabled = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>f <Plug>(ale_fix)
augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

" repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" 解决开了语法高亮vim光标移动卡慢的问题
set re=1
set ttyfast
set lazyredraw
set nocursorline

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
