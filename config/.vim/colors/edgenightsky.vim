" Edge Night Sky Vim color scheme
"
" Maintainer:  Bogdan Lazar
" License:    MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "edgenightsky"

if has("gui_running")
  hi Normal guibg=#081a20 guifg=#a9bcd0 gui=NONE
  hi Cursor guibg=#f3d3bd
  hi CursorLine guibg=#172a3a
  hi LineNr guifg=#172a3a
  hi Directory guifg=#a9bcd0 gui=bold
  hi Search guifg=#a9bcd0 guibg=#020e13 gui=NONE
  hi Pmenu guifg=#a9bcd0 guibg=#081a20 gui=NONE
  hi PmenuSel guifg=#081a20 guibg=#172a3a gui=NONE
  hi PMenuSbar guibg=#a9bcd0 gui=NONE
  hi PMenuThumb guibg=#081a20 gui=NONE

  
else
  hi Normal ctermbg=233 ctermfg=146 cterm=NONE
  hi Cursor ctermbg=223
  hi CursorLine ctermbg=235
  hi LineNr ctermfg=235
  hi Directory ctermfg=146 cterm=bold
  hi Search ctermfg=146 ctermbg=232 cterm=NONE
  hi Pmenu ctermfg=146 ctermbg=233 cterm=NONE
  hi PmenuSel ctermfg=233 ctermbg=235 cterm=NONE
  hi PMenuSbar ctermbg=146 cterm=NONE
  hi PMenuThumb ctermbg=233 cterm=NONE

  
endif

hi! link xmlTagName xmlTag
hi! link xmlEndTag xmlTag
hi! link xmlArg xmlTag
hi! link htmlTag xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag xmlEndTag
hi! link htmlArg xmlArg
