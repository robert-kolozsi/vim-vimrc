" File: .vimrc
" Author: Kolozsi Robert <kolozsi.robert@gmail.com>
" Date: Jan 28, 2013 (last modified)
" Setup collection.

" Automaticaly reloads my .vimrc file.
autocmd! bufwritepost .vimrc source %

set nocompatible " Not compatible with Vi!

syntax on
filetype on
filetype plugin on
filetype plugin indent on
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
            \	if &omnifunc == "" |
            \	 setlocal omnifunc=syntaxcomplete#Complete |
            \	endif
    endif

" <<leader>> key
let mapleader=","
let maplocalleader="\\"


" Selection stays while moving indentation.
vnoremap < <gv
vnoremap > >gv

" Show whitespace
" Must be inserted before the colorscheme command
augroup extra_white
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=89 guibg=#87005f
    au InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Undo stuff.
set history=1000
set undolevels=1000
set undofile
set undoreload=1000
set undodir=~/.vim/undodir

runtime macros/matchit.vim "This is for tag matching with '%'

"Seting $ sign while editing and things you changing
"set cpoptions+=$

"Setting the virtualedit mode
"set virtualedit all

set expandtab " Use spaces instad tab.
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround "" Don't understand yet for what is this for.

" Indentention
set autoindent
set smartindent

" Misc.
set cursorline
set encoding=utf-8
set modeline
set modelines=1
set showmode
set showcmd
set hidden
set ttyfast
" set backspace=indent,eol,start
set showmatch
set title
set ruler
set number
"set nonumber
"set norelativenumber
"set relativenumber
"set ignorecase
set smartcase
set scrolloff=3 " Cursor offset from screen sides.
set tw=79  " Width of document.

" Show tab and newlinel chars.
set list
set listchars=tab:→\ ,eol:⏎,extends:>,precedes:<

set linespace=0 " Number of pixel lines inserted between characters.
set shell=/bin/bash\ --login
" set lazyredraw
set matchtime=3
" set showbreak=-
set splitbelow
set splitright
"set fillchars=stl:^,stlnc:-,vert:\|,fold:~,diff:-
set fillchars=vert:\|,fold:~,diff:-
" set autowrite " When out of buffer write the file.
set autoread
set shiftround
set linebreak
set fileformat=unix " (&ffs)

set colorcolumn=+1  " Related to the 'tw' setting above.

"set nowrap "don't automatically wrap on load
set wrap
"set fo-=t " don't automatically wrap text when typing
"set visualbell
set linebreak

" Solarized colorscheme setup for terminal. {{{
"let g:solarized_termcolors=256
"set background=light
"set background=dark
"colorscheme solarized

" Personal color scheme settings.
set t_Co=256
colorscheme gandalf " xoria256
" }}}

" Search settings.
execute "normal! <silent> :nohlsearch\<cr>"
set hlsearch
set incsearch
"set ignorecase
set smartcase

" Swap and backup files.
" Creating backup and swap directories.
set backup
"set swapfile
set backupdir=./.backup,~/tmp
"set directory=./.swap,~/tmp
"set nobackup
"set nowritebackup
"set noswapfile

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=utf-8,ucs-bom,latin2
endif

" Folding settings
set foldmethod=marker "fold based on indent
"set foldmethod=indent "fold based on indent
"set foldmethod=manual "fold based on manual
set foldlevelstart=0 " When open new buffer fold everything.
set foldmarker={{{,}}}
set foldnestmax=10 "deepest fold is 10 levels
set foldenable "fold by default
set foldlevel=2
set foldcolumn=4

" Mini buffer explorer tab
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Taglist stuff
" to make tags file in current directory type:
" :!ctags -R *
let Tlist_Ctags_cmd="/use/bin/ctags"
let Tlist_WinWidth=50
let Tlist_Process_File_Always=1
nnoremap <F4> :TlistToggle<cr>
nnoremap <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" ### Mappings ###
" Insert mode mappings for braces and quote marks.
inoremap {{     {}<left>
inoremap {<cr>  {<cr>}<esc>O
inoremap [[     []<left>
inoremap ((     ()<left>
inoremap ""     ""<left>
inoremap ''     ''<left>

" HTML mappings.
inoremap <<      <><left>
inoremap </     </><left>
inoremap <i     <img src="" /><esc>3hi
inoremap <p     <p></p><esc>3hi
inoremap <d     <div></div><esc>5hi
inoremap <u     <u><cr></u><esc><Up>
inoremap <i     <i></i><esc>3hi
inoremap <in    <input type="" /><esc>3hi

" C, JavaScript comment mappings.
inoremap /*     /**/<Left><Left>
inoremap /*<cr> /*<cr>*/<Left><Left><Space>*<Space><cr><Up><Right><Right>
inoremap /**    /*

" Remap jk for getting in to the normal mode. <esc> is so far away.
inoremap kj <esc>

" In case I fall in to a temptation!
inoremap <esc> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" Have to restart vim if adding autocmd.
augroup code_commenting
    " First clear group to avoid duplication of autocmds!
    autocmd!
    " Then do the rest...
    autocmd FileType vim nnoremap <buffer> <localleader>c I"
    autocmd FileType c nnoremap <buffer> <localleader>c I//
    autocmd FileType cplusplus nnoremap <buffer> <localleader>c I//
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//
    autocmd FileType php nnoremap <buffer> <localleader>c I//
    autocmd FileType python nnoremap <buffer> <localleader>c I#
augroup END

augroup code_snipets
    autocmd!
    autocmd FileType python :inoremap <buffer> iff if :<left>
    autocmd FileType javascript :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType c :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType vim :inoremap <buffer>
                \ iff if <cr>endif<esc><up>A
augroup END

" Normal mode mapings.
" Tab mapings.
nnoremap ttn :tabnew<cr>
nnoremap ttd :tabclose<cr>
nnoremap <s-l> :tabnext<cr>
nnoremap <s-h> :tabprevious<cr>

" Move up the current line.
nnoremap <leader>- ddp
" Move down the current line.
nnoremap <leader>_ dd<up>P
" Put this line between two blank lines.
nnoremap <leader>= O<esc><down>o<esc><up>

" Map for quick open .vimrc file in a split window.
nnoremap <leader>rc :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap the word with single and double quote.
nnoremap <leader>w ea'<esc>bi'<esc>
nnoremap <leader>ww ea"<esc>bi"<esc>
" Wrap a whole line with the single and double quote.
nnoremap <leader>l I'<esc>A'<esc>
nnoremap <leader>ll I"<esc>A"<esc>
" Wrap the selection with single and double quote.
vnoremap <leader>s <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>ss <esc>`>a"<esc>`<i"<esc>

" Select entire buffer
nnoremap sa ggVG

" Seting up Pathogen for management of plugins.
call pathogen#infect()

" laststaus=0 -> never, =1 -> default (2 or more windows) and =2 -> always.
let g:Powerline_symbols="fancy"
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
nnoremap <leader>g :call RopeGotoDefinition()<cr>
let ropevim_enable_shortcuts=1
let g:pymode_breakpoint=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=1
let g:pymode_syntax_builtin_funcs=1
nnoremap <leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<c-c>

" Navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

" gandalf: turning on all python 2 options: (Jan 3, 2013)
let python_highlight_all = 1

" gandalf: turning on django syntax highlight.
let g:django_python = 1

augroup file_writing
    autocmd!
    " Save the file automatically if not exist
    autocmd BufNewFile * :write
    " Turn off line wrapping for html files.
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

" NERDTree show dot files.
" To toggle it on/off use I.
let NERDTreeShowHidden = 1

" vim-signature settings.
"let g:SignatureIncludeMarks='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:SignatureWrapJumps=1
"let g:SignatureMarkLeader="m"
"let g:SignatureLcMarkStr="\p\m"
"let g:SignatureUcMarkStr="\p\m"
"let g:SignaturePurgeConfirmation=0
"let g:SignatureDisableMenu=0
"let g:SignaturePeriodicRefresh=1

" vim: set tw=79 colorcolumn=+1: