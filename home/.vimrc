" Filetype detection and pathogen initialization

" Enables filetype detection to automatically identify file types based on
" filename, content, or other heuristics:
filetype on
" Enables Pathogen's plugin loading mechanism by setting up the runtimepath to
" include all plugin directories:
execute pathogen#infect()
" Generates help tags for all installed plugins to make their documentation
" accessible via :help command:
execute pathogen#helptags()
" Enables automatic indentation settings based on detected file type:
filetype indent on
" Loads filetype-specific plugins that provide enhanced functionality for
" different file types:
filetype plugin on

" General Settings
set autoindent " Automatically indents new lines to match the indentation of the previous line
set autowrite " Automatically saves changes when switching between buffers (without needing to explicitly write)
set backspace=indent,eol,start " Allows backspacing over indentations, end-of-line, and start of line (more flexible backspace behavior)
set backupskip=/tmp/*,/private/tmp/* " Skips creating backup files for files in temporary directories (saves disk space)
if $TMUX == ''
  set clipboard+=unnamedplus " Makes Vim's unnamed register (which is used for yank/delete operations) sync with the system clipboard
endif
set complete=.,w,b,u,t " Configures omni-completion to include various sources: .(omnifunc), w(word completion), b(buffer completion), u(undo completion), t(thesaurus)
set dictionary=/usr/dict/words dictionary+=/usr/share/dict/words " Sets up dictionary files for spell checking and word completion
set encoding=utf8 " Uses UTF-8 encoding for all files and display
set errorfile=/tmp/errors.err " Specifies location for error file output
set expandtab shiftwidth=2 tabstop=2 " Converts tabs to spaces, sets indentation width to 2 spaces
set foldcolumn=0 " Hides the fold column (no line numbers for folding)
set formatoptions=cqrt " Sets text formatting options: c(auto-wrap comments), r(continue comments), q(allow comment formatting), t(auto-wrap text)
set fsync " Forces filesystem synchronization after writing files
set hidden " Allows switching between buffers without saving (keeps unsaved changes in background)
set history=1000 " Stores 1000 commands in command-line history
set modelines=5 " Checks up to 5 lines at top/bottom of file for vim settings
set nocindent " Disables C-style indentation
set nocompatible " Uses Vim-specific features instead of vi compatibility mode
set nodigraph " Disables digraph input (special character combinations)
set nofoldenable " Disables folding by default
set noignorecase " Makes searches case-sensitive
set noincsearch " Disables incremental search highlighting
set nojoinspaces " Prevents automatic space insertion after joining lines
set nopaste " Disables paste mode
set nosmartcase " Makes searches case-sensitive even when using lowercase letters
set nosmartindent " Disables smart indentation behavior
set shell=bash " Uses bash as the default shell for external commands
set shortmess=atIO " Shortens messages: a(auto-skip), t(truncate long messages), I(no splash screen), O(omit file content from messages)
set showcmd " Displays incomplete commands in status line
set smarttab " Uses tabstop setting for tab characters but shiftwidth for indentation
set splitbelow " Creates new windows below current window
set splitright " Creates new windows right of current window
set tags=./tags,tags " Searches for tag files in current directory and parent directories
set termencoding=utf8 " Sets terminal encoding to UTF-8
set tildeop " Allows tilde (~) operations on lines
set ttyfast " Uses fast terminal settings (for faster redraws)
set viminfo='20,<50,s10,h,! " Configures viminfo: 20 lines for marks, 50% for buffer info, 10k for search history, no history file, save all registers
set wrap " Enables line wrapping (displays long lines as multiple lines)

" Mouse Settings
set mouse=nv " Enables mouse support in normal and visual modes only (disables mouse in insert mode)
set mousehide " Hides the mouse cursor when typing in insert mode (improves readability while editing)

" Visual Configuration

set completeopt=menuone,noinsert,noselect,preview " Shows menu for all matches, waits for selection, displays preview information
set hlsearch " Highlights all matches of the last search pattern (makes search results visible)
set laststatus=2 " Always shows status line even when only one window is open
set nocursorcolumn " Disables highlighting of current column (vertical highlight)
set nocursorline " Disables highlighting of current line (horizontal highlight)
set norelativenumber " Disables relative line numbers (shows absolute line numbers only)
set number " Shows absolute line numbers in the left margin
set ruler " Displays cursor position in status line
set showmatch " Highlights matching parentheses, brackets, and braces when cursor is on them
set showmode " Displays current mode (INSERT, VISUAL, etc.) in status line
set statusline=\ ☠\ %<%f\ ⚐\ %y%m%r%*\ ❑\ %n%=✎\ %(%l:%c\%)\ ⇨\ %P " Custom status line with icons and information: file name, file type, read-only indicator, buffer number, line/column position, percentage through file
set t_Co=256 " Sets terminal color capability to 256 colors
set title " Sets terminal window title to current filename
set visualbell t_vb= " Uses visual bell (flash screen) instead of audible bell for errors
set wildchar=<TAB> " Sets tab as the wildmenu character for completion
set wildmenu                    " Enables the wildmenu feature which displays completion options in a menu at the bottom of the screen
set wildoptions+=pum            " Adds popup menu (pum) to wildmenu options, showing completions as a floating popup window
set wildmode=longest,full  " Configures completion behavior: longest common string first, then full completion
set winminheight=0 " Allows windows to be created with zero height (minimal window size)

colorscheme flori " Sets the color scheme to 'flori' for syntax highlighting and UI colors
if exists('&colorcolumn')
  set colorcolumn=79 " Sets a vertical column marker at column 79 to help enforce line length limits (common for code style guidelines)
end
" Enables persistent undo functionality and sets undo directory to user-specific temp directory:
if has("persistent_undo")
  set undofile
  if has("win32") || has("win64")
    set undodir=$TMP/vim-$USER
  else
    set undodir=/tmp/vim-$USER
  end
end
" Sets swap file directory to temporary location based on operating system:
if has("win32") || has("win64")
  set directory=$TMP
else
  set directory=/tmp
end
" Enables syntax highlighting if supported by the current Vim build:
if has("syntax")
  syntax on
end
let g:vim_json_syntax_conceal=0 " Disables conceal mode for JSON syntax highlighting (shows all characters instead of hiding them)

" Set cursor shape dependant on mode (doesn't work in tmux)
" let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
" let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
" let &t_SR = "\<Esc>]1337;CursorShape=2\x7"

" vimdiff configuration
hi DiffText ctermfg=white ctermbg=244 " Sets highlight for text that has changed in diff mode: white text on gray background
hi DiffChange ctermfg=white ctermbg=208 " Sets highlight for changed text in diff mode: white text on orange background
hi DiffAdd ctermfg=white ctermbg=28 " Sets highlight for added text in diff mode: white text on green background
hi DiffDelete ctermfg=white ctermbg=88 " Sets highlight for deleted text in diff mode: white text on dark red background
" Sets up key mappings for diff mode:
nnoremap <C-g> :diffget<CR>
nnoremap <C-p> :diffput<CR>
vnoremap <C-g> :diffget<CR>
vnoremap <C-p> :diffput<CR>
nnoremap <C-f> :.diffget<CR>
nnoremap <C-o> :.diffput<CR>
nnoremap <C-n> ]c
nnoremap <C-b> [c

" FZF Settings
set runtimepath^=~/.fzf " Adds ~/.fzf to the beginning of Vim's runtime path, making fzf-related files available to Vim
set runtimepath^=~/.vim/bundle/fzf.vim " Adds the fzf.vim bundle directory to the runtime path for Vim plugin functionality
let g:fzf_colors =
      \ {
      \ 'fg':         ['fg', 'Normal'],
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
      \ 'header':     ['fg', 'Comment']
      \ }
function! FZFOptions()
  echo fzf#wrap()['options']
endfunction

" CScope Settings
if has("cscope")
  set cscopetagorder=0
  set cscopetag
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add "cscope.out"
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  nnoremap <C-_> :cs find c <C-r>=expand('<cword>')<CR><CR>
endif

" Browser Settings
if has("browse")
  let g:explVertical=0 " Sets file explorer to open horizontally (not vertically)
  " let g:explSplitRight=1 " This line is commented out - would set explorer to split right
  let g:explSplitBelow=0 " Sets explorer to split above (not below) current window
  " let g:explStartRight=0 " This line is commented out - would start explorer on the right
  let g:explStartBelow=1 " Starts explorer below current window
  let g:explDetailedList=1 " Shows detailed file listing with additional information
  let g:explDateFormat="%Y-%m-%d %H:%M:%S" " Sets date format for file timestamps in explorer
  " let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$' " This line is commented out - would hide certain files
  let g:explUseSeparators=1 " Use separator lines in the file explorer display
end

" Tweaks

source $VIMRUNTIME/macros/matchit.vim " Loads the matchit plugin which enhances Vim's ability to navigate between matching pairs like parentheses, brackets, and HTML tags
let g:ale_linters_explicit = 1 " Ensure ALE only runs the linters you explicitly specify
let g:ale_linters={ 'ruby': [ 'ruby' ], 'python': [] } " Set ale linters
let g:ale_sh_shellcheck_options = '--exclude=SC2120,SC1090,SC1091,SC2119' " Exclude these shellchecks
let g:ale_set_highlights = 0 " Enable the sign column to show lint issues
let g:ale_sign_column_always = 1 " Disable ALE's syntax highlighting of errors to preserve your existing syntax highlighting

let g:nrrw_rgn_protect='n' " Allow original buffer to be modified for NrrwRgn plugin
let g:go_version_warning=0 " Disables Go plugin version warnings in Vim
let g:rails_statusline=0 " do not show [Rails] in status line for vim-rails plugin

" Mappings

" Set comma as leader key for custom mappings (makes extended functionality
" more readable and accessible):
let mapleader=","
let maplocalleader=","

" Directory and File Navigation Mappings
noremap <leader>E :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
noremap <leader>e :e <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
noremap <leader>n :new <cfile><CR>

" Finding and Grepping Mappings
noremap <leader>f :Files<CR>
noremap <leader>d :call ResetFiles()<CR>
noremap <leader>g :call Grep()<CR>
noremap <leader>G :call Grep(expand('<cword>'))<CR>
noremap <leader>H :call FuncHistory()<CR>
noremap <leader>h :call LinesHistory()<CR>
noremap <leader>/ :let @/=''<CR>

" Copy and Paste Mappings
noremap <leader>F :!echo "%:p"\|ctc<CR><C-l>
noremap <leader>y :silent w !ctc<CR>

" Buffers and Windows Mappings
noremap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
noremap <silent> <leader>w :call ToggleList("Location List", 'l')<CR>
noremap <silent> <leader>Q :call Errors()<CR>
noremap <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
noremap <leader>v :vsplit <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>

" Ruby Syntax Helpers Mappings
noremap <leader>S :call Symbolhash()<CR>
noremap <leader>C :call CamelUnderscore()<CR>

" IRB eval
noremap <leader>re :call IrbEvalLines()<CR>
noremap <leader>rd :s/# => .*//<CR>
noremap <leader>rx :call IrbExecute()<CR>
noremap <leader>rs :call IrbStore()<CR>
noremap <leader>rc :call IrbExecuteCurrent()<CR>
noremap <leader>rl :call IrbLoad()<CR>

" Testing Probe Mappings
noremap <leader>P :silent w<CR>:call Probe()<CR>
noremap <leader>p :silent w<CR>:call ProbeLine()<CR>
noremap <leader>pa :silent w<CR>:call ProbeAll()<CR>

" Ollama Mappings
noremap <leader>o :call OllamaChatSend()<CR>
noremap <leader>i :!echo "/import %:p"\|ollama_chat_send -t<CR><C-l>
noremap <leader>m :.!git dfc\|commit_message<CR>
noremap <leader>c :call Comment()<CR>

" base64 Helper Mappings
vnoremap <leader>4 c<C-R>=system("base64 -D", @")<CR><ESC>
vnoremap <leader>6 c<C-R>=system("base64", @")<CR><ESC>
vnoremap <leader>x c<C-R>=system("sed 's/^[[:blank:]]*//;s/[[:space:]]*$//' \| tr -d '\n' \| base64", @")<CR><ESC>

" EasyAlign Plugin Mappings
xmap ea <Plug>(EasyAlign)
nmap ea <Plug>(EasyAlign)

" F-Keys
" F1: Toggle help buffer (default Vim help system)
noremap <F1> :call ToggleHelp()<CR>
" F2: Toggle Tagbar (code outline/navigation panel):
noremap <F2> :TagbarToggle<CR>
" F3: Toggle paste mode for improved text pasting behavior:
noremap <F3> :call TogglePaste()<CR>
" F4: Toggle Undotree (visualizes undo history for better navigation):
noremap <silent><F4>  :UndotreeToggle<CR>

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

" Move selected text left/right while preserving visual selection (keeps text
" highlighted after shifting):
vnoremap < <gv
vnoremap > >gv

" Marks switch them
nnoremap ' `
nnoremap ` '

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
    autocmd BufWritePre *.tf,*.tfvars TerraformFmt
  augroup END

  augroup vim
    autocmd!
    autocmd FileType vim setl nowrap
  augroup END

  augroup enc_decrypt
    autocmd!
    autocmd BufRead *.enc call SetupEncBuffer()
  augroup END

  augroup enc_encrypt
      autocmd!
      autocmd BufWriteCmd *.enc call EncryptOnSave()
  augroup END

  au! BufRead,BufNewFile *.rl set filetype=ragel

  autocmd BufWritePre .vimrc,*.rb,*.rake,*.slim,*.haml,*.js,.jsx,*.c,*.cpp,*.java,*.h :%s/\s\+$//e
  autocmd BufWritePre Rakefile,.vimrc,*.rb,*.rake,*.slim,*.haml,*.js,.jsx,*.c,*.cpp,*.java,*.h,*.md :retab
end

" Functions

" Path Configuration

" Sets up Vim's search path dynamically based on project configuration or defaults:
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
" Executes the SetPath function to dynamically configure Vim's search path
" based on project configuration or defaults:
call SetPath()

" Filebits Configuration

" Makes the current file executable by setting execute permissions:
function! MakeFileExecutable()
  checktime
  execute 'au FileChangedShell ' . expand('%') . ' :echo'
  call system('chmod a+x ' . expand('%'))
  checktime
  execute 'au! FileChangedShell ' . expand('%')
endfunction

" Removes execute permissions from the current file:
function! MakeFileNonExecutable()
  checktime
  execute 'au FileChangedShell ' . expand('%') . ' :echo'
  call system('chmod a-x ' . expand('%'))
  checktime
  execute 'au! FileChangedShell ' . expand('%')
endfunction

" Buffers and Windows Configuration

" Opens help buffer if closed, closes it if open
function! ToggleHelp()
    if exists("g:help_buffer_open") && g:help_buffer_open
        close
        let g:help_buffer_open = 0
    else
        help
        let g:help_buffer_open = 1
    endif
endfunction

" Retrieves a formatted list of all open buffers:
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

" Toggles visibility of a quickfix or location list window:
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

" Toggles paste mode and adjusts indentation settings for proper handling:
function!  TogglePaste()
  if &paste
    set nopaste
    set et ts=2 sw=2
    retab
  else
    set paste
    set et ts=2 sw=2
    retab
  endif
endfunction

" Displays error messages from errors.lst file in quickfix window:
function! Errors()
  execute 'cf errors.lst'
  execute 'copen'
endfunction

" Testing Probe Configuration

" Returns additional arguments for probe command execution:
function! ProbeExtraArgs()
  if !exists('g:pa')
    let g:pa = []
  endif
  return g:pa
endfunction

" Runs probe command on current line:
function! ProbeLine()
  execute 'w'
  let p_args = ProbeExtraArgs()
  let cmd = [ 'probe' ] + [ '-c', join([ expand('%'), line('.') ], ':') ]
  if len(p_args) > 0
    let cmd = cmd + p_args
  endif
  let cmd = cmd + [ '&' ]
  call system(join(cmd))
endfunction

" Runs all tests in dir with probe:
function! ProbeAll(dir="spec")
  let p_args = ProbeExtraArgs()
  let cmd = [ 'probe', '-c', a:dir ]
  if len(p_args) > 0
    let cmd = cmd + p_args
  endif
  let cmd = cmd + [ '&' ]
  call system(join(cmd))
endfunction

" Runs probe command on current file:
function! Probe()
  execute 'w'
  let p_args = ProbeExtraArgs()
  let cmd = [ 'probe', '-c', expand('%') ]
  if len(p_args) > 0
    let cmd = cmd + p_args
  endif
  let cmd = cmd + [ '&' ]
  call system(join(cmd))
endfunction

" Toggles code coverage reporting on/off:
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

" Toggles debugger mode on/off:
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

" Toggles documentation formatter on/off:
function! ProbeFormatter(formatter="")
  let g:pa = []
  let formatter = a:formatter
  if formatter == ""
    echo 'Use default formatter.'
  else
    if formatter == "l"
      let formatter = "Utils::LineFormatter"
    endif
    let g:pa = extend(g:pa, [ '-f', formatter ])
    echo 'Set formatter to "' . formatter . '".'
  endif
endfunction

" Ollama Interaction Configuration

" Sends code snippet to Ollama chat session with filetype context:
function! OllamaChatSend() range
  let buf = bufnr()
  let input = join(getbufline(buf, a:firstline, a:lastline), "\n")
  let input = "Take note of the following code snippet (" . &filetype . ") **AND** await further instructions:\n\n```\n" . input . "\n```\n"
  call system('ollama_chat_send', input)
endfunction

" Generates code comments using external tool, stores result in register, and inserts it above current line:
function! Comment()
  let pos = getpos('.')
  let line = pos[1]
  execute "w"
  let output = system('code_comment 2>/dev/null ' . expand('%') . ':' . line)
  call setreg('"', output)
  normal k
  normal p
endfunction

" Finding and Grepping Configuration

" Finds occurrences of words using discover command with fuzzy matching:
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

" Performs grep search with pattern input and displays results in quickfix window:
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

" Git Searching Configuration

" Opens Git history view for current function or word under cursor using Fugitive plugin:
function! FuncHistory()
  execute 'Git log -w -C3 -L :' . expand('<cWORD>') . ':' . FugitivePath()
endfunction

" Opens Git history view for selected line range using Fugitive plugin:
function! LinesHistory() range
  execute 'Git log -w -C3 -L ' . a:firstline . ',' . a:lastline . ':' . FugitivePath()
endfunction

" Ruby Syntax Helpers Configuration

" Classifies text using classify utility with buffer context:
function! Classify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -b " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

" Classifies path-based text using classify utility:
function! PathClassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

" Removes classification from text using classify utility:
function! Declassify(...)
  if a:0 == 0
    let args = [ expand( '<cword>') ]
  else
    let args = copy(a:000)
  end
  let output = system("classify -s -d " . join(map(copy(args), 'shellescape(v:val)'), ' '))
  execute "normal a" . output
endfunction

" Converts camelCase to snake_case for current word:
function! CamelUnderscore(...)
  let name = expand('<cWORD>')
  let output = system('classify -t -n 0 ' . name)
  execute "normal ciW" . output
endfunction

" Removes trailing whitespace and normalizes spacing around hash rocket operators in selected lines:
function! Symbolhash() range
  execute join([ 'silent ', a:firstline, ',', a:lastline, 's/\([^:]\):\([^:=!', "'", '" ]\{1,\}\) *=>/\1\2:/g' ])
endfunction

" Tags Generation Configuration

" Generates project tags file using external create_tags command and provides user feedback on completion or errors:
function! CodeIndexer()
  silent !code_indexer
  redraw!
  if v:shell_error == 0
    echo "Code was indexed."
  else
    echo output
  end
endfunction

" Edit Configuration, grok `edit foo/bar.rb:23`
" Handles file editing with special case for directory-aware path substitution
" and background execution:
function! Edit(...)
  let args = copy(a:000)
  if len(args) == 1 && args[0][0:1] == '!/'
    let dir  = system("dirname " . expand('%'))
    let dir  = dir[0:len(dir) - 2]
    let args = [ substitute(args[0], '!', dir, '') ]
  endif
  call system("edit -m " . join(map(copy(args), 'shellescape(v:val)'), ' ') . ' &')
endfunction

" Open a remote file from URL in a new buffer with proper filename and
" filetype detection
" Usage: :call EditURL('https://example.com/file.txt')
" This function downloads the remote file using curl, creates a new buffer,
" sets the buffer name to the filename from the URL, and automatically detects
" and sets the appropriate filetype based on the file extension
function! EditURL(url)
  let cmd = 'curl -s ' . a:url
  execute 'new'
  execute 'r !' . cmd
  execute 'normal 1G'
  execute 'normal! 1dd'

  " Extract base filename from URL
  let filename = substitute(a:url, '.*/\([^/?]*\).*', '\1', '')
  if filename == '' || filename =~ '^\s*$'
    let filename = 'remote_file.txt'
  endif

  " Set the buffer name
  silent execute 'file ' . filename

  " Set filetype based on extension
  let ext = substitute(filename, '.*\.\([^.]*\)$', '\1', '')
  if ext != ''
    execute 'setlocal filetype=' . ext
  endif
endfunction

" Iabbrev Helpers

" Executes shell command and appends its output to current line in insert mode:
function! Iexec(cmd)
  let output = system(a:cmd)
  execute "normal a" . output
endfunction

" Inserts current timestamp formatted according to specified format string at cursor position:
function! Itime(fmt)
  execute "normal a" . strftime(a:fmt)
endfunction

" Vimscript Debug Functions

" Displays the starting and ending line numbers of the current visual selection or command range:
function! PrintGivenRange() range
    echo "firstline ".a:firstline." lastline ".a:lastline
    " Do some more things
endfunction

" Function to setup .enc buffer with decrypted content
function! SetupEncBuffer()
  let l:filename = expand('%:p')
  if fnamemodify(l:filename, ':e') == 'enc'
    " Get decrypted content
    let l:output = system('complex_config decrypt -O ' . shellescape(l:filename))
    if v:shell_error == 0
      let l:lines = split(l:output, '\n')

      " Clear current buffer and insert decrypted lines
      silent execute ':%d'

      if len(l:lines) > 0
        call append(0, l:lines)
        silent execute 'delete'
      endif

      setlocal filetype=yaml
    else
      echohl ErrorMsg
      echo "Failed to decrypt " . l:filename
      echohl None
    endif
  endif
endfunction

" Encrypts the current buffer content to a .enc file when saving.
" This function is triggered automatically on BufWriteCmd for files with .enc
" extension.
" It:
" 1. Reads the current buffer content
" 2. Creates a temporary file with the content
" 3. Deletes the original .enc file (required by complex_config)
" 4. Encrypts the content to the original filename (complex_config adds .enc suffix)
" 5. Reloads the encrypted file to show the new content
" 6. Sets up the buffer with proper filetype detection
"
" Note: This function requires the 'complex_config' command to be available in the PATH
" and assumes the .enc file is in the same directory as the original file.
function! EncryptOnSave()
  if fnamemodify(expand('%'), ':e') == 'enc'
    " Get current buffer content
    let l:content = join(getline(1, '$'), "\n")

    " Create a temporary file with current content
    let l:temp_file = tempname()
    call writefile(split(l:content, "\n"), l:temp_file)

    " Store original filename (without .enc suffix for encryption)
    let l:original_file = expand('%')
    let l:base_name = fnamemodify(l:original_file, ':r')  " Remove extension

    " Check if original file exists
    if filereadable(l:original_file)
      " Delete the original file first (required by complex_config)
      let l:delete_cmd = 'rm -f ' . shellescape(l:original_file)
      let l:delete_output = system(l:delete_cmd)

      if v:shell_error != 0
        echohl ErrorMsg
        echo "Failed to delete original file: " . l:delete_output
        echohl None
        call delete(l:temp_file)
        return
      endif
    endif

    " Encrypt to the original filename (complex_config will add .enc suffix)
    let l:cmd = 'complex_config encrypt -I ' . shellescape(l:base_name) . ' < ' . shellescape(l:temp_file)
    let l:output = system(l:cmd)

    if v:shell_error == 0
      echo "File re-encrypted successfully"
      " Force reload the file to show the new encrypted content
      execute 'edit!'
      call SetupEncBuffer()
    else
      echohl ErrorMsg
      echo "Encryption failed: " . l:output
      echohl None
    endif

    " Clean up
    call delete(l:temp_file)
  endif
endfunction

" Evaluate selected Ruby lines in IRB and insert results with # => comments
" Executes each line in the same context and replaces original lines with output
function! IrbEvalLines() range
  let buf = bufnr()
  let input = getbufline(buf, a:firstline, a:lastline)
  let output = systemlist('irb_client eval_lines', input)
  if v:shell_error != 0
    echo "IRB returned an error code: " . v:shell_error
  elseif len(output) == 0
    echo "IRB returned an empty response."
  else
    call deletebufline(buf, a:firstline, a:lastline)
    let pos = getpos('.')
    let line = pos[1] - 1
    call append(line, output)
  endif
endfunction

" Execute selected Ruby code snippet in IRB without returning output
" Useful for running code that produces side effects or doesn't return values
function! IrbExecute() range
  let buf = bufnr()
  let input = getbufline(buf, a:firstline, a:lastline)
  call system('irb_client execute_snippet', input)
  if v:shell_error != 0
    echo "IRB returned an error code: " . v:shell_error
  else
    echo "IRB is executing the code."
  endif
endfunction

" Store selected Ruby code snippet in IRB's memory for later use
" Allows you to reference the snippet by name in subsequent IRB commands
function! IrbStore() range
  let buf = bufnr()
  let input = getbufline(buf, a:firstline, a:lastline)
  call system('irb_client store_snippet', input)
  if v:shell_error != 0
    echo "IRB returned an error code: " . v:shell_error
  else
    echo "IRB stored the code."
  endif
endfunction

" Execute the current IRB snippet (presumably from buffer or clipboard)
" Useful for running previously stored or selected code snippets
function! IrbExecuteCurrent()
  call system('irb_client execute_current_snippet')
  if v:shell_error != 0
    echo "IRB returned an error code: " . v:shell_error
  else
    echo "IRB is executing the code."
  endif
endfunction

" Load and execute the current file in IRB using the 'source' command
" Perfect for testing entire Ruby files or modules in the interactive environment
function! IrbLoad()
  let filename = expand('%:p')
  let input = 'source "' . filename . '"'
  call system('irb_client execute_snippet', input)
  if v:shell_error != 0
    echo "IRB returned an error code: " . v:shell_error
  else
    echo 'IRB is loading "' . filename . '".'
  endif
endfunction

" Reset the files cache using discover -r command and refresh the Files buffer
" This function clears the discover cache and then reopens the Files buffer
" to show the updated file list. Displays success or error messages based on
" the outcome of the discover command execution.
function! ResetFiles()
  call system('discover -r')
  if v:shell_error != 0
    echo "Resetting files failed, discover returned an error code: " . v:shell_error
  else
    echo 'Resetting files cache succeeded.'
  endif
  execute 'Files'
endfunction

" Commands
command! -bar -nargs=1 OpenURL !open <args>
command! -bar -nargs=1 EditURL call EditURL(<f-args>)
command! -bar -nargs=* -complete=file Find call Find(<f-args>)
command! -bar -nargs=* -complete=file Grep call Grep(<f-args>)
command! -nargs=* -complete=file Classify call Classify(<f-args>)
command! -nargs=* -complete=file PathClassify call PathClassify(<f-args>)
command! -nargs=* -complete=file Declassify call Declassify(<f-args>)
command! CodeIndexer call CodeIndexer()
command! -range Symbolhash <line1>,<line2>call Symbolhash()
command! -range PrintGivenRange <line1>,<line2>call PrintGivenRange()
command! -nargs=* -complete=file Edit call Edit(<f-args>)
command! -nargs=* MakeFileExecutable call MakeFileExecutable()
command! -nargs=* MakeFileNonExecutable call MakeFileNonExecutable()
command! -range SSLCertInfo <line1>,<line2> :!sed 's/ *//' | tee >(openssl x509 -inform pem -subject -ext subjectAltName -fingerprint -issuer -sha256 -dates) | cat
command! ProbeToggleCoverage call ProbeToggleCoverage()
command! ProbeToggleDebugger call ProbeToggleDebugger()
command! -nargs=? ProbeFormatter call ProbeFormatter(<f-args>)
command! Configure edit $MYVIMRC

" Abbreviations
iabclear
iabbrev I_CODE # vim: set et sw=2 ts=2 autoindent:
iabbrev I_MFG Mit freundlichen Grüssen<CR><CR>Florian Frank
iabbrev I_DATE <ESC>:call Itime("%F")<CR>
iabbrev I_DATETIME <ESC>:call Itime("%F %T")<CR>
iabbrev I_TIME <ESC>:call Itime("%T")<CR>
iabbrev I_M <ESC>:call Iexec("classify -S -b " . expand('%'))<CR>
iabbrev I_C <ESC>:call Iexec("classify -S -b " . expand('%'))<CR>
iabbrev I_P <ESC>:call Iexec("classify -S " . expand('%'))<CR>
iabbrev I_DEBUG require 'debug'; debugger
iabbrev I_RUBOCOP # rubocop:disable all
