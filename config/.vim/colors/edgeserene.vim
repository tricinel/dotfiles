" Edge Serene Vim color scheme
"
" Maintainer:  Bogdan Lazar
" License:    MIT

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "edgeserene"

if has("gui_running")
  hi Normal guibg=#fdf6e3 guifg=#633f24 gui=NONE
  hi Cursor guibg=#633f24
  hi CursorLine guibg=#eae1cb
  hi LineNr guifg=#eae1cb
  hi Directory guifg=#633f24 gui=bold
  hi Search guifg=#633f24 guibg=#ddc990 gui=NONE
  hi Pmenu guifg=#633f24 guibg=#fdf6e3 gui=NONE
  hi PmenuSel guifg=#fdf6e3 guibg=#eae1cb gui=NONE
  hi PMenuSbar guibg=#633f24 gui=NONE
  hi PMenuThumb guibg=#fdf6e3 gui=NONE

  
else
  hi Normal ctermbg=230 ctermfg=238 cterm=NONE
  hi Cursor ctermbg=238
  hi CursorLine ctermbg=253
  hi LineNr ctermfg=253
  hi Directory ctermfg=238 cterm=bold
  hi Search ctermfg=238 ctermbg=186 cterm=NONE
  hi Pmenu ctermfg=238 ctermbg=230 cterm=NONE
  hi PmenuSel ctermfg=230 ctermbg=253 cterm=NONE
  hi PMenuSbar ctermbg=238 cterm=NONE
  hi PMenuThumb ctermbg=230 cterm=NONE

  
endif

hi! link xmlTagName xmlTag
hi! link xmlEndTag xmlTag
hi! link xmlArg xmlTag
hi! link htmlTag xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag xmlEndTag
hi! link htmlArg xmlArg