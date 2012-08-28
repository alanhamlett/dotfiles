" Vim color file
" Maintainer:   Alan Hamlett <alan.hamlett@gmail.com>
" Website:      https://github.com/alanhamlett/Alan-vimrc

set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="Notepad++ 256 Light"

" Baseline Normal text
hi Normal guifg=#000000 ctermfg=0 guibg=#ffffff ctermbg=15

" Default Groups
"hi ColorColumn
"hi Conceal
hi Cursor guifg=#ffffff ctermfg=15 guibg=#000000 ctermbg=0
"hi CursorIM
"hi CursorColumn
hi CursorLine guifg=NONE ctermfg=NONE guibg=#E8E8FF ctermbg=189
"set cursorline
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg guifg=#000000 ctermfg=0 guibg=NONE ctermbg=NONE
"hi VertSplit
hi Folded guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE
"hi FoldColumn
"hi SignColumn
hi IncSearch guibg=#00FF00 ctermbg=10
"hi LineNr guifg=#808080 ctermfg=244 guibg=#e4e4e4 ctermbg=7
hi LineNr guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE
hi MatchParen guifg=#FF0000 ctermfg=9 guibg=NONE ctermbg=NONE
"hi ModeMsg guifg=#f5f5f5 ctermfg=15 guibg=#000000 ctermbg=0
"hi MoreMsg guifg=#f5f5f5 ctermfg=15 guibg=#000000 ctermbg=0
"hi NonText guifg=#f5f5f5 ctermfg=15 guibg=#000000 ctermbg=0
"hi Pmenu
"hi PmenuSel
"hi PmenuSbar
"hi PmenuThumb
"hi Question guifg=#f5f5f5 ctermfg=15 guibg=#000000 ctermbg=0
hi Search guibg=#00FF00 ctermbg=10
"hi SpecialKey
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
hi StatusLine guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi StatusLineNC guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi TabLine guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi TabLineFill guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi TabLineSel guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi Title guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi Visual guibg=#C0C0C0 ctermbg=250
hi VisualNOS guibg=#C0C0C0 ctermbg=250
"hi WarningMsg
"hi WildMenu
hi Menu guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi Scrollbar guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0
hi Tooltip guifg=#cccccc ctermfg=252 guibg=#000000 ctermbg=0

" Syntax Groups
hi Comment guifg=#008000 ctermfg=28 guibg=NONE ctermbg=NONE
hi Constant guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE
    hi String guifg=#333333 ctermfg=250 guibg=NONE ctermbg=NONE
    hi Character guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE
    hi Number guifg=#FF0000 ctermfg=9 guibg=NONE ctermbg=NONE
    hi Boolean guifg=#FF0000 ctermfg=9 guibg=NONE ctermbg=NONE
    hi Float guifg=#FF0000 ctermfg=9 guibg=NONE ctermbg=NONE
    hi perlShellCommand guifg=#8080FF ctermfg=105 guibg=#F8FEDE ctermbg=230
hi Identifier guifg=#FF8000 ctermfg=208 guibg=NONE ctermbg=NONE
    "hi Function
    hi perlPackageConst guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE
    hi perlMethod guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi perlVarPlain guifg=#FF8000 ctermfg=208 guibg=NONE ctermbg=NONE
    hi perlVarPlain2 guifg=#FF8000 ctermfg=208 guibg=NONE ctermbg=NONE
    "hi perlVarPlain guifg=#CF34CF ctermfg=170 guibg=NONE ctermbg=NONE
    "hi perlVarPlain guifg=#8080C0 ctermfg=103 guibg=NONE ctermbg=NONE
    hi perlVarSimpleMember guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi pythonDecorator guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
hi Statement guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi Conditional guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    "hi Repeat
    "hi Label
    "hi Operator
    "hi Keyword
    "hi Exception
    hi perlFunction guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlStatementSub guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlSubName guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi perlFunctionName guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi perlStatementFiledesc guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlStatementPackage guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlStatementInclude guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlStatementStorage guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    hi perlStatementControl guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi perlStatementFlow guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
    hi perlMatchStartEnd guifg=#8080FF ctermfg=105 guibg=#F8FEDE ctermbg=230
    hi perlMatch guifg=#8080FF ctermfg=105 guibg=#F8FEDE ctermbg=230
    hi perlSpecialString guifg=#8080FF ctermfg=105 guibg=#F8FEDE ctermbg=230
    hi perlSpecialMatch guifg=#8080FF ctermfg=105 guibg=#F8FEDE ctermbg=230
    hi pythonFunction guifg=#000080 ctermfg=18 guibg=NONE ctermbg=NONE
hi PreProc guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
    "hi Include
    "hi Define
    "hi Macro
    "hi PreCondit
    hi perlControl guifg=#0000FF ctermfg=21 guibg=NONE ctermbg=NONE
hi Type guifg=#804000 ctermfg=94 guibg=NONE ctermbg=NONE
    "hi StorageClass
    "hi Structure
    "hi Typedef
hi Special guifg=#0000f0 ctermfg=4
    "hi SpecialChar
    "hi Tag
    "hi Delimiter
    "hi SpecialComment
    "hi Debug
hi Underlined guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE
"hi Ignore
hi Error guifg=#FF80C0 ctermfg=211 guibg=NONE ctermbg=NONE
hi Todo guifg=#008000 ctermfg=28 guibg=NONE ctermbg=NONE

