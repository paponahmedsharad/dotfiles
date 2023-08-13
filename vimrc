"===) OPTIONS{{{
"--> looks and feels
"------------------------------------------------------------------------------------------------------
set encoding=utf8                    " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix                         " Use Unix as the standard file type
set mouse=a
set clipboard=unnamedplus
set timeoutlen=100

set termguicolors                    " Important for color
syntax enable                        " Enable syntax highlighting
set foldcolumn=8                    " Add a bit extra margin to the left
set cursorline                       " Hilight current line background
" => Status line
set laststatus=0                     " Always show the status line 2, no statusline
set showtabline=0                    " Don't show tab
" Don't show tab
set showtabline=0
set splitbelow
set splitright
" => Text, tab and indent related
set expandtab                        " Use spaces instead of tabs
set smarttab                         " Be smart when using tabs ;)
set shiftwidth=4                     " 1 tab == 4 spaces
set tabstop=4
set foldmethod=marker                " fold with mark
set lbr                              " Linebreak on 500 characters
set tw=500
set ai                               "Auto indent
set si                               "Smart indent
set nowrap                           "Wrap lines
set regexpengine=0                   " Set regular expression engine automatically
"set background=dark
set ruler                            " Always show current position
set cmdheight=1                      " Height of the command bar
set hid                              " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent       " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                       " Ignore case when searching
set smartcase                        " When searching try to be smart about cases
set hlsearch                         " Highlight search results
set incsearch                        " Makes search act like search in modern browsers
set lazyredraw                       " Don't redraw while executing macros (good performance config)
set magic                            " For regular expressions turn magic on
set showmatch                        " Show matching brackets when text indicator is over them
set mat=2                            " How many tenths of a second to blink when matching brackets
set so=5                             " Set 5 lines to the cursor - when moving vertically using j/k
set wildmenu                         " Turn on the Wild menu

set shortmess=mnwaoIcCFT             " avoid hit enter
set formatoptions=qjl1
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set history=500                      " Sets how many lines of history VIM has to remember
filetype plugin on                   " Enable filetype plugins
filetype indent on
set autoread                         " Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime

" Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set t_Co=256
set guitablabel=%M\ %t
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"==>  Completion
if exists('&completeopt')
  set completeopt=longest       " Start with longest part
  set completeopt+=menu,preview "  then show a menu
endif

"==> Command-line
set wildmenu                    " Use a menu to show tab-completions
set wildmode=longest:full,full  " Complete longest, tab through matches
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set cedit=<C-o>



"===> MORE OPTIONS
"==>  Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"==>  Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
let save_cursor = getpos(".")
let old_query = getreg('/')
silent! %s/\s\+$//e
call setpos('.', save_cursor)
call setreg('/', old_query)
endfun

if has("autocmd")
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"--> looks and feels
"==> how cursor will look in insert mode
let &t_SI = "\<Esc>[5 q"
"==> cursor will or not in normal mode
let &t_SR = "\<Esc>[5 q"
let &t_EI = "\<Esc>[2 q"


"==> folds looks
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '-->' . printf("%13s", lines_count . ' Lines') . ' ' . printf("%200s",' ')
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(' ' . repeat(foldchar, v:foldlevel*0) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return  foldtextstart . foldtextend . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()



" Specify the behavior when switching between buffers
" try
" set switchbuf=useopen,usetab,newtab
" set stal=2
" catch
" endtry

"}}}
"===) COLORSCHEME{{{

set background=dark
highlight clear

if exists("syntax_on")
syntax reset
endif
" let g:colors_name = "bluloco"

" Terminal colors
let g:terminal_color_0  = '#5c6370'
let g:terminal_color_1  = '#fc2f52'
let g:terminal_color_2  = '#25a45c'
let g:terminal_color_3  = '#ff936a'
let g:terminal_color_4  = '#3476ff'
let g:terminal_color_5  = '#9f7efe'
let g:terminal_color_6  = '#4483aa'
let g:terminal_color_7  = '#d5ddea'
let g:terminal_color_8  = '#747d8d'
let g:terminal_color_9  = '#ff6480'
let g:terminal_color_10 = '#3fc56b'
let g:terminal_color_11 = '#f9c859'
let g:terminal_color_12 = '#10b1fe'
let g:terminal_color_13 = '#ff78f8'
let g:terminal_color_14 = '#5fb9bc'
let g:terminal_color_15 = '#ffffff'

" Indent guide colors
let g:indentLine_color_term = 242
let g:indentLine_color_gui = '#747d8d'

hi Cursor         guifg=#1a1b26                   guibg=#ff0000
hi lCursor        guifg=#1a1b26                   guibg=#ffcc00
"hiCursor         ctermfg=17       ctermbg=220      cterm=NONE        guifg=#1a1b26     guibg=#ffcc00   gui=NONE
hi Visual         ctermfg=NONE     ctermbg=59       cterm=NONE        guifg=NONE        guibg=#3e4451   gui=NONE
hi CursorLine     ctermfg=NONE     ctermbg=59       cterm=NONE        guifg=NONE        guibg=#232534   gui=NONE
hi CursorColumn   ctermfg=NONE     ctermbg=59       cterm=NONE        guifg=NONE        guibg=#353942   gui=NONE
hi ColorColumn    ctermfg=NONE     ctermbg=59       cterm=NONE        guifg=NONE        guibg=#353942   gui=NONE
"hi LineNr        ctermfg=242      ctermbg=NONE     cterm=NONE        guifg=#747d8d     guibg=NONE      gui=NONE
hi LineNr         ctermfg=242      ctermbg=NONE     cterm=NONE        guifg=#1b2e3e     guibg=NONE      gui=NONE
hi CursorLineNr   ctermfg=Yellow   ctermbg=NONE     cterm=bold        guifg=#ffcc00     guibg=NONE      gui=bold
"hi ursorLineNr     ctermfg=Yellow   ctermbg=NONE      cterm=bold        guifg=#247c99   guibg=NONE      gui=bold
hi VertSplit      ctermfg=59       ctermbg=59       cterm=NONE        guifg=#4e535c     guibg=#4e535c   gui=NONE
"hi MatchParen       ctermfg=39       ctermbg=NONE      cterm=underline   guifg=#10b1fe   guibg=NONE      gui=underline
hi MatchParen     ctermfg=249                       ctermbg=105       cterm=bold        guibg=#2a3b46   guifg=#b9c0cb   gui=bold
hi StatusLine     ctermfg=145      ctermbg=59       cterm=bold        guifg=#abb2bf     guibg=#4e535c   gui=bold
hi StatusLineNC   ctermfg=145      ctermbg=59       cterm=NONE        guifg=#abb2bf     guibg=#4e535c   gui=NONE
hi Pmenu          ctermfg=249      ctermbg=235      guibg=#22252a     guifg=#b9c0cb
hi PmenuSel       ctermfg=white                     ctermbg=27                          guifg=white     guibg=#3691ff
hi PmenuSbar      ctermbg=235      guibg=#22252a
hi PmenuThumb     ctermbg=242      guibg=#747d8d
hi IncSearch      ctermfg=17       ctermbg=221      cterm=NONE        guifg=#1a1b26     guibg=#f9c859   gui=NONE
hi Search         ctermfg=NONE     ctermbg=NONE     cterm=underline   guifg=NONE        guibg=NONE      gui=underline
"  hi             Directory        ctermfg=221      ctermbg=NONE      cterm=NONE        guifg=#f9c859   guibg=NONE      gui=NONE
hi Directory      ctermfg=39       ctermbg=NONE     cterm=NONE        guifg=#10b1fe     guibg=NONE      gui=NONE
hi Folded         ctermfg=60       ctermbg=17       cterm=NONE        guifg=#636d83     guibg=#1a1b26   gui=NONE
hi Question       ctermfg=31       guifg=#5fb9bc
hi TabLine        ctermfg=242      ctermbg=235      guifg=#747d8d     guibg=#25272d
hi TabLineSel     ctermbg=236      cterm=bold       gui=bold          guibg=#1a1b26
hi TabLineFill    ctermfg=235      guifg=#22252a
hi WildMenu       cterm=bold        ctermfg=254       ctermbg=27      gui=bold        guifg=#e7f0ff   guibg=#3691ff

hi Normal         ctermfg=145    ctermbg=17     cterm=NONE           guifg=#abb2bf   guibg=#1a1b26   gui=NONE
hi Boolean        ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi Character      ctermfg=141    ctermbg=NONE   cterm=NONE           guifg=#9f7efe   guibg=NONE      gui=NONE
hi Comment        ctermfg=60     ctermbg=NONE   cterm=NONE           guifg=#636d83   guibg=NONE      gui=NONE
hi Conditional    ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi Constant       ctermfg=141    ctermbg=NONE   cterm=NONE           guifg=#9f7efe   guibg=NONE      gui=NONE
hi Define         ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi DiffAdd        ctermbg=22     guibg=#27543a
hi DiffChange     ctermbg=24     guibg=#004766
hi DiffText                      ctermbg=24     guibg=#00608a
hi DiffDelete     ctermfg=131    guifg=#803434  ctermbg=NONE         guibg=NONE
hi diffAdded                     ctermbg=22     guibg=#2b663f
hi diffRemoved    ctermbg=131    guibg=#803434  ctermfg=NONE         guifg=NONE
hi ErrorMsg       ctermfg=197    ctermbg=59     cterm=NONE           guifg=#fc2f52   guibg=#3e4451   gui=NONE
hi Error          ctermfg=197    ctermbg=59     cterm=NONE           guifg=#fc2f52   guibg=#3e4451   gui=NONE
hi WarningMsg     ctermfg=197    ctermbg=59     cterm=NONE           guifg=#fc2f52   guibg=#3e4451   gui=NONE
hi Float          ctermfg=213    ctermbg=NONE   cterm=NONE           guifg=#ff78f8   guibg=NONE      gui=NONE
hi Function       ctermfg=77     ctermbg=NONE   cterm=NONE           guifg=#3fc56b   guibg=NONE      gui=NONE
hi Identifier     ctermfg=138    ctermbg=NONE   cterm=NONE           guifg=#ce9887   guibg=NONE      gui=NONE
hi Keyword        ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi Label          ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f9c859   guibg=NONE      gui=NONE
hi NonText        ctermfg=59     ctermbg=17     cterm=NONE           guifg=#545862   guibg=#1a1b26   gui=NONE
hi Number         ctermfg=213    ctermbg=NONE   cterm=NONE           guifg=#ff78f8   guibg=NONE      gui=NONE
hi Operator       ctermfg=104    ctermbg=NONE   cterm=NONE           guifg=#7a82da   guibg=NONE      gui=NONE
hi Parameter                     cterm=NONE     ctermfg=81           gui=NONE              guifg=#8bcdef
hi PreProc        ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi Special        ctermfg=209    ctermbg=NONE   cterm=NONE           guifg=#ff936a   guibg=NONE      gui=NONE
hi SpecialKey     ctermfg=59     ctermbg=59     cterm=NONE           guifg=#545862   guibg=#353942   gui=NONE
hi Statement      ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi StorageClass   ctermfg=39     ctermbg=NONE   cterm=NONE           guifg=#10b1fe   guibg=NONE      gui=NONE
hi String         ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f9c859   guibg=NONE      gui=NONE
hi Tag            ctermfg=69     ctermbg=NONE   cterm=NONE           guifg=#3691ff   guibg=NONE      gui=NONE
hi Title          ctermfg=145    ctermbg=NONE   cterm=bold           guifg=#abb2bf   guibg=NONE      gui=bold
hi Todo           ctermfg=60     ctermbg=NONE   cterm=inverse,bold   guifg=#636d83   guibg=NONE      gui=inverse,bold
hi Type           ctermfg=204    ctermbg=NONE   cterm=NONE           guifg=#ff6480   guibg=NONE      gui=NONE
hi Underlined     ctermfg=NONE   ctermbg=NONE   cterm=underline      guifg=NONE      guibg=NONE      gui=underline


hi link Class Type
hi link Attribute Special
hi link Field Identifier
hi link Punctuation Operator


hi   htmlTag           ctermfg=NONE   ctermbg=NONE   cterm=NONE   guifg=NONE      guibg=NONE   gui=NONE
hi   htmlEndTag        ctermfg=NONE   ctermbg=NONE   cterm=NONE   guifg=NONE      guibg=NONE   gui=NONE
hi   htmlTagName       ctermfg=NONE   ctermbg=NONE   cterm=NONE   guifg=NONE      guibg=NONE   gui=NONE
hi   htmlArg           ctermfg=NONE   ctermbg=NONE   cterm=NONE   guifg=NONE      guibg=NONE   gui=NONE
hi   htmlSpecialChar   ctermfg=141    ctermbg=NONE   cterm=NONE   guifg=#9f7efe   guibg=NONE   gui=NONE

hi   yamlKey              ctermfg=174   ctermbg=NONE   cterm=NONE   guifg=#ce9887   guibg=NONE   gui=NONE
hi   yamlAnchor           ctermfg=145   ctermbg=NONE   cterm=NONE   guifg=#abb2bf   guibg=NONE   gui=NONE
hi   yamlAlias            ctermfg=145   ctermbg=NONE   cterm=NONE   guifg=#abb2bf   guibg=NONE   gui=NONE
hi   yamlDocumentHeader   ctermfg=221   ctermbg=NONE   cterm=NONE   guifg=#f9c859   guibg=NONE   gui=NONE

hi   cssURL             ctermfg=117   ctermbg=NONE   cterm=NONE   guifg=#8bcdef   guibg=NONE   gui=NONE
hi   cssFunctionName    ctermfg=77    ctermbg=NONE   cterm=NONE   guifg=#3fc56b   guibg=NONE   gui=NONE
hi   cssColor           ctermfg=221   ctermbg=NONE   cterm=NONE   guifg=#f9c859   guibg=NONE   gui=NONE
hi   cssPseudoClassId   ctermfg=209   ctermbg=NONE   cterm=NONE   guifg=#ff936a   guibg=NONE   gui=NONE
hi   cssClassName       ctermfg=209   ctermbg=NONE   cterm=NONE   guifg=#ff936a   guibg=NONE   gui=NONE
hi   cssValueLength     ctermfg=213   ctermbg=NONE   cterm=NONE   guifg=#ff78f8   guibg=NONE   gui=NONE
hi   cssCommonAttr      ctermfg=221   ctermbg=NONE   cterm=NONE   guifg=#f9c859   guibg=NONE   gui=NONE
hi   cssBraces          ctermfg=104   ctermbg=NONE   cterm=NONE   guifg=#7a82da   guibg=NONE   gui=NONE

" css
hi link cssAttributeSelector Attribute
hi link cssFontDescriptor Keyword
hi link cssImportant Keyword
hi link cssTagName Tag
hi link cssProp Field
hi link cssSelectorOp Operator
hi link cssSelectorOp2 Operator
hi link cssAttrComma Punctuation
hi link cssNoise Punctuation
hi link cssFunctionComma Punctuation
hi link cssAttrRegion Operator
hi link cssIdentifier Class
hi link cssAttr String
hi link cssFontDescriptorFunction String
hi link cssUnitDecorators String

" html
hi link htmlTag Tag
hi link htmlSpecialTagName Tag
hi link htmlEndTag Tag
hi link htmlTagName Tag
hi link htmlArg Attribute

" vim
hi link vimFunction Function
hi link vimParenSep Punctuation

" javascript
hi link javaScriptBraces Punctuation
hi link javaScriptParens Punctuation
hi link javaScriptNumber Number
hi link javaScriptIdentifier Statement
hi link javaScriptFunction Statement
hi link javaScriptBoolean Keyword

" vim-javascript
hi link jsGlobalObjects Constant
hi link jsEnvComment Comment
hi link jsStorageClass Keyword
hi link jsFunction Keyword
hi link jsThis Keyword
hi link jsBooleanTrue Keyword
hi link jsBooleanFalse Keyword
hi link jsDot Punctuation
hi link jsObjectBraces Punctuation
hi link jsClassBraces Punctuation
hi link jsDestructuringBraces Punctuation
hi link jsTemplateBraces Punctuation
hi link jsIfElseBraces Punctuation
hi link jsFuncParens Punctuation
hi link jsFuncBraces Punctuation
hi link jsBrackets Punctuation
hi link jsObjectSeparator Punctuation
hi link jsParens Punctuation
hi link jsNoise Punctuation
hi link jsArrowFunction Keyword
hi link jsFuncArgs Parameter
hi link jsFuncCall Function
hi link jsObjectProp Field
hi link jsObjectKey Field
hi link jsSpecial Attribute
hi link jsClassDefinition Class
hi link jsRegexpGroup Field
hi link jsRegexpQuantifier Operator
hi link jsRegexpBoundary Keyword

" yats
hi link typescriptIdentifierName Normal
hi link typescriptFuncCallArg Normal
hi link typescriptOperator Operator
hi link typescriptTemplateSB Punctuation
hi link typescriptBraces Punctuation
hi link typescriptObjectColon Punctuation
hi link typescriptTypeBrackets Punctuation
hi link typescriptParens Punctuation
hi link typescriptTypeAnnotation Punctuation
hi link typescriptDotNotation Punctuation
hi link typescriptNumber Number
hi link typescriptIdentifier Statement
hi link typescriptFunction Statement
hi link typescriptBoolean Keyword
hi link typescriptImport Keyword
hi link typescriptExport Keyword
hi link typescriptEnumKeyword Keyword
hi link typescriptVariable Keyword
hi link typescriptPredefinedType Keyword
hi link typescriptArrowFuncParamter Keyword
hi link typescriptArrowFunc Keyword
hi link typescriptMethodAccessor Keyword
hi link typescriptCastKeyword Keyword
hi link typescriptGlobal Class
hi link typescriptClassName Class
hi link typescriptTypeParameter Type
hi link typescriptAliasDeclaration Type
hi link typescriptDecorator Function
hi link typescriptHeadersMethod Function
hi link typescriptBOMLocationMethod Function
hi link typescriptArrayMethod Function
hi link typescriptStringMethod Function
hi link typescriptPromiseMethod Function
hi link typescriptCacheMethod Function
hi link typescriptCall Parameter
hi link typescriptArrowFuncArg Parameter
hi link typescriptMember Field
hi link typescriptObjectLabel Field
hi link typescriptProp Field


" leafgarland/typescript-vim
hi link typescriptBraces Punctuation
hi link typescriptInterpolationDelimiter Punctuation
hi link typescriptLogicSymbols Operator
hi link typescriptDocTags Comment
hi link typescriptDocParam Comment
hi link typescriptDecorators Function
hi link typescriptFuncKeyword Keyword
hi link typescriptReserved Keyword


" NERDTree
hi link NERDTreeHelp Normal
hi link NERDTreeCWD String
hi link NERDTreeDirSlash Punctuation

"netrw
hi link netrwClassify Punctuation
hi link netrwLink Punctuation

" markdown
hi link mkdHeading Keyword
hi link mkdDelimiter Punctuation
hi link mkdCodeDelimiter Punctuation
hi link mkdListItem Punctuation
hi link mkdLink Tag
hi link mkdInlineURL Tag
hi link mkdCode Field
hi link mkdBold Class
hi link mkdItalic Attribute
" vim: sw=2



"==> left side
hi foldcolumn guibg=#1a1b26 guifg=#1a1b26
"==> no ~ sign
highlight EndOfBuffer guifg=#1a1b26
"==> split
hi VertSplit guibg=#242530 guifg=#242530
hi statusline guibg=#242530 guifg=#442530
hi statuslinenc guibg=#242530 guifg=#242530

"==> commnet
hi Comment guifg=#636d83 guibg=#1a1b26 gui=bold
"==> fold
hi Folded guibg=#2a2b36 guifg=#9a8b56 gui=bold


"==> popup menu
hi Pmenu guibg=#2b1c26
hi PmenuSel guibg=#3a3b46
hi PmenuThumb guifg=black guibg=#4a2c26
hi PmenuSbar guibg=#2b2c26 guifg=#2b2c26

"}}}
"===) KEYBINDINGS{{{
"--> plugins-config
"====================================================================================>
"==> use space as mapleader
let mapleader = " "
"==> save
nmap <leader>w :w!<cr>
"==> W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"==> exit vim
nmap <leader>q :qall!<cr>
"==> Escape insert mode
imap jk <Esc>
imap kj <Esc>
"==> command mode with ; insted of :
nnoremap ; :
nnoremap df :
nnoremap fd :
"==> close current window
nmap <leader>c <C-w>q
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT


"==> Visual mode pressing *(next) or #(previous) searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"==> move end/beganing of the current line
imap <M-i> <c-o>^
imap <M-a> <c-o>A
"==> insert new line by pressing enter key
nmap <CR> o<Esc>0"_D,v:count1
"==> goto end of the para with a new line
imap <A-n> <Esc>}o
"==> remap 0 to end of the line
map 0 $
"==> change the word under cursor
nmap <A-r> <Esc>:%s/\<<C-r><C-w>\>/
"==> select current block/paragraph
nnoremap <leader>v (V)
" select all
map <C-a> ggVG
"==> Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"==> copy to system clipboard in wayland session
 xnoremap y y:call system("wl-copy", @")<cr>
 xnoremap <leader>y y:call system("wl-copy", @")<cr>
" xnoremap <silent> <leader>y :w !wl-copy<CR><CR>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


"==> easy way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"==> move to next and previous buffer
map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>
"==> Quickly open a buffer for scribble
map <leader>ob :e ~/buffer<cr>
"==> close current buffer
nmap <leader>b :bdelete<cr>


"==> Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
"==> Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/


"==> Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc


"==> Spell checking; Pressing ,sc will toggle and untoggle spell checking
map <leader>sc :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>


" Map auto complete of (, ", ', [
inoremap (( ()<esc>i
inoremap [[ []<esc>i
inoremap {{ {}<esc>i
inoremap { {<esc>o}<esc>O
inoremap '' ''<esc>i
inoremap "" ""<esc>i
inoremap <C-i> "==>


"==> COMPILE FUNCTION
func! CompileRun()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python3 %"
elseif &filetype == 'javascript'
exec "!deno run %"
elseif &filetype == 'html'
exec "!firefox-developer-edition % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
endif
endfunc
"==> run/compile current file
map <F5> :call CompileRun()<CR>
map <leader>r :call CompileRun()<CR>


" => JavaScript section
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript,typescript imap <C-t> console.log();<esc>hi
au FileType javascript,typescript imap clg console.log();<esc>hi
au FileType javascript,typescript imap <C-a> alert();<esc>hi
au FileType javascript,typescript inoremap <buffer> $r return
au FileType javascript,typescript inoremap <buffer> $f // --- PH<esc>FP2xi
"==> javascript code format
nmap <A-p> :%!js-beautify<cr>
"==> autowrite for jvascript file
au FileType javascript, autocmd TextChanged,TextChangedI <buffer> silent write


"==> TOGGLE OPTIONS
" nmap <leader>on :set nu!<cr>
nmap <leader>on :set number relativenumber!<cr>


"--> PLUGINS-CONFIG
"==> fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true, 'yoffset': 1.0 } }
nmap <leader>f :FZF<cr>
nmap <leader>h :History<cr>
"==> comment
nmap co gcc
vmap co gc
"==> zen mode
noremap <M-z> :Goyo 250<cr>
"==> emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_leader_key='<C-Z>'
imap df <C-Y>,
imap fd <C-Y>,
imap fj <C-O>o
imap jf <C-O>o
"==> color-picker
nmap <C-p> :VCoolor<cr>

"}}}




" LOADS PLUGINS
set rtp+=~/.vim/plugins/*

"  TESTING 
highlight MyGroup ctermbg=green guibg=#1a1b26 guifg=#3a4b95
let m = matchadd("MyGroup", '"==>')
highlight TODOs ctermbg=green guibg=#565B70 guifg=grey gui=bold
let m = matchadd("TODOs", ' TESTING ')
