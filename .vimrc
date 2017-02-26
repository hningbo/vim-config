" vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NerdTree use <F2>
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
map <F2> :NERDTreeToggle<CR>

" Taglist  use <F3>
Bundle 'taglist.vim'
let Tlist_Auto_Update=1
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=0
let Tlist_Exit_OnlyWindow=1
map <F3> :TlistToggle<CR>


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" vundle

color molokai     " set the backgound
syntax on      " set the grammer highlight
set smarttab	" use tab in the beginning of a new line
set ts=4	" set the tab = 4 space
set autoindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nu
set hlsearch
set backspace=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "	show the status line  
set laststatus=2    " (2):always show the status line
let g:molokai_original = 1
let g:rahash256 = 1
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
filetype on	" detact the file type
filetype plugin on	" load the file type plugin
filetype indent on	" load relative indent plugin for special file type
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
func! SetTitle() 
    "如果文件类型为.sh文件 
	if &filetype == 'sh' 
        call setline(1,"#------------") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: rylynn")  
        call append(line(".")+2, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+3, "\#------------") 
        call append(line(".")+4, "\#!/bin/bash") 
        call append(line(".")+5, "") 
    elseif &filetype == 'python'
        call setline(1,"#------------") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: rylynn")  
        call append(line(".")+2, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+3, "#------------")
	call append(line(".")+4 ,"")	
	else
        call setline(1, "/-------------") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: rylynn")  
        call append(line(".")+2, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+3, "/------------") 
        call append(line(".")+4, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+5, "#include<iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
    endif
	if &filetype == 'c'
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    endif
    exec ":$"
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keyboard
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
vnoremap # I#<Esc>
" fold setting
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

let mapleader = ","
nmap <leader>w :w!<cr>
"C，C++, python ,java F5 compile and run
map <F5> :call CompileRun()<CR>
inoremap <F5> <Esc>:call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
	elseif &filetype == 'python'
		exec "!python %"
    endif
endfunc
