"-----------------------------------------------------------------------------
" < Vundle 配置 >
"-----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'mbbill/undotree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'a.vim'
" Plugin 'Align'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bufexplorer.zip'
" Plugin 'ccvext.vim'
Plugin 'cSyntaxAfter'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
"Plugin 'mattn/emmet-vim'
" Plugin 'Yggdroot/indentLine' "cause stutter
" Plugin 'vim-javacompleteex'
" Plugin 'Mark--Karkat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'repeat.vim'
"Plugin 'msanders/snipmate.vim'
"Plugin 'wesleyche/SrcExpl'
Plugin 'std_c.zip'
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
" Plugin 'TxtBrowser'
"Plugin 'ZoomWin'
if v:version > 704 || (v:version == 704 && has( 'patch1578' ))
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'rdnetto/YCM-Generator'
    let g:enable_youCompleteMe = 1
    let g:enable_neocomplete = 0
else
    let g:enable_youCompleteMe = 0
    let g:enable_neocomplete = 1
endif
" Plugin 'Raimondi/delimitMate'
" Plugin 'aceofall/gtags.vim'
Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neosnippet-snippets'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tomasr/molokai'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'dkprice/vim-easygrep'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'milkypostman/vim-togglelist'
Plugin 'vim-scripts/autoload_cscope.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'Conque-GDB'
Plugin 'lilydjwg/fcitx.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" -----------------------------------------------------------------------------
"  < 按键映射 >
" -----------------------------------------------------------------------------
let mapleader = ","

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p"

" Shortcuts
" Change Working Directory to that of the current file
cnoremap cwd lcd %:p:h
"cmap cd. lcd %:p:h

" For when you forget to sudo.. Really Write the file.
cnoremap w!! w !sudo tee % >/dev/null

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <silent> <space> za

" Ctrl + K 插入模式下光标向上移动
inoremap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
inoremap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
inoremap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
inoremap <c-l> <Right>

" Ctrl + a 光标跳转到行头
inoremap <c-a> <ESC>I

" Ctrl + e 光标跳转到行尾
inoremap <c-e> <ESC>A

" -----------------------------------------------------------------------------
"让*号高亮时不跳转到下一个
" nnoremap <silent> * :execute "normal! *N"<cr>
nnoremap <silent> * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> # :set nohls<CR>

function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> * :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

" -----------------------------------------------------------------------------
"清除行尾空格
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    noh
    call winrestview(l:save)
endfun
"au BufWritePre *.cpp,*.[ch],*.cc,*.hpp call TrimWhitespace()
command Cs call TrimWhitespace()

" 常规模式下输入 cM 清除行尾 ^M 符号
"nmap cM :%s/\r$//g<CR>:noh<CR>

" -----------------------------------------------------------------------------
" Hex read
nmap <Leader>hr :set binary<CR>:%!xxd -g 1<CR>:set filetype=xxd<CR>:set readonly<CR>

" Hex write
nmap <Leader>hw :set nobinary<CR>:%!xxd -r<CR>:set filetype=<CR>:set noreadonly<CR>

" -----------------------------------------------------------------------------
" active Man command ,can press 'K' on word to view man page also.
runtime! ftplugin/man.vim

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set wildmenu

if g:isGUI
    au GUIEnter * set vb t_vb=
    set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ 11
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set lines=999 columns=999
    set mouse=a                                           " 在任何模式下启用鼠标
else
    set t_Co=256                                          " 在终端启用256色
    set ttimeoutlen=100
endif

" 设置代码配色方案
colorscheme Tomorrow-Night-Eighties               "终端配色方案
augroup colorScheme
    au!
    "au FileWritePost * if &diff | let &cul=0 |endif
    "au BufEnter * if !&diff | let &cul=1 |else | let &cul=0 | endif
    au BufEnter * let &cul=!&diff
augroup end

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
syntax on
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
"set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set backspace=2                                       "设置退格键可用
set foldenable                                        "启用折叠
set foldmethod=indent                                 "indent 折叠方式
set foldlevel=9999                                    "折叠的层次，打开文件时默认不折叠

set writebackup                                       "保存文件前建立备份，保存成功后删除该备份
set nobackup                                          "设置无备份文件
set noswapfile                                        "设置无临时文件

" 当文件在外部被修改，自动更新该文件
set autoread

set ignorecase       "搜索模式里忽略大小写
set smartcase        "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
"set hlsearch        "高亮搜索
set incsearch        "在输入要搜索的文字时，实时匹配

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" -----------------------------------------------------------------------------
"  < 新文件标题 >
" -----------------------------------------------------------------------------
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
   "如果文件类型为.sh文件
   if &filetype == 'sh'
       call setline(1,"\#!/bin/bash")
       call append(line("."), "")
   elseif &filetype == 'python'
       call setline(1,"#!/usr/bin/env python")
       call append(line("."),"# coding=utf-8")
       call append(line(".")+1, "")

   elseif &filetype == 'ruby'
       call setline(1,"#!/usr/bin/env ruby")
       call append(line("."),"# encoding: utf-8")
       call append(line(".")+1, "")
   "else
       "call setline(1,          "/*")
       "call append(line("."),   " * Copyright (C) Harry Wang")
       "call append(line(".")+1, " *")
       "call append(line(".")+2, " * Create Time: ".strftime("%Y.%m"))
       "call append(line(".")+3, " */")
       "call append(line(".")+4, "")
   endif

   "if expand("%:e") == 'cpp'
       "call append(line(".")+5, "#include <iostream>")
       "call append(line(".")+6, "")
   "endif

   "if expand("%:e") == 'c'
       "call append(line(".")+5, "#include<stdio.h>")
       "call append(line(".")+6, "")
   "endif

   "if expand("%:e") == 'h'
       "call append(line(".")+5, "#ifndef _".toupper(expand("%:t:r"))."_H")
       "call append(line(".")+6, "#define _".toupper(expand("%:t:r"))."_H")
       "call append(line(".")+7, "")
       "call append(line(".")+8, "#endif")
   "endif

   "if &filetype == 'java'
       "call append(line(".")+5,"public class ".expand("%:r"))
       "call append(line(".")+6,"")
   "endif
endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

" -----------------------------------------------------------------------------
" 自动设置makeprg
" -----------------------------------------------------------------------------
let g:firstSetMakeCpp=0
autocmd FileType c,cpp exec ":call SetMakeprgCpp()"
func SetMakeprgCpp()
    if g:firstSetMakeCpp == 0
        if filereadable("Makefile") || filereadable("makefile")
            set makeprg=make
        else
            set makeprg=g++\ -g\ -std=c++11\ -Wall\ -pthread\ -o\ %:r\ %
        endif
        let g:firstSetMakeCpp=1
    endif
endfunc

" -----------------------------------------------------------------------------
" f5 调试，f7运行
" -----------------------------------------------------------------------------
" debug
func! StartDebug(prog)
    if &filetype == 'cpp' || &filetype == 'c'
        return StartDebugCpp(a:prog)
    elseif &filetype == 'python'
        return StartDebugPython(a:prog)
    endif
endfunc

" debug cpp
func! StartDebugCpp(prog)
    let a:p = a:prog
    if exists("$BUILD_TARGET") && filereadable($BUILD_TARGET)
        let a:p = $BUILD_TARGET
    else
        if !filereadable(a:p)
            let a:p = "build/" . a:prog
            if !filereadable(a:p)
                echo "no executable"
                return
            endif
        endif
    endif

    if !g:isGUI
        echom "cgdb " . a:p
        execute "!cgdb" a:p
        sleep 100m
    else
        echom a:p
        execute 'ConqueGdb ' . a:p
    endif
endfunc

" debug python
func! StartDebugPython(prog)
    execute "!python3 -m pudb " . "%"
endfunc

" -----------------------------------------------------------------------------
" execute
func! StartExecute(prog)
    if &filetype == 'cpp' || &filetype == 'c'
        return StartExecuteCpp(a:prog)
    elseif &filetype == 'python'
        return StartExecutePython(a:prog)
    endif
endfunc

" execute cpp
func! StartExecuteCpp(prog)
    let a:p = a:prog
    if exists("$BUILD_TARGET") && filereadable($BUILD_TARGET)
        let a:p = $BUILD_TARGET
    else
        if !filereadable(a:p)
            let a:p = "build/" . a:prog
            if !filereadable(a:p)
                echo "no executable"
                return
            endif
        else
            let a:p = "./" . a:prog
        endif
    endif

    echom a:p
    execute "!" . a:p
endfunc

" execute python
func! StartExecutePython(prog)
    execute "!python3 " . "%"
endfunc

" ----------------------------------------------------------------------------
nmap <silent> <F5> :call StartDebug(expand("%:t:r"))<CR><CR>
nmap <silent> <F7> :call StartExecute(expand("%:t:r"))<CR>

autocmd FileType c,cpp,python set autowrite
autocmd FileType c,cpp nnoremap <buffer> mm :make<CR>

"=============================================================================
"                         << 以下为常用插件配置 >>
"=============================================================================

"-----------------------------------------------------------------------------
" < undotree 插件配置 >
"-----------------------------------------------------------------------------
nnoremap <F3> :UndotreeToggle<CR>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile

    if !isdirectory(&undodir)
        if exists("*mkdir")
            call mkdir(&undodir, "p")
        else
            echom "Please create directory: " . &undodir
        endif
    endif
endif

"-----------------------------------------------------------------------------
" < a.vim 插件配置 >
"-----------------------------------------------------------------------------
"用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
"
"-----------------------------------------------------------------------------
" < Align 插件配置 >
"-----------------------------------------------------------------------------
"一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多

"-----------------------------------------------------------------------------
" < auto-pairs 插件配置 >
"-----------------------------------------------------------------------------
"用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突
"所以我就没有加入echofunc插件
let g:AutoPairsMapCR = 1
let g:AutoPairsMapCh = 0

"-----------------------------------------------------------------------------
" < BufExplorer 插件配置 >
"-----------------------------------------------------------------------------
"快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
" <Leader>be 在当前窗口显示缓存列表并打开选定文件
" <Leader>bs 水平分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
" <Leader>bv 垂直分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件

" -----------------------------------------------------------------------------
"  < ccvext.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于对指定文件自动生成tags与cscope文件并连接
" 如果是Windows系统, 则生成的文件在源文件所在盘符根目录的.symbs目录下(如: X:\.symbs\)
" 如果是Linux系统, 则生成的文件在~/.symbs/目录下
" 具体用法可参考www.vim.org中此插件的说明
" <Leader>sy 自动生成tags与cscope文件并连接
" <Leader>sc 连接已存在的tags与cscope文件

" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" 高亮括号与运算符等
" au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()

" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 >
" -----------------------------------------------------------------------------
" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件
" ctrlp {
if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
    let g:ctrlp_map = '<leader>f'
    let g:ctrlp_cmd = 'CtrlP'
    " let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_use_caching = 1
    " nnoremap <silent> <D-t> :CtrlP<CR> //D是mac系统中的功能键
    " nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.o$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
    elseif WINDOWS()
        let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

    if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        " nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        " nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
        let g:ctrlp_funky_syntax_highlight = 1
    endif
endif
"}

" -----------------------------------------------------------------------------
"  < emmet-vim（前身为Zen coding） 插件配置 >
" -----------------------------------------------------------------------------
" HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt

" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
"nmap <leader>il :IndentLinesToggle<CR>


" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
"let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'

" -----------------------------------------------------------------------------
"  < vim-javacompleteex（也就是 javacomplete 增强版）插件配置 >
" -----------------------------------------------------------------------------
" java 补全插件

" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 >
" -----------------------------------------------------------------------------
" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt

" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer 插件配置 >
" " -----------------------------------------------------------------------------
" " 快速浏览和操作Buffer
" " 主要用于同时打开多个文件并相与切换

" let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
" let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
" let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
" "                                            <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
" "                                            <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 >
" -----------------------------------------------------------------------------
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
" let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格

"Ctrl+/ 切换注释
nmap <silent> <C-_> :call NERDComment(0, "toggle")<CR>
vmap <silent> <C-_> :call NERDComment(0, "toggle")<CR>

" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
" 有目录村结构的文件浏览插件

" 常规模式下输入 F2 调用插件
nmap <F2> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif

" NerdTree {
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    "  map <C-e> <plug>NERDTreeTabsToggle<CR>
    "  map <leader>e :NERDTreeFind<CR>
    "  nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.o$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif
" }

" -----------------------------------------------------------------------------
"  <airline 插件配置>
" -----------------------------------------------------------------------------
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" -----------------------------------------------------------------------------
"  < repeat 插件配置 >
" -----------------------------------------------------------------------------
" 主要用"."命令来重复上次插件使用的命令

" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >
" -----------------------------------------------------------------------------
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀

" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 >
" -----------------------------------------------------------------------------
" 增强源代码浏览，其功能就像Windows中的"Source Insight"
"nmap <F3> :SrcExplToggle<CR>                "打开/闭浏览窗口

" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
" -----------------------------------------------------------------------------
" 用于增强C语法高亮

" 启用 // 注视风格
let c_cpp_comments = 0

" -----------------------------------------------------------------------------
"  < cpp_highlight 插件配置 >
" -----------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt

" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TlistClose<CR>:TagbarToggle<CR>

let g:tagbar_width=30                       "设置窗口宽度
"let g:tagbar_left=1                         "在左侧窗口中显示

" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
nmap tl :TagbarClose<CR>:Tlist<CR>

let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示

" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 >
" -----------------------------------------------------------------------------
" 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
"au BufRead,BufNewFile *.txt setlocal ft=txt

" -----------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 <c-w>o 在最大化与还原间切换

" -----------------------------------------------------------------------------
"  < EasyGrep 插件配置 >
" -----------------------------------------------------------------------------
" set default mode
let g:EasyGrepMode = 1 "search Buffer
let g:EasyGrepRecursive = 1 "recursive search all files
let g:EasyGrepWindowPosition = "bot"  "open quickfix window bottom

let g:EasyGrepCommand = 1 "don't use vimgrep
" apt-get install silversearcher-ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" -----------------------------------------------------------------------------
"  < vim-clang-format 插件配置 >
" -----------------------------------------------------------------------------
let g:clang_format#auto_format = 0
let g:clang_format#auto_formatexpr = 1

let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \ "ColumnLimit" : 0,
            \ "KeepEmptyLinesAtTheStartOfBlocks" : "true",
            \ "IndentCaseLabels" : "false",
            \ "BreakBeforeBraces" : "Linux",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
autocmd FileType c,cpp,objc map <buffer> = <Plug>(operator-clang-format)

" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

" autocmd FileType c,cpp ClangFormatAutoEnable

" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    "vertical  help cscope-options
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cst
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    " if filereadable("cscope.out")
        " cs add cscope.out
        " "否则添加数据库环境中所指出的
    " elseif $CSCOPE_DB != ""
        " cs add $CSCOPE_DB
    " endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
" set autochdir
"set tags=./tags,tags;~                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）
" map <C-F12> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>

func! Update_cscope()
    call system("make_cscope_db.sh -n")
    let ret = v:shell_error
    if ret == 0
        silent cs reset
        echo "update tags success!"
    else
        echo "update tags failed!"
    endif
endfunc

" Ctags {
" set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
" let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
" if gitroot != ''
    " let &tags = &tags . ',' . gitroot . '/.git/tags'
" set tags=./tags;/,~/.vimtags
" endif
" }

" -----------------------------------------------------------------------------
"  < gtags 工具配置 >
" -----------------------------------------------------------------------------
" set cscopetag " 使用 cscope 作为 tags 命令
" set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

" let GtagsCscope_Auto_Load = 1
" let CtagsCscope_Auto_Map = 1
" let GtagsCscope_Quiet = 1

" -----------------------------------------------------------------------------
" < neocomplete 补全插件>
" -----------------------------------------------------------------------------
if g:enable_neocomplete == 1
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=jedi#completions
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    " let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

" -----------------------------------------------------------------------------
"  < YouCompleteMe 插件配置 >
" -----------------------------------------------------------------------------
if g:enable_youCompleteMe == 1
    " Enable omni completion.
    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    "autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    "youcompleteme  默认tab  s-tab 和 ultisnips 冲突
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr> <CR> pumvisible() ? HackStopCompletion() : "\<CR>"

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

    " enable completion from tags
    "let g:ycm_collect_identifiers_from_tags_files = 1

    "let g:ycm_max_identifier_candidates = 10   "符号补全最大个数
    "let g:ycm_max_num_candidates = 10          "语义补全最大个数
    set pumheight=15

    " 静态代码检查
    let g:ycm_show_diagnostics_ui = 1
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 0

    let g:ycm_cache_omnifunc=0

    let g:ycm_use_ultisnips_completer = 1

    let g:ycm_seed_identifiers_with_syntax=1

    let g:ycm_collect_identifiers_from_comments_and_strings = 1

    " 在注释输入中也能补全
    let g:ycm_complete_in_comments = 1

    " 在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1

    "let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1

    " 加载.ycm_extra_conf.py文件时不提示警告
    let g:ycm_confirm_extra_conf = 0

    let g:ycm_always_populate_location_list = 1

    function! s:CustomizeYcmLocationWindow()
        " Move the window to the bottom of the screen.
        wincmd J
        " Set the window height.
        10wincmd _
        " Switch back to working window.
        wincmd p
    endfunction
    autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

    let g:ycm_filetype_blacklist = { 'tagbar': 1,
                                    \ 'nerdtree': 1,
                                    \ 'log': 1,
                                    \ 'txt': 1,
                                    \ }

    let g:ycm_server_python_interpreter = 'python3'

    "  fix .cpp error: ValueError: Still no compile flags, no completions yet.
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

    " Vim's autocomplete is excruciatingly slow
    " http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    "set complete-=i

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    let g:ycm_key_invoke_completion    = '<C-Z>'
    let g:ycm_key_detailed_diagnostics = '<leader>dd'
    autocmd FileType c,cpp,python nnoremap <buffer> <silent> <C-]>      :YcmCompleter GoToDefinitionElseDeclaration<CR>
    autocmd FileType c,cpp,python nnoremap <buffer> <silent> <leader>dc :YcmCompleter GetDoc<CR>
    autocmd FileType c,cpp        nnoremap <buffer> <silent> <leader>df :YcmCompleter FixIt<CR>
    autocmd FileType c,cpp        nnoremap <buffer> <silent> <leader>dp :YcmCompleter GetParent<CR>
    autocmd FileType c,cpp        nnoremap <buffer> <silent> <leader>dt :YcmCompleter GetType<CR>
endif

func! GenYcmConfig()
    if g:enable_youCompleteMe == 1 && exists(":YcmGenerateConfig") && !filereadable(".ycm_extra_conf.py")
        YcmGenerateConfig
    endif

    "if (filereadable("makefile") || filereadable("Makefile")) && executable("bear")>0
        "!bear "make"
    "endif
endfunc

func! RestartYcmServer()
    if g:enable_youCompleteMe == 1 && exists(":YcmRestartServer")
        silent YcmRestartServer
    endif
endfunc

" update tags
func! UpdateTags()
    call GenYcmConfig()
    call RestartYcmServer()
    if &filetype == 'c' || &filetype == 'cpp'
        call Update_cscope()
    endif
endfunc

nmap <silent> <F4> :call UpdateTags()<CR>

" -----------------------------------------------------------------------------
"  < UltiSnips  插件配置 >
" -----------------------------------------------------------------------------
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    let g:UltiSnipsListSnippets="<c-f>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    let g:UltiSnipsSnippetsDir='~/.vimrc_whr/mySnippets/UltiSnips'
    set rtp+=~/.vimrc_whr/mySnippets

" -----------------------------------------------------------------------------
" jedi python补全插件
" -----------------------------------------------------------------------------
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot           = 0
let g:jedi#popup_select_first     = 0
let g:jedi#completions_enabled    = 0

let g:jedi#goto_command           = ';d'
let g:jedi#completions_command    = ''

" -----------------------------------------------------------------------------
"  ale
" -----------------------------------------------------------------------------
let g:ale_pattern_options = {
            \'\.[ch]p\{0,2}$': {
            \           'ale_enabled': 0,
            \},
            \
            \'\.py$': {
            \           'ale_enabled': 1,
            \},
\}
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_sign_warning = '>>'
highlight clear ALEError
highlight clear ALEWarning
highlight clear ALEInfo


" -----------------------------------------------------------------------------
"  markdown
" -----------------------------------------------------------------------------
let g:vim_markdown_no_extensions_in_markdown = 1

" -----------------------------------------------------------------------------
" instant-markdown
" -----------------------------------------------------------------------------
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1

" -----------------------------------------------------------------------------
" Conque-GDB
" -----------------------------------------------------------------------------
let g:ConqueTerm_FastMode = 1
"let g:ConqueTerm_Color=2            " 1: strip color after 200 line, 2: always with color
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CloseOnEnd=1       " close conque when program ends running
let g:ConqueTerm_StartMessages=1    " display warning message if conqueTerm is configed incorrect"
let g:ConqueTerm_CWInsert = 1

let g:ConqueGdb_Leader = ';'
let g:ConqueGdb_SaveHistory = 1
let g:ConqueGdb_SrcSplit = 'left'
nnoremap <silent> ;Y :ConqueGdbCommand y<CR>
nnoremap <silent> ;N :ConqueGdbCommand n<CR>

