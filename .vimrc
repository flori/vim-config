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
set clipboard=unnamed
"set textwidth=80
set clipboard=unnamed
set dictionary=/usr/dict/words dictionary+=/usr/share/dict/words
set nodigraph
set encoding=utf8
set errorfile=/tmp/errors.err
set errorformat+=%f:%l
set expandtab shiftwidth=2 tabstop=2
set foldcolumn=0
set formatoptions=cqrt
set fsync
set hidden
set history=1000
set hlsearch
set laststatus=2
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
set shell=bash
set shortmess=atI
set showcmd
set showmatch
set showmode
set smarttab
set statusline=\ ☠\ %<%f\ ⚐\ %y%m%r%*\ ❑\ %n%=✎\ %(%l:%c\%)\ ⇨\ %P
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
    set undodir=$TMP/vim-$USER
  else
    set undodir=/tmp/vim-$USER
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
  elseif has("x11")
    set guifont=-b&h-lucidatypewriter-*-*-normal-*-17-*-*-*-*-*-iso10646-*
    if exists("+guioptions")
      set guioptions-=T
      set guioptions-=m
    end
  end
  set lines=999
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

let g:Tlist_WinWidth=70

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
map <leader>t :TlistToggle<CR>
map <leader>T :tabe <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>v :vsplit <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>V :call CcheckSyntax()<CR>
map <leader>c :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>h :call Csymbolhash()<CR>
map <leader>H :%call Csymbolhash()<CR>
map <leader>C :call Ccamelunderscore()<CR>
map <leader>f :!echo %\|reattach-to-user-namespace pbcopy<CR>
map <silent> <leader>y :w !reattach-to-user-namespace pbcopy<CR><CR>
map <leader>n :new <cfile><CR>
map <silent> <leader>q :call CtoggleList("Quickfix List", 'c')<CR>
map <silent> <leader>Q :call CtoggleList("Location List", 'l')<CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>b :cexpr system("bundle exec ~/scm/utils/bin/brakeman2err")<CR>:copen<CR>
map <silent> <leader>B :cexpr system("bundle exec ~/scm/utils/bin/brakeman2err -c")<CR>:copen<CR>

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! CtoggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! CprobeLine(...)
  execute 'w'
  if &filetype == 'cucumber'
    call system(join([ 'probe', '-t', 'cucumber', '-c', join([ expand('%'), line('.') ], ':') ], ' ') . ' &')
  else
    call system(join([ 'probe', '-c', join([ expand('%'), line('.') ], ':') ], ' ') . ' &')
  endif
endfunction

function! Cprobe(...)
  execute 'w'
  if &filetype == 'cucumber'
    call system('probe -c -t cucumber ' . expand('%') . ' &')
  else
    call system('probe -c ' . expand('%') . ' &')
  endif
endfunction

map <leader>p :silent w<CR>:call CprobeLine()<CR>
map <leader>P :silent w<CR>:call Cprobe()<CR>
map <leader>l :silent w<CR>:call system('irb_connect -l ' . expand('%') . ' &')<CR>
map <leader>L :silent w<CR>:call system('irb_connect -e "reload!"')<CR>
map <leader>E :call Cirb_eval()<CR>
map <leader>g :call Cgrep()<CR>
map <leader>d :call Cremove()<CR>
map <leader>D :call Cremove('force')<CR>
map <leader>/ :let @/=''<CR>
map K :Grep <cword><CR>

" Switch of search highlighting
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
  " au GUIEnter * set fullscreen
end

" Switch Windows
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_

" Switch Buffers
map <C-l> <ESC>:bn<CR>
map <C-h> <ESC>:bp<CR>

" Don't use these for navigation navigation keys
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

" Navigate command line
cnoremap <C-0> <Home>
cnoremap <C-^> <Home>
cnoremap <C-$> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Moving text objects left and right
vnoremap < <gv
vnoremap > >gv

" Marks switch them
nnoremap ' `
nnoremap ` '

" yank to eol similar to D
map Y y$

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
    autocmd FileType tex map <buffer> <F1> <ESC>:silent !latex %<CR>
    autocmd FileType tex map <buffer> <F2> <ESC>:silent !dvips `echo %\|sed -e 's/tex/dvi/'`<CR>
    autocmd FileType tex map <buffer> <F3> <ESC><F1>:!xdvi -s 0 `echo %\|sed -e 's/tex/dvi/'` &<CR>
    autocmd FileType tex map <buffer> <F4> <ESC><F1><F2>:silent !gv `echo %\|sed -e 's/tex/ps/'` &<CR>
    autocmd FileType tex map <buffer> <F5> <ESC>:silent !pdflatex %<CR>
    autocmd FileType tex map <buffer> <F6> <ESC><F1>:silent !acroread `echo %\|sed -e 's/tex/pdf/'`<CR>
  augroup END

  augroup c
    autocmd!
    autocmd FileType c setl sw=4 ts=4 cinoptions= formatoptions=cqrol cindent
    autocmd FileType c map <buffer> <F1> <ESC>:make<CR>
    autocmd FileType c map <buffer> <F2> <ESC>:silent %!indent 2>/dev/null -kr -i 4<CR>
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
    autocmd FileType ruby setl et sw=2 ts=2 autoindent
    autocmd FileType ruby setl suffixesadd=.rb,.h,.c
    autocmd FileType ruby setl path+=ext/**
    autocmd FileType ruby setl path+=lib/**
    autocmd FileType ruby setl path+=test/**
    autocmd FileType ruby setl path+=tests/**
    autocmd FileType ruby setl path+=spec/**
    autocmd BufWritePre *.rb,*.rake call CstripSpaces()
    autocmd BufWritePost *.rb,*.rake call CcheckSyntax()
  augroup END

  augroup javascript
    autocmd!
    autocmd BufNewFile,BufRead *.json setl filetype=javascript
    autocmd FileType javascript setl et sw=2 ts=2 cindent
    autocmd BufWritePre *.rb,*.rake call CstripSpaces()
    autocmd BufWritePost *.js call CcheckSyntax()
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
    autocmd FileType xml map <buffer> <F2> <ESC>:silent %!tidy -xml -raw -i 2>/dev/null<CR>
  augroup END

  augroup html
    autocmd!
    autocmd FileType xml setl et sw=2 ts=2 autoindent
    autocmd FileType html map <buffer> <F1> <ESC>:w<CR><ESC>:!tidy -e %<CR>
    autocmd FileType html map <buffer> <F2> <ESC>:silent %!tidy -wrap 72 -iu 2>/dev/null<CR>
  augroup END

  augroup ino
    autocmd!
    autocmd BufNewFile,BufRead *.ino setl filetype=c
    autocmd FileType ino setl et sw=2 ts=2 autoindent
  augroup END

  augroup html2
    autocmd!
    autocmd BufReadPre,FileReadPre *.html.* map <buffer> <F1> <ESC>:w<CR><ESC>:!tidy -e %<CR>
    autocmd BufReadPre,FileReadPre *.html.* map <buffer> <F2> <ESC>:silent %!tidy -wrap 72 -iu 2>/dev/null<CR>
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

  au! BufRead,BufNewFile *.rl   set filetype=ragel
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
    let pattern = getreg('"')
    if pattern == ""
      let pattern = getreg('/')
    endif
    let pattern = input("Grep? ", pattern)
    if pattern =~ '^ *$'
      errecho "No search pattern specified!"
      return
    endif
    let args = [ pattern ]
  else
    let args = copy(a:000)
  end

  let args_string = join(map(copy(args), 'shellescape(v:val)'), ' ')
  echo 'Grepping ' . args_string . '...'
  set grepformat=%f:%l
  set grepprg=search
  set hlsearch
  let @/=args[0]
  let @"=''
  silent execute "silent gr -i -c " . args_string
  copen
  redraw!
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
  silent w
  let name = expand('<cword>')
  let output = system('classify -t ' . name)
  execute "silent normal ciw" . output
endfunction

function! Csymbolhash() range
  execute join([ 'silent ', a:firstline, ',', a:lastline, 's/\([^:]\):\([^:=!', "'", '" ]\{1,\}\) *=>/\1\2:/g' ])
endfunction

function! CcreateTags()
  call system("bundle exec create_tags &")
endfunction

function! PrintGivenRange() range
    echo "firstline ".a:firstline." lastline ".a:lastline
    " Do some more things
endfunction

function! Cedit(...)
  let args = copy(a:000)
  call system("edit -m " . join(map(copy(args), 'shellescape(v:val)'), ' ') . ' &')
endfunction

function! Cremove(...)
  let answer = input('Really delete "' . expand('%') . '" (y/n)? ')
  if answer =~ "^[Yy]"
    call system('rm -f ' . expand('%p'))
    if a:0 == 1 && a:1 == 'force'
      bd!
    endif
    redraw!
    echo 'Done.'
  else
    redraw!
  endif
endfunction

function! CcheckSyntax(...)
  if a:0 == 1
    let file = expand(a:1)
  else
    silent w
    let file = expand('%')
  endif
  if &filetype == 'ruby'
    call system("ruby -c " . file . " 2>/tmp/errors.err") " check errors
    if v:shell_error == 0
      call system("ruby -wc " . file . " 2>/tmp/errors.err") " check warnings
      if v:shell_error == 0
        redraw
        echo "Syntax: 👍"
        "echo "Syntax: ✓"
      else
      lf! "/tmp/errors.err"
      endif
    else
      lf! "/tmp/errors.err"
    end
  elseif &filetype == 'javascript'
    call system("jsl -process " . file . " >/tmp/errors.err")
    if v:shell_error == 0
      redraw
      echo "Syntax: 👍"
      "echo "Syntax: ✓"
    else
      lf! "/tmp/errors.err"
    end
  end
endfunction

function! CstripSpaces(...)
  let oldpos = getpos(".")
  silent :%s/\s*$//
  call setpos('.', oldpos)
endfunction

function! Cirb_eval()
  y
  call system("irb_connect -e '" . getreg('"') . "' &")
endfunction

command! -bar -nargs=1 OpenURL :!open <args>
command! -bar -nargs=* -complete=file Find call Cfind(<f-args>)
command! -bar -nargs=* -complete=file Grep call Cgrep(<f-args>)
command! -bar -nargs=* -complete=file Classify call Cclassify(<f-args>)
command! -bar -nargs=* -complete=file PathClassify call CpathClassify(<f-args>)
command! -bar -nargs=* -complete=file Declassify call Cdeclassify(<f-args>)
command! CreateTags call CcreateTags()
command! -range Symbolhash <line1>,<line2>call Csymbolhash()
command! -range PrintGivenRange <line1>,<line2>call PrintGivenRange()
command! -nargs=* -complete=file Edit call Cedit(<f-args>)

function! Iexec(cmd)
  let output = system(a:cmd)
  execute "normal a" . output
endfunction

function! Itime(fmt)
  execute "normal a" . strftime(a:fmt)
endfunction

" Abbreviations
iabclear
iabbrev I_MFG Mit freundlichen Grüssen<CR><CR>Florian Frank
iabbrev I_DATE <ESC>:call Itime("%F")<CR>
iabbrev I_DATETIME <ESC>:call Itime("%F %T")<CR>
iabbrev I_TIME <ESC>:call Itime("%T")<CR>
iabbrev I_CLASS <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_KLASS <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_MODULE <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_PATH_KLASS <ESC>:call Iexec("classify " . expand('%'))<CR>
iabbrev I_CODE # encoding: utf-8
iabbrev I_ENCODE # encoding: utf-8
