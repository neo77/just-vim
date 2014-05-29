" TODO kolory APos::core->error  na czerwono

"APos colors
    syn keyword exportKeep 		        KEEP_RECORD KEEP_LINE
    syn keyword exportSkip              SKIP_RECORD SKIP_LINE
    syn keyword exportConst             IN_HEADER OUT_HEADER BOTH_HEADERS
"Highlighting
    hi exportKeep               term=bold ctermfg=GREEN     ctermbg=NONE         guifg=#80a0ff gui=bold
    hi exportSkip               term=bold ctermfg=RED     ctermbg=NONE         guifg=#80a0ff gui=bold
    hi exportConst              term=bold ctermfg=BLUE     ctermbg=NONE         guifg=#80a0ff gui=bold
