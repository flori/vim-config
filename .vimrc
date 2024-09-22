" General Settings
set autoindent
set autowrite
set backspace=indent,eol,start
set backupskip=/tmp/*,/private/tmp/*
if $TMUX == ''
    set clipboard+=unnamed
endif
set complete=.,w,b,u,t
set dictionary=/usr/dict/words dictionary+=/usr/share/dict/words
set encoding=utf8
set errorfile=/tmp/errors.err
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
set norelativenumber
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
set wildmode=list:full
set winminheight=0
set wrap

set runtimepath^=~/.fzf
set runtimepath^=~/.vim/bundle/fzf.vimset

let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

function! FZFOptions()
    echo fzf#wrap()['options']
endfunction

" Set cursor shape dependant on mode (doesn't work in tmux)
" let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
" let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
" let &t_SR	= "\<Esc>]1337;CursorShape=2\x7"

" Set ale linters
let g:ale_linters={ 'ruby': [ 'ruby' ], 'python': [] }

" Allow original buffer to be modified for NrrwRgn plugin
let g:nrrw_rgn_protect='n'

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

execute pathogen#infect()
execute pathogen#helptags()

filetype on
filetype indent on
filetype plugin on
set t_Co=256
colorscheme flori

source $VIMRUNTIME/macros/matchit.vim

if has("syntax")
  syntax on
end
let g:vim_json_syntax_conceal=0

" vimdiff configuration
hi DiffText ctermfg=white ctermbg=244
hi DiffChange ctermfg=white ctermbg=208
hi DiffAdd ctermfg=white ctermbg=28
hi DiffDelete ctermfg=white ctermbg=88
if &diff
  nmap g :diffget<CR>
  nmap p :diffput<CR>
  vmap g :diffget<CR>
  vmap p :diffput<CR>
  nmap n ]c
  nmap N [c
endif

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
"map <leader>c :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>/ :let @/=''<CR>
map <leader>C :call CamelUnderscore()<CR>
map <leader>e :e <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>F :!echo %\|pbcopy<CR>
map <leader>f :Files<CR>
map <leader>g :call Grep()<CR>
map <leader>G :call Grep(expand('<cword>'))<CR>
map <leader>H :call FuncHistory()<CR>
map <leader>h :call LinesHistory()<CR>
map <leader>L :silent w<CR>:call system('irb_connect -e "reload!"')<CR>
map <leader>l :silent w<CR>:call system('irb_connect -l ' . expand('%') . ' &')<CR>
map <leader>m :.!git dfc\|commit_message<CR>
map <leader>n :new <cfile><CR>
map <leader>o :!discover -se<CR>
map <leader>O :!discover -sre<CR>
map <leader>P :silent w<CR>:call Probe()<CR>
map <leader>p :silent w<CR>:call ProbeLine()<CR>
map <leader>r :call Comment()<CR>
map <leader>S :call Symbolhash()<CR>
map <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <leader>t :TlistToggle<CR>
map <leader>v :vsplit <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
map <silent> <leader>Q :call Errors()<CR>
map <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>w :call ToggleList("Location List", 'l')<CR>
nmap <leader>T :TagbarToggle<CR>
nmap ga <Plug>(EasyAlign)
vnoremap <leader>4 c<C-R>=system("base64 -D", @")<CR><ESC>
vnoremap <leader>6 c<C-R>=system("base64", @")<CR><ESC>
vnoremap <leader>x c<C-R>=system("sed 's/^[[:blank:]]*//;s/[[:space:]]*$//' \| tr -d '\n' \| base64", @")<CR><ESC>
xmap ga <Plug>(EasyAlign)

" Functions

function! SetPath()
  if getcwd() == expand('~')
    return
  endif
  if filereadable('.utilsrc')
    let output = system("discover -D")
    if v:shell_error == 0
      let lines = split(output, '\n')
      for line in lines
        execute 'set path+=' . fnameescape(line) . '**'
      endfor
      return
    endif
  endif
  set path+=**
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

function ProbeExtraArgs()
  if !exists('g:pa')
    let g:pa = []
  endif
  return g:pa
endfunction

function! ProbeLine(...)
  execute 'w'
  let p_args = ProbeExtraArgs()
  if &filetype == 'cucumber'
    call extend(p_args, [ '-t', 'cucumber' ])
  endif
  call system(join([ 'probe' ] + p_args + [ '-c', join([ expand('%'), line('.') ], ':'), '&' ]))
endfunction

function! Probe(...)
  execute 'w'
  let p_args = ProbeExtraArgs()
  if &filetype == 'cucumber'
    call extend(p_args, [ '-t', 'cucumber' ])
  endif
  call system(join([ 'probe' ] + p_args + [ '-c', expand('%') , '&' ]))
endfunction

function! ProbeToggleCoverage()
  let result = system('probe -C START_SIMPLECOV')
  if result == "0\n" || result == "\n"
    call system('probe -C START_SIMPLECOV=1')
    echo 'Switching coverage on.'
  else
    call system('probe -C START_SIMPLECOV=0')
    echo 'Switching coverage off.'
  endif
endfunction

function! ProbeToggleDebugger()
  let result = system('probe -C DISABLE_DEBUGGER')
  if result == "0\n" || result == "\n"
    call system('probe -C DISABLE_DEBUGGER=1')
    echo 'Switching debugging off.'
  else
    call system('probe -C DISABLE_DEBUGGER=0')
    echo 'Switching debugging on.'
  endif
endfunction

function! ProbeToggleDocumentation()
  if !exists('g:pa')
    let g:pa = []
  endif
  let l:i = index(g:pa, '-fd')
  if l:i >= 0
    call remove(g:pa, l:i)
    echo 'Switching documentation formatter off.'
  else
    call add(g:pa, '-fd')
    echo 'Switching documentation formatter on.'
  endif
endfunction

function! Errors()
  execute 'cf errors.lst'
  execute 'copen'
endfunction

function! PrettyTerraform()
  let view = winsaveview()
  silent %!terraform fmt -
  call winrestview(view)
endfunction

" F-Keys
noremap <F2> :TagbarToggle<CR>

" Switch Windows
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Resize Windows
noremap <Up> <C-W>+
noremap <Down> <C-W>-
noremap <Left> <C-W>>
noremap <Right> <C-W><

" Disable
noremap <Ins> <Nop>
noremap <End> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
noremap <C-A> <Nop>
noremap <C-X> <Nop>

" Moving text objects left and right
vnoremap < <gv
vnoremap > >gv

" Marks switch them
nnoremap ' `
nnoremap ` '

map Y :silent w !pbcopy<CR>
map O :silent .!ollama_cli<CR>

if has("autocmd")
  augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setl complete+=k
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

  augroup c
    autocmd!
    autocmd FileType c setl sw=4 ts=4 cinoptions= formatoptions=cqrol cindent
  augroup END

  augroup perl
    autocmd!
    autocmd Filetype perl setl et sw=4 ts=4 autoindent
  augroup END

  augroup ruby
    autocmd!
    autocmd FileType ruby setl et sw=2 ts=2 autoindent
    autocmd FileType ruby setl suffixesadd=.rb,.h,.c
    autocmd FileType ruby let ruby_operators=1
    autocmd FileType ruby compiler ruby
  augroup END

  augroup javascript
    autocmd!
    autocmd FileType javascript setl et sw=2 ts=2 autoindent
    autocmd FileType javascript setl suffixesadd=.js,.jsx
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
  augroup END

  augroup html
    autocmd!
    autocmd FileType xml setl et sw=2 ts=2 autoindent
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
    autocmd BufNewFile,BufRead mutt-* setl complete+=k
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

  augroup tf
    autocmd!
    autocmd BufWritePre *.tf,*.tfvars call PrettyTerraform()
    autocmd FileType terraform set syntax=hcl
  augroup END

  au! BufRead,BufNewFile *.rl set filetype=ragel

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
  let output = system('classify -t -n 0 ' . name)
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

function! CreateCSTags()
  silent !create_cstags
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

function! Comment()
  let pos = getpos('.')
  let line = pos[1]
  execute "w"
  let output = system('code_comment ' . expand('%') . ':' . line)
  call setreg('"', output)
  normal k
  normal p
endfunction

function! Iexec(cmd)
  let output = system(a:cmd)
  execute "normal a" . output
endfunction

function! Itime(fmt)
  execute "normal a" . strftime(a:fmt)
endfunction

function! FuncHistory()
  execute 'Git log -w -C3 -L :' . expand('<cWORD>') . ':' . FugitivePath()
endfunction

function! LinesHistory() range
  execute 'Git log -w -C3 -L ' . a:firstline . ',' . a:lastline . ':' . FugitivePath()
endfunction

" Commands
command! -bar -nargs=1 OpenURL :!open <args>
command! -bar -nargs=* -complete=file Find call Find(<f-args>)
command! -bar -nargs=* -complete=file Grep call Grep(<f-args>)
command! -nargs=* -complete=file Classify call Classify(<f-args>)
command! -nargs=* -complete=file PathClassify call PathClassify(<f-args>)
command! -nargs=* -complete=file Declassify call Declassify(<f-args>)
command! CreateTags call CreateTags()
command! CreateCSTags call CreateCSTags()
command! -range Symbolhash <line1>,<line2>call Symbolhash()
command! -range PrintGivenRange <line1>,<line2>call PrintGivenRange()
command! -nargs=* -complete=file Edit call Edit(<f-args>)
command! -nargs=* MakeFileExecutable call MakeFileExecutable()
command! -nargs=* MakeFileNonExecutable call MakeFileNonExecutable()
command! -range SSLCertInfo <line1>,<line2> :!sed 's/ *//' | tee >(openssl x509 -inform pem -subject -fingerprint -issuer -sha256 -dates) | cat
command! ProbeToggleCoverage call ProbeToggleCoverage()
command! ProbeToggleDebugger call ProbeToggleDebugger()

" Abbreviations
iabclear
iabbrev I_CODE # vim: set et sw=2 ts=2 autoindent:
iabbrev I_MFG Mit freundlichen Grüssen<CR><CR>Florian Frank
iabbrev I_DATE <ESC>:call Itime("%F")<CR>
iabbrev I_DATETIME <ESC>:call Itime("%F %T")<CR>
iabbrev I_TIME <ESC>:call Itime("%T")<CR>
iabbrev I_M <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_C <ESC>:call Iexec("classify -b " . expand('%'))<CR>
iabbrev I_P <ESC>:call Iexec("classify " . expand('%'))<CR>
iabbrev I_DEBUG require 'debug'; debugger
iabbrev I_RUBOCOP # rubocop:disable all
