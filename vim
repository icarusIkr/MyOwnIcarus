"一般设置
set number
set autoindent
set smartindent
set showmatch
set ruler
set tabstop=4
set mouse=a
set shiftwidth=4
set softtabstop=4
set cindent
syntax on
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
set expandtab
set shell=/bin/bash
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set cursorline
" 高亮显示搜索结果
set hlsearch
" 自动补全配置
set completeopt=longest,menu
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" "回车即选中当前项
" "上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :"\<PageUp>"
"youcompleteme  默认tab  s-tab 和自动补全冲突
" "let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
" "let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 
" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>    
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
" "在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" "在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 跳转到定义处
let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4


"HTML设置
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }
let javascript_enable_domhtmlcss = 1
let g:user_emmet_expandabbr_key = '<c-z>'
" F5编译和运行C程序，C++程序,Python程序，shell程序，F9 gdb调试
"< F5> 编译和运行C++
map <f5> :call CompileRunGpp()<cr>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc
"<f9>  gdb调试
map <f9> :call Debug()<cr>
func!  Debug()
exec "w"
exec "!gcc % -o %< -gstabs+"
exec "!gdb %<"
endfunc
    

"Vundle 下载器
"Vundl Part Begin
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
    Pludge 'VundleVim/Vundle.vim'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'taglist.vim'
    Bundle 'Raimondi/delimitMate'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'hail2u/vim-css3-syntax'
    Bundle 'mattn/emmet-vim'
    Bundle 'pangloss/vim-javascript'
    Bundle 'marijnh/tern_for_vim'
call vundle#end()
filetype indent plugin on
"Vundle Part End
