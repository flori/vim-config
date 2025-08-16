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
  set clipboard+=unnamed " Makes Vim's unnamed register (which is used for yank/delete operations) sync with the system clipboard
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
set nowrap " Disables line wrapping (shows long lines as horizontal scrolling)
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
set wildmode=list:full " Sets completion mode to list matching files then show full matches
set wrap " Enables line wrapping (displays long lines as multiple lines)

" Mouse Settings
set mouse=nv " Enables mouse support in normal and visual modes only (disables mouse in insert mode)
set mousehide " Hides the mouse cursor when typing in insert mode (improves readability while editing)

" Visual Configuration
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
set wildmenu " Enables enhanced command-line completion menu
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
" - 'g' gets changes from other side of diff
" - 'p' puts changes to other side of diff
" - 'n' and 'N' navigate between diff changes
if &diff
  nnoremap g :diffget<CR>
  nnoremap p :diffput<CR>
  vnoremap g :diffget<CR>
  vnoremap p :diffput<CR>
  nnoremap n ]c
  nnoremap N [c
endif

" FZF Settings
set runtimepath^=~/.fzf " Adds ~/.fzf to the beginning of Vim's runtime path, making fzf-related files available to Vim
set runtimepath^=~/.vim/bundle/fzf.vim " Adds the fzf.vim bundle directory to the runtime path for Vim plugin functionality
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

" CScope Settings
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
let g:ale_linters={ 'ruby': [ 'ruby' ], 'python': [] } " Set ale linters
let g:nrrw_rgn_protect='n' " Allow original buffer to be modified for NrrwRgn plugin
let g:go_version_warning=0 " Disables Go plugin version warnings in Vim
let g:rails_statusline=0 " do not show [Rails] in status line for vim-rails plugin

" Mappings

" Set comma as leader key for custom mappings (makes extended functionality
" more readable and accessible):
let mapleader=","
let maplocalleader=","

" VIM Configuration

" Reload current .vimrc configuration dynamically without restarting Vim:
noremap <leader>r :source $MYVIMRC<CR>

" Directory and File Navigation Mappings

" Change working directory to current file's parent directory with space-safe path handling:
noremap <leader>E :cd <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
" Edit files from current file's parent directory with space-safe path handling:
noremap <leader>e :e <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
" Open current file in new horizontal split window for side-by-side viewing:
noremap <leader>n :new <cfile><CR>

" Finding and Grepping Mappings
noremap <leader>f :Files<CR>
noremap <leader>g :call Grep()<CR>
noremap <leader>G :call Grep(expand('<cword>'))<CR>
noremap <leader>H :call FuncHistory()<CR>
noremap <leader>h :call LinesHistory()<CR>
" Clear current search pattern and remove highlighting (resets @/ register):
noremap <leader>/ :let @/=''<CR>

" Copy and Paste Mappings
noremap <leader>F :!echo "%:p"\|pbcopy<CR><C-l>
noremap <leader>y :silent w !pbcopy<CR>

" Buffers and Windows Mappings
noremap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
noremap <silent> <leader>w :call ToggleList("Location List", 'l')<CR>
noremap <silent> <leader>Q :call Errors()<CR>
noremap <leader>s :split <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>
noremap <leader>v :vsplit <C-R>=substitute(expand("%:p:h") . "/", " ", "\\\\ ", "g")<CR>

" Ruby Syntax Helpers Mappings
noremap <leader>S :call Symbolhash()<CR>
noremap <leader>C :call CamelUnderscore()<CR>

" Testing Probe Mappings
noremap <leader>P :silent w<CR>:call Probe()<CR>
noremap <leader>p :silent w<CR>:call ProbeLine()<CR>

" Ollama Mappings
noremap <leader>o :<C-U>call OllamaChatSend(@*)<CR>
noremap <leader>O :<C-U>call OllamaChatSendWithResponse(@*)<CR>
noremap <leader>d :<C-U>call OllamaCli(@*)<CR>
noremap <leader>i :!echo "/import %:p"\|ollama_chat_send -t<CR><C-l>
noremap <leader>m :.!git dfc\|commit_message<CR>
noremap <leader>c :call Comment()<CR>

" base64 Helper Mappings
vnoremap <leader>4 c<C-R>=system("base64 -D", @")<CR><ESC>
vnoremap <leader>6 c<C-R>=system("base64", @")<CR><ESC>
vnoremap <leader>x c<C-R>=system("sed 's/^[[:blank:]]*//;s/[[:space:]]*$//' \| tr -d '\n' \| base64", @")<CR><ESC>

" EasyAlign Plugin Mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" Runs probe command on current line with optional cucumber support:
function! ProbeLine(...)
  execute 'w'
  let p_args = ProbeExtraArgs()
  if &filetype == 'cucumber'
    call extend(p_args, [ '-t', 'cucumber' ])
  endif
  call system(join([ 'probe' ] + p_args + [ '-c', join([ expand('%'), line('.') ], ':'), '&' ]))
endfunction

" Runs probe command on current file with optional cucumber support:
function! Probe(...)
  execute 'w'
  let p_args = ProbeExtraArgs()
  if &filetype == 'cucumber'
    call extend(p_args, [ '-t', 'cucumber' ])
  endif
  call system(join([ 'probe' ] + p_args + [ '-c', expand('%') , '&' ]))
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

" Ollama Interaction Configuration

" Sends code snippet to Ollama chat session with filetype context:
function! OllamaChatSend(input)
  let input = "Take note of the following code snippet (" . &filetype . ") **AND** await further instructions:\n\n```\n" . a:input . "\n```\n"
  call system('ollama_chat_send', input)
endfunction

" Sends input to Ollama chat and appends response at current line:
function! OllamaChatSendWithResponse(input)
  let output = systemlist('ollama_chat_send -r', a:input)
  if len(output) == 0
    echo "Ollama Chat returned an empty response."
  else
    let pos = getpos('.')
    let line = pos[1] - 1
    call append(line, output)
  endif
endfunction

" Sends input to Ollama CLI and displays results in new markdown buffer:
function! OllamaCli(input)
  let response = systemlist('ollama_cli -M "{\"num_ctx\":16384}"', a:input)
  execute 'new'
  execute 'set ft=markdown'
  call append(0, response)
  call cursor(1,1)
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
function! CreateTags()
  silent !create_tags
  redraw!
  if v:shell_error == 0
    echo "Tags created."
  else
    echo output
  end
endfunction

" Generates CScope project tags file using external create_cstags command and provides user feedback on completion or errors:
function! CreateCSTags()
  silent !create_cstags
  redraw!
  if v:shell_error == 0
    echo "Tags created."
  else
    echo output
  end
endfunction

" Edit Configuration, grok `edit foo/bar.rb:23`

" Handles file editing with special case for directory-aware path substitution and background execution:
function! Edit(...)
  let args = copy(a:000)
  if len(args) == 1 && args[0][0:1] == '!/'
    let dir  = system("dirname " . expand('%'))
    let dir  = dir[0:len(dir) - 2]
    let args = [ substitute(args[0], '!', dir, '') ]
  endif
  call system("edit -m " . join(map(copy(args), 'shellescape(v:val)'), ' ') . ' &')
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
command! -range SSLCertInfo <line1>,<line2> :!sed 's/ *//' | tee >(openssl x509 -inform pem -subject -ext subjectAltName -fingerprint -issuer -sha256 -dates) | cat
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
