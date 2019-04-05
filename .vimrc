" Flori's vimrc

" General Settings
set autoindent
set autowrite
set backspace=indent,eol,start
set backupskip=/tmp/*,/private/tmp/*
set clipboard=unnamed
set complete=.,w,b,u,t
set dictionary=/usr/dict/words dictionary+=/usr/share/dict/words
set encoding=utf8
set errorfile=/tmp/errors.err
set errorformat+=%E%f:%l
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
set mouse=nv
set mousehide
set nocindent
set nocompatible
set nocursorcolumn
set nocursorline
set nodigraph
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
set shortmess=atIO
set showcmd
set showmatch
set showmode
set smarttab
set splitbelow
set splitright
set statusline=\ ☠\ %<%f\ ⚐\ %y%m%r%*\ ❑\ %n%=✎\ %(%l:%c\%)\ ⇨\ %P
set tags=./tags,tags
set termencoding=utf8
set tildeop
set title
set ttyfast
set viminfo='20,<50,s10,h,!
set visualbell t_vb=
set wildchar=<TAB>
set wildmenu
set wildmode=full
set winminheight=0
set wrap

if exists('&colorcolumn')
  set colorcolumn=79
end
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
set t_Co=256
colorscheme flori

source $VIMRUNTIME/macros/matchit.vim

if has("syntax")
  syntax on
end
hi DiffAdd ctermfg=white ctermbg=22
hi DiffChange ctermfg=white ctermbg=202
hi DiffText ctermfg=52 ctermbg=166
hi DiffDelete ctermfg=white ctermbg=88
let g:vim_json_syntax_conceal=0

" Tweaks
let g:go_version_warning=0

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

let g:netrw_banner=0
let g:netrw_longlist=1
let g:netrw_use_noswf= 0
let g:netrw_hide=1
let g:netrw_list_hide='\..*\.sw[pon]$'

let g:rails_statusline=0

let g:Tlist_WinWidth=70

let g:go_version_warning = 0
let g:go_def_mode='godef'

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

let g:pathogen_blacklist = []
"call add(g:pathogen_blacklist, 'vim-go')

execute pathogen#infect()
execute pathogen#helptags()

" Mappings
let mapleader=","
let maplocalleader=","
" open another file in this files directory
map <leader>e :e <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>T :tabe <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>v :vsplit <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>c :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>n :new <cfile><CR>
vnoremap <leader>b c<C-R>=system('base64', @")<CR><ESC>
vnoremap <leader>B c<C-R>=system('base64 -D', @")<CR><ESC>
" Depending on my own tools
map <leader>t :TlistToggle<CR>
map <leader>V :call CheckSyntax()<CR>
map <leader>h :call Symbolhash()<CR>
map <leader>H :%call Symbolhash()<CR>
map <leader>o :!discover -se<CR>
map <leader>O :!discover -sre<CR>
map <leader>C :call CamelUnderscore()<CR>
map <leader>f :!echo %\|pbcopy<CR>
map <leader>y :w !pbcopy<CR><CR>
map <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
map <silent> <leader>Q :call Errors()<CR>
map <silent> <leader>w :call ToggleList("Location List", 'l')<CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <leader>p :silent w<CR>:call ProbeLine()<CR>
map <leader>P :silent w<CR>:call Probe()<CR>
map <leader>c :call ProbeToggleCoverage()<CR>
map <leader>l :silent w<CR>:call system('irb_connect -l ' . expand('%') . ' &')<CR>
map <leader>L :silent w<CR>:call system('irb_connect -e "reload!"')<CR>
map <leader>E :call IrbEal()<CR>
map <leader>g :call Grep()<CR>
map <leader>d :call Remove()<CR>
map <leader>D :call Remove('force')<CR>
map <leader>/ :let @/=''<CR>
map <leader>a :call AnsibleDecrypt()<CR>
map <leader>G :call Grep(expand('<cword>'))<CR>

" Functions

function! SetPath()
  if !filereadable('.utilsrc')
    set path+=**
  else
    let output = system("discover -D")
    if v:shell_error == 0
      let lines = split(output, '\n')
      for line in lines
        execute 'set path+=' . line . '**'
      endfor
    else
      set path+=**
    endif
  endif
endfunction
call SetPath()

function! MakeFileExecutable()
  checktime
  execute 'au FileChangedShell ' . expand('%') . ' :echo'
  call system('chmod a+x ' . expand('%'))
  checktime
  execute 'au! FileChangedShell ' . expand('%')
endfunction

function! MakeFileNonExecutable()
  checktime
  execute 'au FileChangedShell ' . expand('%') . ' :echo'
  call system('chmod a-x ' . expand('%'))
  checktime
  execute 'au! FileChangedShell ' . expand('%')
endfunction

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
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

function! ProbeLine(...)
  execute 'w'
  if &filetype == 'cucumber'
    call system(join([ 'probe', '-t', 'cucumber', '-c', join([ expand('%'), line('.') ], ':') ], ' ') . ' &')
  else
    call system(join([ 'probe', '-c', join([ expand('%'), line('.') ], ':') ], ' ') . ' &')
  endif
endfunction

function! Probe(...)
  execute 'w'
  if &filetype == 'cucumber'
    call system('probe -c -t cucumber ' . expand('%') . ' &')
  else
    call system('probe -c ' . expand('%') . ' &')
  endif
endfunction

function! ProbeToggleCoverage()
  let result = system('probe -C START_SIMPLECOV')
  if result == "0\n" || result == "\n"
    call system('probe -C START_SIMPLECOV=1')
    echo "Switching coverage on."
  else
    call system('probe -C START_SIMPLECOV=0')
    echo "Switching coverage off."
  endif
endfunction

function! Errors()
  set errorformat+=%f:%l
  set errorformat+=%E%f:%l
  silent! execute 'cf errors.lst'
  silent! cwindow
endfunction

function! AnsibleDecrypt()
  call cursor(1, 1)
  execute ":1,$d"
  silent! .!ansible-vault view %
  silent! file %.av
  silent! set filetype=av
  echo "Content of ansible vault decrypted."
endfunction

function! AnsibleEncrypt()
  if expand('%:e') == 'av'
    silent! set filetype=ansible
    silent! file %:r
    silent! w!
    silent! !ansible-vault >/dev/null 2>&1 encrypt %
    silent! !rm -f %.av
    silent! n! %
  endif
endfunction

" Switch of search highlighting
if has("fullscreen")
  set fuoptions=maxhorz,maxvert
  function! Fullscreen()
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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
noremap <C-A> <Nop>
noremap <C-X> <Nop>

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
  augroup av
    autocmd!
    autocmd BufWritePost,FileWritePost *.av silent! call AnsibleEncrypt()
  augroup END

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
    autocmd FileType ruby let ruby_operators=1
    autocmd BufWritePost *.rb,*.rake call CheckSyntax()
  augroup END

  augroup javascript
    autocmd!
    autocmd FileType javascript setl et sw=2 ts=2 autoindent
    autocmd FileType javascript setl suffixesadd=.js,.jsx
  augroup END

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

  augroup misc
    autocmd!
    autocmd BufWritePost ~/.vimrc so ~/.vimrc
  augroup END

  augroup mutt
    autocmd!
    autocmd BufNewFile,BufRead mutt-* setl textwidth=72
  augroup END

  augroup qf
    autocmd!
    autocmd  FileType qf set foldenable foldmethod=marker
    autocmd  FileType qf set nowrap
  augroup END

  augroup lf
    autocmd!
    autocmd  FileType lf set nowrap
  augroup END

  augroup slim
    autocmd!
    autocmd FileType slim setl wrap et sw=2 ts=2
  augroup END

  au! BufRead,BufNewFile *.rl   set filetype=ragel

  autocmd BufWritePre .vimrc,*.rb,*.rake,*.slim,*.haml,*.js,.jsx,*.c,*.cpp,*.java,*.h :%s/\s\+$//e
end

function! Find(...)
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
  silent execute "silent gr -c " . args_string
  copen
  redraw!
endfunction

function! Grep(...)
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
  silent execute "silent gr -c " . args_string
  copen
  redraw!
endfunction

function! Classify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -b " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! PathClassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! Declassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -s -d " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

function! CamelUnderscore(...)
  let name = expand('<cWORD>')
  let output = system('classify -t ' . name)
  execute "normal ciW" . output
endfunction

function! Symbolhash() range
  execute join([ 'silent ', a:firstline, ',', a:lastline, 's/\([^:]\):\([^:=!', "'", '" ]\{1,\}\) *=>/\1\2:/g' ])
endfunction

function! CreateTags()
  silent !create_tags
  redraw!
  if v:shell_error == 0
    echo "Tags created."
  else
    echo output
  end
endfunction

function! PrintGivenRange() range
    echo "firstline ".a:firstline." lastline ".a:lastline
    " Do some more things
endfunction

function! Edit(...)
  let args = copy(a:000)
  if len(args) == 1 && args[0][0:1] == '!/'
    let dir  = system("dirname " . expand('%'))
    let dir  = dir[0:len(dir) - 2]
    let args = [ substitute(args[0], '!', dir, '') ]
  endif
  call system("edit -m " . join(map(copy(args), 'shellescape(v:val)'), ' ') . ' &')
endfunction

function! Remove(...)
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

function! CheckSyntax(...)
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
        lclose
        echo "Syntax: 👍"
      else
        lf! "/tmp/errors.err"
        lopen
      endif
    else
      lf! "/tmp/errors.err"
      lopen
    end
  elseif !empty(matchstr(file, '\.json$'))
    call system("json_check " . file)
    if v:shell_error == 0
      redraw
      echo "Syntax: 👍"
    else
      redraw
      echo "Syntax: 👎"
    end
  end
endfunction

function! IrbEval()
  y
  call system("irb_connect -e '" . getreg('"') . "' &")
endfunction

function! CiErrors(...)
  if a:0 == 0
    let branch = 'betterplace_master'
  else
    let branch = a:1
  endif
  if a:0 < 2
    let build = ''
  else
    let build = a:2
  endif
  let cmd = "!rake ci:errors " . "JOB=" . branch . " BUILD=" . build . " OUTPUT=errors.lst"
  silent! execute cmd
  redraw!
  silent! execute 'cf errors.lst'
endfunction

function! Iexec(cmd)
  let output = system(a:cmd)
  execute "normal a" . output
endfunction

function! Itime(fmt)
  execute "normal a" . strftime(a:fmt)
endfunction

" Commands
command! -bar -nargs=1 OpenURL :!open <args>
command! -bar -nargs=* -complete=file Find call Find(<f-args>)
command! -bar -nargs=* -complete=file Grep call Grep(<f-args>)
command! -nargs=* -complete=file Classify call Classify(<f-args>)
command! -nargs=* -complete=file PathClassify call PathClassify(<f-args>)
command! -nargs=* -complete=file Declassify call Declassify(<f-args>)
command! CreateTags call CreateTags()
command! -range Symbolhash <line1>,<line2>call Symbolhash()
command! -range PrintGivenRange <line1>,<line2>call PrintGivenRange()
command! -nargs=* -complete=file Edit call Edit(<f-args>)
command! -nargs=* CiErrors call CiErrors(<f-args>)
command! -nargs=* MakeFileExecutable call MakeFileExecutable()
command! -nargs=* MakeFileNonExecutable call MakeFileNonExecutable()
command! -range SSLCertInfo <line1>,<line2> :!openssl x509 -inform pem -subject -fingerprint -issuer -sha256 -dates
command! -bar Gadd :!git add %
command! Gfix Gadd|silent! execute 'bd'

" Abbreviations
iabclear
iabbrev I_CODE # vim: set et sw=2 ts=2 autoindent:
iabbrev I_MFG Mit freundlichen Grüssen<CR><CR>Florian Frank
iabbrev I_VERSION <ESC>:call Iexec("tr -d '\n' <VERSION")<CR>
iabbrev I_DATE <ESC>:call Itime("%F")<CR>
iabbrev I_RELEASE * <ESC>:call Itime("%F")<CR> iRelease <ESC>:call Iexec("tr -d '\n' <VERSION")<CR>kJ
iabbrev I_DATETIME <ESC>:call Itime("%F %T")<CR>
iabbrev I_TIME <ESC>:call Itime("%T")<CR>
iabbrev I_M <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_C <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_P <ESC>:call Iexec("classify " . expand('%'))<CR>
iabbrev I_BYEBUG require 'byebug'; byebug
iabbrev I_DEBUG require 'byebug'; byebug
iabbrev I_RUBOCOP # rubocop:disable
