" TODO kolory APos::core->error  na czerwono

"APos colors
    syn keyword perlTodo			    TODO TBD XXX contained
    syn keyword perlInfo			    MARK CHECKIT CHECK_IT contained
    syn keyword perlWarn 			    DANGER FIXME contained
    syn keyword perlBlock 			    BLOCK BLOCK_RELEASE contained
    syn keyword perlETodo			    Bugs: ETODO ETBD EXXX contained
    syn keyword perlEInfo			    EMARK ECHECKIT ECHECK_IT contained
    syn keyword perlEWarn 			    EFIXME contained
    syn keyword perlTEST_set_mark       set_mark
    syn keyword perlAPos_AC_test_if     TEST
    syn keyword perlAPos_AC_eqtypes     ok like unlike is isa 
    syn keyword perlObjects             with method plugin 
    syn keyword perlAPosParams 		    rq op no_more param_op param_rq typedef
    syn keyword perlExitKeyword         exit die warn confess croak cluck carp
    syn keyword perlOwnerInfoComment    NEO77

    syn match perlDoNotEditThis         "DO NOT EDIT THIS .*" contained
    syn match perlAPosCodeReview        "CodeReview .*" contained
    syn match perlComment		        "#.*" contains=perlTodo,perlInfo,perlWarn,perlBlock,perlETodo,perlEInfo,perlEWarn,perlFS,perlAPosCodeReview
    syn match perlSharpBang	            "^#!.*"
    syn match perlDescription           "^\s*# ----*\s*.*$"
    syn match perlReturnComment         "#\s*RETURN: .*$"
    syn match perlFunctionInfoComment   "#\*.*$" contains=perlDoNotEditThis,perlFS,perlInfo,perlTodo,perlWarn,perlBlock,perlETodo,perlAPosCodeReview
    syn match perlOwnerInfoComment      "#\*.*Owner:.*" contains=perlDoNotEditThis,perlFS,perlInfo,perlTodo,perlWarn,perlBlock,perlETodo,perlAPosCodeReview
    syn match perlAPosDebugComment      "#DBG.*$" contains=perlAPosDebug
    syn match perlAPosDebug             "#DBG>\|#DBG:[0-9]*>" contained
    syn match perlFunctionParams        "\$p_\w*\(\s*\|\"\|'\)"
    syn match perlObjectAttribs         "\$o_\w*\(\s*\|\"\|'\)"
    syn match perlStaticAttribs         "\(\$\|%\|@\)_*[A-Z]\w*\(\s*\|\"\|'\)"
    syn match perlFS                    "\(EXS-\|EXP-\)[0-9]*" contained
    syn match perlTemplateToolkit       "\[%.*%\]"
    syn match perlAPosSysConfigCommand  "\w*" contained
    syn match perlAPosSysConfig         "\$APos::core::SysConfig::" nextgroup=perlAPosSysConfigCommand
    syn match perlAPos_AC_Tvar          "\$T->"
    syn match perlAPosParams            "__@_"
    syn match perlStrzalka              "->"
    syn match perlObjects              /->_execute_plugin(/hs=s+2,he=e-1 contained contains=perlStrzalka
    syn match perlAPos_error             / _error(/hs=s+1,he=e-1
    syn match perlAPosError             /->[Ee]rror(/hs=s+2,he=e-1 contained contains=perlStrzalka
    syn match perlAPosAlert             /->alert(/hs=s+2,he=e-1 contained contains=perlStrzalka
    syn match perlSelf                  "\$self\|\$class"

    syn region perlEndOff               start="#+ end of:.*" end=""  contained
    syn region perlOtherParts           start="#+.*"         end="$" contains=perlEndOff
    syn region perlFileParts            start="^\s*#=-*"     end="^$"  fold
    syn region perlFunctionComment      start="^\s*#=-*\s*$" end="^\s*#=--*"  fold
    syn region perlDescription          start="^\s*#--*\s*$" end="^\s*#---*"  fold
    syn region perlFIXMEreg             start='# SFIXME'     end='# EFIXME'

" rewrited perl.vim syntaxes
    syn keyword perlStatementFiledesc	print_msg nextgroup=perlFiledescStatementComma skipwhite
    syn keyword perlStatementFiledesc	ask inc_indent_msg dec_indent_msg
    syn keyword perlStatementMisc       newgroup todogroup skipgroup

    syn match perlMethod                "->\$*\I\i*" contained nextgroup=perlVarSimpleMember,perlVarMember,perlMethod contains=perlAPosError,perlAPosAlert,perlStrzalka,perlObjects
    syn match perlVarPlain              "\\\=\([@$]\|\$#\)\$*\(\I\i*\)\=\(\(::\|'\)\I\i*\)*\>" nextgroup=perlVarMember,perlVarSimpleMember,perlMethod contains=perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlAPosSysConfig,perlSelf
    syn match perlVarPlain2             "\\\=%\$*\(\I\i*\)\=\(\(::\|'\)\I\i*\)*\>" nextgroup=perlVarMember,perlVarSimpleMember,perlMethod contains=perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlAPosSysConfig
    syn match perlFunctionName          "\\\=&\$*\(\I\i*\)\=\(\(::\|'\)\I\i*\)*\>" nextgroup=perlVarMember,perlVarSimpleMember contains=perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlAPosSysConfig,perlAPosError,perlObjects
    syn match perlString                "\<\I\i*\s*=>"me=e-2 contains=perlFunctionParams,perlObjectAttribs,perlStaticAttribs

    syn cluster perlExpr                contains=perlStatementScalar,perlStatementRegexp,perlStatementNumeric,perlStatementList,perlStatementHash,perlStatementFiles,perlStatementTime,perlStatementMisc,perlVarPlain,perlVarPlain2,perlVarNotInMatches,perlVarSlash,perlVarBlock,perlShellCommand,perlFloat,perlNumber,perlStringUnexpanded,perlString,perlQQ,perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlAPosSysConfig
    syn cluster perlInterpDQ            contains=perlSpecialString,perlVarPlain,perlVarNotInMatches,perlVarSlash,perlVarBlock,perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlSelf

    syn region perlString               matchgroup=perlStringStartEnd start=+"+  end=+"+ contains=@perlInterpDQ,perlFunctionParams,perlObjectAttribs,perlStaticAttribs,perlSelf
    syn match perlSrednik             ";"

"Highlighting
    hi perlDATA                 term=bold ctermfg=DARKGREY                       guifg=#80a0ff gui=bold
    hi perlFunctionComment      term=bold ctermfg=BLUE                           guifg=#80a0ff gui=bold
    hi perlReturnComment        term=bold ctermfg=DARKGRAY                       guifg=#80a0ff gui=bold
    hi perlOwnerInfoComment     term=bold ctermfg=WHITE                          guifg=#80a0ff gui=bold
    hi perlFunctionInfoComment  term=bold ctermfg=DARKGREY                       guifg=#80a0ff gui=bold
    hi perlFunctionParams       term=bold ctermfg=DARKGREEN                      guifg=#80a0ff gui=bold
    hi perlObjectAttribs        term=bold ctermfg=DARKYELLOW                     guifg=#80a0ff gui=bold
    hi perlStaticAttribs        term=bold ctermfg=BLUE                           guifg=#80a0ff gui=bold
    hi perlSelf                 term=bold ctermfg=DARKYELLOW                     guifg=#80a0ff gui=bold
    hi perlTemplateToolkit      term=bold ctermfg=DARKGREY                       guifg=#80a0ff gui=bold
    hi perlTodo                 term=bold ctermfg=BLACK      ctermbg=YELLOW      guifg=#80a0ff gui=bold
    hi perlInfo                 term=bold ctermfg=BLACK      ctermbg=GREEN       guifg=#80a0ff gui=bold
    hi perlWarn                 term=bold ctermfg=BLACK      ctermbg=DARKRED     guifg=#80a0ff gui=bold
    hi perlBlock                term=bold ctermfg=YELLOW      ctermbg=DARKRED     guifg=#80a0ff gui=bold
    hi perlEInfo                term=bold ctermfg=DARKGREEN  ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlEWarn                term=bold ctermfg=DARKRED    ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlETodo                term=bold ctermfg=DARKYELLOW ctermbg=NONe        guifg=#80a0ff gui=bold
    hi perlFS                   term=bold ctermfg=MAGENTA    ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlDebug                term=bold ctermfg=YELLOW     ctermbg=DARKRED     guifg=#80a0ff gui=bold
    hi perlAPosParams           term=bold ctermfg=GREEN      ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlStatementMethod      term=bold ctermfg=GREEN      ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlFileParts            term=bold ctermfg=DARKGREEN  ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlOtherParts           term=bold ctermfg=DARKGREEN  ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlEndOff               term=bold ctermfg=DARKGREY  ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlDescription          term=bold ctermfg=DARKYELLOW ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlTEST_set_mark        term=bold ctermfg=DARKYELLOW ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPos_error           term=bold ctermfg=RED        ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosError            term=bold ctermfg=RED        ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosAlert            term=bold ctermfg=DARKRED    ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlLoopKeyword          term=bold ctermfg=BLUE       ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlExitKeyword          term=bold ctermfg=RED        ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosSysConfig        term=bold ctermfg=DARKGREY   ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosSysConfigCommand term=bold ctermfg=CYAN       ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPos_AC_test_if      term=bold ctermfg=GREEN      ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPos_AC_eqtypes      term=bold ctermfg=BLUE       ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPos_AC_Tvar         term=bold ctermfg=DARKGREY   ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosSafeRunCommand   term=bold ctermfg=DARKYELLOW ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosSafeRun          term=bold ctermfg=DARKYELLOW ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlFIXMEreg             term=bold ctermfg=YELLOW     ctermbg=RED         guifg=#80a0ff gui=bold
    hi perlAPosDebug            term=bold ctermfg=DARKYELLOW ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlAPosDebugComment     term=bold ctermfg=DARKGRAY   ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlDoNotEditThis        term=bold ctermfg=YELLOW     ctermbg=RED         guifg=#80a0ff gui=bold
    hi perlAPosCodeReview       term=bold ctermfg=YELLOW     ctermbg=DARKMAGENTA guifg=#80a0ff gui=bold
    hi perlObjects              term=bold ctermfg=BLUE       ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlStrzalka             term=bold ctermfg=BLUE        ctermbg=NONE        guifg=#80a0ff gui=bold
    hi perlSrednik             term=bold ctermfg=RED        ctermbg=NONE        guifg=#80a0ff gui=bold
