   ------> PLUGINLESS  CONFIG

-- options{{{
local o=vim.opt
o.termguicolors = true            --> enabele guicolors
o.backup = false                  --> creates a backup file
o.number = true                   --> shows number
o.relativenumber = false          --> relative number style
o.signcolumn = "yes"              --> always show the sign column, otherwise it would shift the text each time
o.smarttab = true                 --> When on, a <Tab> in front of a line inserts blanks according to shiftwidth
o.showmode = false                --> we don't need to see things like -- INSERT -- anymore
o.showcmd = false                 --> Show (partial) command in the last line of the screen
o.shortmess = "mnwaoIcCFT"        --> This option helps to avoid all the |hit-enter| prompts
o.hidden = true                   --> required to keep multiple buffers and open multiple buffers
o.cursorline = true               --> show cursorline
o.swapfile = false                --> no swap
o.hlsearch = true                 --> highlight search
o.incsearch = true                --> highlight match while typing search pattern
o.ignorecase = true               --> ignorecase in search
o.smartcase = true                --> no ignore case when pattern has uppercase
o.mouse = "nv"                    --> mouse only for normal and visual mode
o.matchpairs = "(:),{:},[:]"      --> pairs of characters that "%" can match
o.scrolloff = 4                   --> minimum nr. of lines above and below cursor
o.sidescrolloff = 8               --> min. nr. of columns to left and right of cursor
o.updatetime = 300                --> faster completion (4000ms default)
o.timeoutlen = 100                --> time to wait for a mapped sequence to complete (in milliseconds)
o.wrap = false                    --> display lines as one long line
o.whichwrap = "b,s,<,>,[,],h,l"   --> allow specified keys to cross line boundariesk
o.pumheight = 10                  --> item show in popup window,
o.fileencoding = "utf-8"          --> file encoding
o.cmdheight = 0                   --> number of lines to use for the command-line
o.splitbelow = true               --> new window from split is below the current one
o.splitright = true               --> new window is put right of the current one
o.smartindent = true              --> smart autoindenting for C programs
o.autoindent = true               --> take indent for new line from previous line
o.expandtab = true                --> convert tabs to spaces
o.tabstop = 2                     --> insert 2 spaces for a tab
o.shiftwidth = 2                  --> the number of spaces inserted for each indentation
o.foldmethod = "marker"           --> folding by 'foldmarker' "{{{}}}"
o.laststatus = 3                  --> Global/one Status
o.formatoptions = "qjl1"          --> how automatic formatting is to be done
o.completeopt = { "menuone", "noselect" }
--> testing-stage
o.shortmess:append("c") --> hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
o.whichwrap:append("<,>,[,],h,l") --> keys allowed to move to the previous/next line when the beginning/end of line is reached
o.iskeyword:append({ "-" }) --> treats words with `-` as single words
o.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
o.fillchars = { eob = " " } --> hide ~ at the end of the buffer
o.fillchars:append("fold: ") --> hide the fold marker
-- }}}

-- keymap{{{
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = true }

--> set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " --> leader key

--> Escape from different modes
map({ "i", "c", "v", "s" }, "jk", [[<Esc>]])
map({ "i", "c", "v", "s" }, "kj", [[<Esc>]])

--> motion keys for insert mode
map("i", "<C-h>", "<Left>",  { silent = true})
map("i", "<C-l>", "<Right>", { silent = true})
map("i", "<C-j>", "<Down>",  { silent = true})
map("i", "<C-k>", "<Up>",    { silent = true})

--> move between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

--> resize split
map("n", "=", [[<cmd>vertical resize +5<cr>]])
map("n", "-", [[<cmd>vertical resize -5<cr>]])
map("n", "+", [[<cmd>horizontal resize +2<cr>]])
map("n", "_", [[<cmd>horizontal resize -2<cr>]])

--> Move to different buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<leader>d", "<cmd>bd<CR>", opts)
map("n", "<leader>c", "<cmd>close<CR>", opts)
map("n", "<Tab>", "<cmd>tabnext<CR>", opts)

--> insert a new line
map({ "i", "s", "n" }, "fj", "<Esc>o", opts)
map({ "i", "s", "n" }, "jf", "<Esc>o", opts)
map({ "n" }, "<CR>", 'o<Esc>0"_D,v:count1', opts)
map({ "n" }, "<S-CR>", "<Cmd>call append(line('.') -1,repeat([''],v:count1))<CR>", opts)

--> command mode with df and fd
map({ "n" }, "df", [[:]])
map({ "n" }, "fd", [[:]])

--> quit and save
map("n", "<leader>q", "<cmd>qall!<CR>", nosilent) --> quit all
map({ "n" }, "<leader>w", "<cmd>w<CR>", opts) --> save
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", nosilent) --> save

--> move the line up/down left/right
map("v", "H", "<gv", opts)
map("v", "L", ">gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

--> split the window
map("n", "<S-Down>", "<cmd>split<CR>", opts)
map("n", "<S-Left>", "<cmd>vsplit<CR>", opts)
map("n", "<S-Right>", "<cmd>vsplit<CR>", opts)

--> Better paste
map("v", "p", '"_dP', opts)

--> remove all keymaps for for all modes
map("n", "<leader>rk", "<cmd>mapclear<CR><cmd>imapclear<CR>", opts)

--> select all
map("n", "<C-a>", "ggVG", opts)

--> paste from clipboard in insert mode
map("i", "<C-v>", "<C-r>+")

--> Direct changes into the black hole register.
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "x", '"_x')

--> Clone paragraph.
map("n", "cp", "yap<S-}>p")

--> replace the word under the cursor
map({ "n", "i" }, "<A-r>", [[<Esc>:%s/\<<C-r><C-w>\>/]])

vim.cmd([[
"for command mode"
" cm df <Tab>
" cm fd <Tab>
cm df <c-y>
cm fd <c-y>
" --> begging/end of the line "
im <M-i> <c-o>^
im <M-a> <c-o>A
" --> end of the para
im <A-n> <Esc>}o
]])

--> run norm commands in insert mode
map({ "i" }, "<C-i>", "<Esc>u@.")
-- }}}

-- colors{{{
local t = {
  bg                   = "#1a1b26",
  bgFloat              = "#1c1d2a",
  fg                   = "#ABB2BF",
  cursor               = "#FFCC00",
  keyword              = "#10B1FE",
  comment              = "#636D83",
  punctuation          = "#7A82DA",
  method               = "#3FC56B",
  type                 = "#FF6480",
  string               = "#F9C859",
  number               = "#FF78F8",
  constant             = "#9F7EFE",
  tag                  = "#3691FF",
  attribute            = "#FF936A",
  property             = "#CE9887",
  parameter            = "#8bcdef",
  label                = "#50acae",
  ----> workspace
  primary              = "#3691ff",
  selection            = "#274670",
  selectiondim         = "#122938",
  black                = "000000",
  search               = "#1A7247",
  diffAdd              = "#105B3D",
  diffChange           = "#10415B",
  diffDelete           = "#522E34",
  added                = "#177F55",
  changed              = "#1B6E9B",
  deleted              = "#A14D5B",
  error                = "#ff2e3f",
  errorBG              = "#FDCFD1",
  warning              = "#da7a43",
  warningBG            = "#F2DBCF",
  info                 = "#3691ff",
  infoBG               = "#D4E3FA",
  hint                 = "#7982DA",
  mergeCurrent         = "#4B3D3F",
  mergeCurrentLabel    = "#604B47",
  mergeIncoming        = "#2F476B",
  mergeIncomingLabel   = "#305C95",
  mergeParent          = "#ffffff",
  mergeParentLabel     = "#ffffff",
  split                = "#356191",
}

local highlight = {
  Normal               = { fg = t.fg, bg = t.bg }, -- normal text
  Pmenu                = { bg = t.bg },
  PmenuSbar            = { bg = t.bg }, -- Popup menu: scrollbar.
  PmenuThumb           = { bg = t.bg }, -- Popup menu: Thumb of the scrollbar.
  StatusLine           = { bg = t.bg, fg = t.split }, -- status line of current window
  StatusLineNC         = { bg = t.bg, fg = t.split }, -- status lines of not-current windows
  VertSplit            = { fg = t.split }, -- the column separating vertically split windows
  SignColumn           = { bg = t.bg }, -- column where |signs| are displayed
  Question             = { fg = t.primary }, -- |hit-enter| prompt and yes/no questions
  QuickFixLine         = { bg = t.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  SpecialKey           = { fg = t.attribute }, -- Unprintable characters: text displayed differently from what it really is.
  NormalFloat          = { bg = t.bg }, -- Normal text in floating windows.
  NormalSB             = { bg = t.bgFloat }, -- Normal text in floating windows.
  NormalNC             = { bg = t.bg, fg = t.fg }, -- normal text in non-current windows
  Visual               = { fg = t.selection },
  VisualNOS            = { fg = t.selection },
  FloatBorder          = { fg = t.punctuation },
  Directory            = { fg = t.keyword },
  DiffAdd              = { fg = t.diffAdd },
  DiffChange           = { fg = t.diffChange },
  DiffDelete           = { fg = t.diffDelete },
  DiffText             = { fg = t.diffChange },
  Tabline              = { bg = t.bg, fg = t.dim },
  TablineSel           = { bg = t.bg, fg = t.dim },
  TablineFill          = { bg = t.bg },
  EndOfBuffer          = { fg = t.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  TermCursor           = { fg = t.cursor }, -- cursor in a focused terminal
  ModeMsg              = { bg = t.bg, fg = t.fg }, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea              = { fg = t.primary }, -- Area for messages and cmdline
  WarningMsg           = { fg = t.warning },
  WildMenu             = { fg = t.selection }, -- current match in 'wildmenu' completion
  Constant             = { fg = t.constant }, -- (preferred) any constant
  String               = { fg = t.string }, --   a string constant: "this is a string"
  Character            = { fg = t.attribute }, --  a character constant: 'c', '\n'
  Number               = { fg = t.number }, --   a number constant: 234, 0xff
  Boolean              = { fg = t.boolean }, --  a boolean constant: TRUE, false
  Identifier           = { fg = t.fg }, -- (preferred) any variable name
  Function             = { fg = t.method }, -- function name (also: methods for classes)
  Method               = { fg = t.method }, -- function name (also: methods for classes)
  Property             = { fg = t.property },
  Field                = { fg = t.property },
  Parameter            = { fg = t.parameter },
  Statement            = { fg = t.keyword }, -- (preferred) any statement
  Punctuation          = { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
  Operator             = { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
  Keyword              = { fg = t.keyword }, --  any other keyword
  PreProc              = { fg = t.keyword }, -- (preferred) generic Preprocessor
  Type                 = { fg = t.type }, -- (preferred) int, long, char, etc.
  Struct               = { fg = t.type },
  Class                = { fg = t.type },
  Special              = { fg = t.attribute }, -- (preferred) any special symbol
  Attribute            = { fg = t.attribute }, -- (preferred) any special symbol
  Tag                  = { fg = t.tag }, --    you can use CTRL-] on this
  Underlined           = { "gui=underline" }, -- (preferred) text that stands out, HTML links
  Bold                 = { "gui=bold" },
  Italic               = { "gui=italic" },
  Ignore               = { bg = t.bg }, -- (preferred) left blank, hidden  |hl-Ignore|
  Error                = { fg = t.error }, -- (preferred) any erroneous construct
  Todo                 = { bg = t.attribute, fg = t.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
}



----> apply highlights
for group, colors in pairs(highlight) do
  local fg = colors.fg and "guifg=" .. colors.fg or "gui=NONE"
  local bg = colors.bg and "guibg=" .. colors.bg or "gui=NONE"
  local sp = colors.sp and "guisp=" .. colors.sp or ""
  local gui = colors.gui and "gui=" .. colors.gui or "gui=NONE"
  vim.api.nvim_command("highlight " .. group .. " " .. fg .. " " .. bg .. " " .. sp .. " " .. gui)
end
-- }}}

-- lets overwrite color scheme{{{
local hilight=vim.cmd.highlight
local overWriteColors = {
    MsgArea             = "guifg=#00ff98",                          --> message area's textcolor
    CursorLine          = "guibg=#232534",                          --> cursorLine background
    LineNr              = "guifg=#233d46",                          --> left side line number
    CursorLineNr        = "guifg=#247c99 term=bold gui=bold",       --> current line number
    Folded              = "guibg=#1e202c guifg=#585992",                          --> fold text color
    Search              = "guibg=#2c3841",                          --> search text color
    comment             = "guifg=#5f4f5f",                          --> comment color
    MatchParen          = "guibg=#2f3c41 guifg=#80b3e6",            --> MatchParen ('()') color
    Statusline          = "guifg=#356191 guibg=Normal",             --> statusline of current window
    StatusLineNC        = "guifg=#356191 guibg=Normal",             --> statusline of non-current window
    signcolumn          = "guibg=#1a1b26",                          --> signcolumn color
    FloatBorder         = "guifg=#2a2b36",                          --> floting window border
    TabLine             = "guibg=#1a1b26 guifg=#3a3b36 gui=NONE",   --> tab pages line, not active tab page label
    TabLineFill         = "guibg=#1a1b26 guifg=#1a1b26",            --> tab pages line, where there are no labels
    TabLineSel          = "guibg=#ffff44 guifg=#00000",             --> tab pages line, active tab page label
    NormalSB            = "guibg=#1a1b26 guifg=#4d4d4d",            --> Normal text in floating windows.
    VisualNOS           = "guibg=#333333",                          --> Visual mode selection when vim is "Not Owning the Selection".
}

for k,v in pairs(overWriteColors) do
    hilight({k,v})
end
-- }}}
