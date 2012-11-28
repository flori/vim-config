" Flori's vimrc

" General Settings
"set autochdir
"set wildmode=list:full
set autoindent
set autowrite
set backspace=indent,eol,start
if exists('&colorcolumn')
  set colorcolumn=79
end
set textwidth=80
set dictionary=/usr/dict/words
set nodigraph
set encoding=utf8
set errorformat+=%f:%l
set expandtab shiftwidth=2 tabstop=2
set foldcolumn=0
set formatoptions=cqrt
set fsync
set hidden
set history=1000
set hlsearch
set laststatus=2
set makeprg=errf
set modelines=5
set mousehide
set mouse=nv
set nocindent
set nocompatible
set nocursorcolumn
set nocursorline
set nofoldenable
set noignorecase
set noincsearch
set nojoinspaces
set nopaste
set nosmartcase
set nosmartindent
set nowrap
set number
set ruler
set shortmess=atI
set showcmd
set showmatch
set showmode
set smarttab
set statusline=%<%f%m%r%=%(%Bh=%bd%)@%(%l:%c\%)%4P
set swapsync="fsync"
set termencoding=utf8
set tildeop
set title
set ttyfast
set viminfo='20,<50,s10,h,!
set visualbell t_vb=
set wildchar=<TAB>
set wildmenu
set winminheight=0
if has("persistent_undo")
  set undofile
  if has("win32") || has("win64")
    set undodir=$TMP
  else
    set undodir=/tmp
  end
end
if has("win32") || has("win64")
  set directory=$TMP
else
  set directory=/tmp
end

filetype on
filetype indent on
filetype plugin on
source $VIMRUNTIME/macros/matchit.vim
set t_Co=256
colorscheme flori

" Configure GUIs
if has("gui_running")
  set guipty
  hi Pmenu ctermbg=Grey guibg=DarkGrey
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
  if exists("+guioptions")
    set guioptions+=c
  end
  if has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h12
    "set antialias
    if exists("+guioptions")
      set guioptions-=T
      set guioptions-=m
      set guioptions+=p
    end
  elseif has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 12
    if exists("+guioptions")
      set guioptions-=T
      set guioptions-=m
      set guioptions+=p
    end
    set guiheadroom=0
    set columns=80
    set lines=59
  elseif has("gui_mac") || has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono:h14
    if exists("+guioptions")
      set guioptions-=T
      set guioptions-=m
      set guioptions+=p
    end
    set antialias
    set guiheadroom=0
    "set macatsui
    set columns=160
    set lines=86
  elseif has("x11")
    set guifont=-b&h-lucidatypewriter-*-*-normal-*-17-*-*-*-*-*-iso10646-*
    if exists("+guioptions")
      set guioptions-=T
      set guioptions-=m
    end
  end
else
  hi DiffAdd ctermbg=green
  hi DiffChange ctermbg=blue
  hi DiffText ctermbg=gray
  hi DiffDelete  ctermbg=red
end

" Syntax
let ruby_operators=1
if has("syntax")
  syntax on
end

" Browsing
if has("browse")
  let g:explVertical=0
  " let g:explSplitRight=1
  let g:explSplitBelow=0
  " let g:explStartRight=0
  let g:explStartBelow=1
  let g:explDetailedList=1
  let g:explDateFormat="%Y-%m-%d %H:%M:%S"
  " let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'
  let g:explUseSeparators=1    " Use separator lines
end

let g:netrw_longlist=1
let g:netrw_use_noswf= 0
let g:netrw_hide=1
let g:netrw_list_hidee='\..*\.sw[pon]$'

let g:rails_statusline=0

" CScope
if has("cscope")
"  set csprg=/usr/local/bin/cscope
  set cscopetagorder=0
  set cscopetag
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  end
  set csverb
end

" Mappings
let mapleader=","
let maplocalleader=","
" open another file in this files directory
map <leader>e :e <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>n :call Cnavigate()
map <leader>t :tabe <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>c :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>h :call Csymbolhash()<CR>
map <leader>H :%call Csymbolhash()<CR>
map <leader>C :call Ccamelunderscore()<CR>
map <leader>f :!echo %\|pbcopy<CR><CR>
map <leader>n :new <cfile><CR>

" Switch of search highlighting
map <silent> <F9> :nohlsearch<CR>
if has("fullscreen")
  set fuoptions=maxhorz,maxvert
  function! Cfullscreen()
    if &fullscreen == "1"
      set nofullscreen
    else
      set fullscreen
    end
  endfunction
  map <silent> <F11> :call Cfullscreen()<CR>
  if has("gui_mac")  || has("gui_macvim")
    map <silent> <D-Enter> :call Cfullscreen()<CR>
  end
  "au GUIEnter * set fullscreen
end
function! Ctoggle()
  if &buftype == "quickfix"
    cclose
  else
    copen
  end
endfunction
nnoremap <silent> <F12> :call Ctoggle()<CR>

" Switch Windows
map <A-j> <C-W>j<C-W>_
map ∆ <C-W>j<C-W>_
map <A-k> <C-W>k<C-W>_
map ˚ <C-W>k<C-W>_
" Switch Buffers
map <A-l> <ESC>:bn<CR>
map ¬ <ESC>:bn<CR>
map <A-h> <ESC>:bp<CR>
map ˙ <ESC>:bp<CR>
map <A-=> <C-W>=
map ≠ <C-W>=
map <A-,> <C-W>+
map ≥ <C-W>+
map <A-.> <C-W>-
map ≤ <C-W>-

" Configure navigation keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Ins> <Nop>
noremap <End> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
cnoremap <C-0> <Home>
cnoremap <C-^> <Home>
cnoremap <C-$> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
vnoremap < <gv
vnoremap > >gv
" Marks
nnoremap ' `
nnoremap ` '

if has("autocmd")
  " Auto Command - Hooks
  augroup gzip
    autocmd!
    autocmd BufReadPre,FileReadPre *.gz setl bin
    autocmd BufReadPost,FileReadPost *.gz '[,']!gzip -d
    autocmd BufReadPost,FileReadPost *.gz setl nobin
    autocmd BufReadPost,FileReadPost *.gz execute ":doautocmd BufReadPost " . expand("%:r")
    autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
    autocmd FileAppendPre *.gz !gzip -d <afile>
    autocmd FileAppendPre *.gz !mv <afile>:r <afile>
    autocmd FileAppendPost *.gz !mv <afile> <afile>:r
    autocmd FileAppendPost *.gz !gzip <afile>:r
  augroup END

  augroup bzip2
    autocmd!
    autocmd BufReadPre,FileReadPre *.bz2 setl bin
    autocmd BufReadPost,FileReadPost *.bz2 '[,']!bzip2 -d
    autocmd BufReadPost,FileReadPost *.bz2 setl nobin
    autocmd BufReadPost,FileReadPost *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")
    autocmd BufWritePost,FileWritePost *.bz2 !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost *.bz2 !bzip2 <afile>:r
    autocmd FileAppendPre *.bz2 !bz2ip -d <afile>
    autocmd FileAppendPre *.bz2 !mv <afile>:r <afile>
    autocmd FileAppendPost *.bz2 !mv <afile> <afile>:r
    autocmd FileAppendPost *.bz2 !bzip2 -d <afile>:r
  augroup END

  augroup tex
    autocmd!
    autocmd FileType tex map <buffer> <F1> <ESC>:!latex %<CR><CR>
    autocmd FileType tex map <buffer> <F2> <ESC>:!dvips `echo %\|sed -e 's/tex/dvi/'`<CR><CR>
    autocmd FileType tex map <buffer> <F3> <ESC><F1>:!xdvi -s 0 `echo %\|sed -e 's/tex/dvi/'` &<CR><CR>
    autocmd FileType tex map <buffer> <F4> <ESC><F1><F2>:!gv `echo %\|sed -e 's/tex/ps/'` &<CR><CR>
    autocmd FileType tex map <buffer> <F5> <ESC>:!pdflatex %<CR><CR><CR>
    autocmd FileType tex map <buffer> <F6> <ESC><F1>:!acroread `echo %\|sed -e 's/tex/pdf/'`<CR><CR>
  augroup END

  augroup c
    autocmd!
    autocmd FileType c setl sw=4 ts=4 cinoptions= formatoptions=cqrol cindent
    autocmd FileType c map <buffer> <F1> <ESC>:make<CR>
    autocmd FileType c map <buffer> <F2> <ESC>:%!indent 2>/dev/null -kr -i 4<CR><CR>
    autocmd FileType c map <buffer> <F3> <ESC>:make clean<CR>
    autocmd FileType c map <buffer> <F4> <ESC><Home>i/* <ESC><End>a */<ESC>
  augroup END

  augroup pascal
    autocmd!
    autocmd FileType pascal setl et st=2 sw=2 autoindent
    autocmd FileType pascal map <buffer> <F1> <ESC>:!gpc -o `echo %\|sed -e 's/\.pas//'` %<CR>
    autocmd FileType pascal map <buffer> <F4> <ESC><Home>i{ <ESC><End>a }<ESC>
  augroup END

  augroup perl
    autocmd!
    autocmd Filetype perl setl et sw=4 ts=4 autoindent
    autocmd FileType perl map <buffer> <F1> <ESC>:w<CR><ESC>:!perl -c %<CR>
    autocmd FileType perl map <buffer> <F2> <ESC>:w<CR><ESC>:!perl -Tc %<CR>
    autocmd FileType perl map <buffer> <F3> <ESC>:w<CR><ESC>:.!perl -lne '/^(sub\s+\S+\s*\([^)]*\))\s*\{/ and print "$1;"' %<CR>
    autocmd FileType perl map <buffer> <F4> <ESC>:w<CR><ESC>:%!perl -pe 's/(sub \w+ *)\(.*\) */$1/'<CR>
    autocmd FileType perl map <buffer> <F5> <ESC><Home>i#<ESC>
    autocmd FileType perl map <buffer> <F6> <ESC>:w<CR><ESC>:!perl -I lib -I cfg %<CR>
  augroup END

  augroup ruby
    autocmd!
    autocmd FileType ruby setl et sw=2 ts=2 autoindent keywordprg=ri\ --no-pager
    autocmd FileType ruby map <buffer> <F1> <ESC>:w<CR><ESC>:!RUBYOPT="$RUBYOPT -Iext:lib:test:tests" ruby -wc %<CR>
    autocmd FileType ruby map <buffer> <F2> <ESC>:w<CR><ESC>:!RUBYOPT="$RUBYOPT -Iext:lib:test:tests" ruby % \| ruby -S decolor<CR>
    autocmd FileType ruby map <buffer> <F3> <ESC>:w<CR><ESC>:!rcov -Iext:lib:test:tests %<CR>
    autocmd FileType ruby map <buffer> <F4> <ESC><Home>i#<ESC>
    autocmd FileType ruby map <buffer> <silent> <F5> !xmp ruby<cr>
    autocmd FileType ruby nmap <buffer> <silent> <F5> V<F5>
    autocmd FileType ruby imap <buffer> <silent> <F5> <ESC><F5>a
    autocmd FileType ruby map <buffer> <silent> <F6> <ESC>:w<CR><ESC>:%!xmp ruby -Iext:lib -w<CR>
    autocmd FileType ruby map <buffer> <silent> <F7> <ESC>:w<CR><ESC>:%!RUBYOPT="" xmp /usr/local/ruby-1.9/bin/ruby -Iext:lib -w <CR>
    autocmd FileType ruby map <buffer> <silent> <F8> <ESC>:!exuberant-ctags 2>/dev/null -R .<CR>
    autocmd FileType ruby setl suffixesadd=.rb,.h,.c
    autocmd FileType ruby setl path+=lib/**
    autocmd FileType ruby setl path+=test/**
    autocmd FileType ruby setl path+=tests/**
    autocmd FileType ruby setl path+=spec/**
  augroup END

  augroup javascript
    autocmd!
    autocmd BufNewFile,BufRead *.json setl filetype=javascript
    autocmd FileType javascript setl et sw=2 ts=2 cindent
  augroup end

  augroup java
    autocmd!
    autocmd FileType java setl cindent et sw=4 ts=4
    autocmd FileType java map <buffer> <F1> <ESC>:w<CR>:!javac -deprecation %<CR>
    autocmd FileType java map <buffer> <F2> <ESC>:w<CR>:!javac %<CR>
    autocmd FileType java map <buffer> <F3> <ESC>:!rm `echo %\|sed -e 's/java/class/'`<CR>
    autocmd FileType java map <buffer> <F4> <ESC><Home>i//<ESC>
    autocmd FileType java map <buffer> <F5> <ESC>:w<CR><ESC>:!astyle -j %<CR>:n %<CR>
    autocmd FileType java nnoremap <buffer> <silent> <F8> :JavaBrowser<CR>
    autocmd FileType java let JavaBrowser_Ctags_Cmd = '/usr/bin/exuberant-ctags'
    autocmd FileType java let JavaBrowser_Sort_Type = "name"
    autocmd FileType java let JavaBrowser_Display_Prototype = 1
    autocmd FileType java let JavaBrowser_Use_SingleClick = 0
  augroup END

  augroup lisp
    autocmd!
    autocmd FileType lisp setl lisp autoindent
  augroup END

  augroup scheme
    autocmd!
    autocmd FileType scheme setl lisp autoindent
  augroup END

  augroup ocaml
    autocmd!
    autocmd FileType ocaml setl et sw=2 ts=2 autoindent
  augroup END

  augroup xml
    autocmd!
    autocmd BufNewFile,BufRead *.jsf,*.jsp,*.babel,*.konfetti,*.tag,*.tld setl filetype=xml
    autocmd FileType xml setl et sw=2 ts=2 autoindent
    autocmd FileType xml map <buffer> <F1> <ESC>:w<CR><ESC>:!tidy -xml -raw -e %<CR>
    autocmd FileType xml map <buffer> <F2> <ESC>:%!tidy -xml -raw -i 2>/dev/null<CR><CR>
  augroup END

  augroup html
    autocmd!
    autocmd FileType xml setl et sw=2 ts=2 autoindent
    autocmd FileType html map <buffer> <F1> <ESC>:w<CR><ESC>:!tidy -e %<CR>
    autocmd FileType html map <buffer> <F2> <ESC>:%!tidy -wrap 72 -iu 2>/dev/null<CR><CR>
  augroup END

  augroup html2
    autocmd!
    autocmd BufReadPre,FileReadPre *.html.* map <buffer> <F1> <ESC>:w<CR><ESC>:!tidy -e %<CR>
    autocmd BufReadPre,FileReadPre *.html.* map <buffer> <F2> <ESC>:%!tidy -wrap 72 -iu 2>/dev/null<CR><CR>
    autocmd BufReadPre,FileReadPre *.html.* so $VIMRUNTIME/syntax/html.vim
  augroup END

  augroup misc
    autocmd!
    autocmd BufWritePost ~/.vimrc so ~/.vimrc
  augroup END

  augroup mutt
    autocmd!
    autocmd BufNewFile,BufRead mutt-* setl textwidth=72
  augroup END
end

function! Cfind(...)
  redraw
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let args_string = join(map(copy(args), 'shellescape(v:val)'), ' ')
  echo 'Finding ' . args_string . '...'
  set grepformat=%f
  set grepprg=discover
  let @/=args[0]
  silent execute "silent gr -a 'a-zA-Z0-9' -c -i " . args_string
  copen
  redraw!
endfunction

function! Cgrep(...)
  redraw
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let args_string = join(map(args, 'shellescape(v:val)'), ' ')
  echo 'Grepping ' . args_string . '...'
  set grepformat=%f:%l
  set grepprg=search
  set hlsearch
  let @/=args[0]
  silent execute "silent gr -c " . args_string
  copen
  redraw!
endfunction

function! Ctest(...)
  execute 'w'
  if a:0 == 0
    let name = expand('<cword>')
  else
    let name = a:1
  end
  execute 'make ' . expand('%') . ' ' . name
endfunction

function! Cclassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -b " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! CpathClassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! Cdeclassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -s -d " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! Ccamelunderscore(...)
  execute 'w'
  let name = expand('<cWORD>')
  let output = system('classify -t ' . name)
  execute "normal ciW" . output
endfunction

function! Csymbolhash() range
  execute join([ 'silent ', a:firstline, ',', a:lastline, 's/\([^:]\):\([^:=!', "'", '" ]\{1,\}\) *=>/\1\2:/g' ])
endfunction

function! Cnavigate()
  let where = input("Goto? ")
  call system("edit " . where)
endfunction

function! Ccreatetags()
  call system("bundle execute create_tags")
endfunction

function! PrintGivenRange() range
    echo "firstline ".a:firstline." lastline ".a:lastline
    " Do some more things
endfunction

command! -bar -nargs=1 OpenURL :!open <args>
command! -bar -nargs=* -complete=file Find call Cfind(<f-args>)
command! -bar -nargs=* -complete=file Grep call Cgrep(<f-args>)
command! -bar -nargs=* -complete=file Test call Ctest(<f-args>)
command! -bar -nargs=* -complete=file Classify call Cclassify(<f-args>)
command! -bar -nargs=* -complete=file PathClassify call CpathClassify(<f-args>)
command! -bar -nargs=* -complete=file Declassify call Cdeclassify(<f-args>)
command! Createtags call Ccreatetags()
command! -range Symbolhash <line1>,<line2>call Csymbolhash()
command! -range PrintGivenRange <line1>,<line2>call PrintGivenRange()

function! Iexec(cmd)
  let output = system(a:cmd)
  execute "normal a" . output
endfunction

function! Itime(fmt)
  execute "normal a" . strftime(a:fmt)
endfunction

" Abbreviations
iabclear
iabbrev I_MFG Mit freundlichen Grüssen,<CR><CR>Florian Frank
iabbrev I_DATE <ESC>:call Itime("%F")<CR>
iabbrev I_DATETIME <ESC>:call Itime("%F %T")<CR>
iabbrev I_TIME <ESC>:call Itime("%T")<CR>
iabbrev I_CLASS <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_KLASS <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_MODULE <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_PATH_KLASS <ESC>:call Iexec("classify " . expand('%'))<CR>
iabbrev I_ENCODE # encoding: utf-8