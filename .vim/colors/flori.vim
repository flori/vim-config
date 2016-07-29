" Vim color file based on desert.vim

" cool help screens
" :he group-name
" :he highlight-groups

if exists("syntax_on")
   syntax reset
endif
if version > 580
    " no gearantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
      syntax reset
    endif
endif
let g:colors_name="flori"

" general highlight groups
hi Normal ctermfg=230 ctermbg=none
hi ColorColumn ctermbg=234
"hi CursorColumn ctermbg=234
"hi CursorLine ctermbg=234
hi Folded ctermbg=lightgrey ctermfg=black
hi FoldColumn ctermbg=lightgrey ctermfg=black
hi IncSearch ctermbg=214 ctermfg=darkred
hi ModeMsg ctermfg=green
hi MoreMsg ctermfg=green
hi NonText ctermfg=lightblue
hi Question ctermfg=green
hi Search ctermbg=214 ctermfg=darkred
hi Directory ctermfg=208
hi SpecialKey ctermfg=lightgreen
hi VertSplit ctermbg=darkgrey ctermfg=lightgrey cterm=none
hi StatusLine ctermbg=black ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=darkgrey
hi Title ctermfg=157
hi WarningMsg ctermfg=209
hi LineNr ctermfg=darkgrey
hi Pmenu ctermbg=darkgrey ctermfg=lightgrey
hi PmenuSel ctermbg=red ctermfg=lightred
hi PmenuSbar ctermfg=white ctermbg=grey
hi PmenuThumb ctermfg=white ctermbg=black
hi Cursor guifg=white
hi CursorIM guifg=white
hi Visual ctermbg=94
hi VisualNOS ctermbg=243

" syntax highlighting groups
hi Comment ctermfg=darkgrey
"
hi Constant ctermfg=47
hi String ctermfg=209
hi Character ctermfg=green
hi Number ctermfg=darkred
hi Boolean ctermfg=darkred
hi link Float Number
hi Regexp ctermfg=lightred
"
hi Identifier ctermfg=lightgreen
hi Function ctermfg=darkgreen
"
hi Statement ctermfg=yellow
hi Keyword ctermfg=203 cterm=bold
hi Operator ctermfg=196
"
hi PreProc ctermfg=167
"
hi Type ctermfg=green
"
hi Special ctermfg=214
"
hi Underlined cterm=underline
"
hi Ignore ctermfg=darkgrey
"
hi Error ctermfg=yellow ctermbg=196
"
hi Todo ctermfg=196 ctermbg=yellow
"

hi rubyInterpolation ctermfg=223
hi rubyInstanceVariable ctermfg=196
hi rubyClassVariable ctermfg=197
hi rubyGlobalVariable ctermfg=magenta
hi rubyEval ctermfg=darkred
hi rubyBlockParameter ctermfg=164
hi rubyBlockArgument ctermfg=164
hi link rubyEscape              Character
hi link rubySymbol              Function
hi link rubyPseudoVariable      Special
hi link rubyBoolean             Boolean
hi link rubyPredefinedVariable  Special
hi link rubyPredefinedConstant  Constant
hi link rubyConstant            Constant
hi link railsMethod             PreProc
hi link rubyDefine              Keyword
hi link rubyAccess              rubyMethod
hi link rubyAttribute           rubyMethod
hi link rubyException           rubyMethod
hi link rubyInclude             Keyword
hi link rubyStringDelimiter     rubyString
hi link rubyRegexp              Regexp
hi link rubyRegexpDelimiter     rubyRegexp
hi link javascriptRegexpString  Regexp
hi link javascriptNumber        Number
hi link javascriptNull          Constant

" diffing
hi DiffAdd ctermbg=34 ctermfg=white
hi DiffChange ctermbg=166 ctermfg=white
hi DiffText ctermbg=226 ctermfg=124
hi DiffDelete ctermbg=160 ctermfg=white

hi ExtraWhitespace ctermbg=124
match ExtraWhitespace /\s\+$/
