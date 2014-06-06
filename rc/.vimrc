" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"---------------------------------------------------
" keyboard works also in GNU Screen as it should
"--------------------------------------------------
if match($TERM, "screen")!=-1
      set term=xterm
endif

source $HOME/.vim/vim-functions


" set language of messages to C
lang mes C

"-------------------------------------------------------------------------------
" vim options (to check)
"-------------------------------------------------------------------------------
set nocompatible
set bs=2
set background=dark
" no line break after whitespace on long lines 
set textwidth=0
set ruler
set showmode
set autoindent
set incsearch
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set softtabstop=4
set dictionary=$HOME/workspace/Liban/tags,$HOME/workspace/APos/APos/tags,$HOME/perl5/perlbrew/perls/perl-5.12.5/tags,$HOME/.vim/dict/sql-dict
set tags=$HOME/workspace/Liban/tags,$HOME/workspace/APos/APos/tags,$HOME/perl5/perlbrew/perls/perl-5.12.5/tags
set complete=.,b,w
set completeopt=menu,preview
set nohlsearch
" case insensitive if ^[a-z]$ overwise case sensitive
set smartcase
set virtualedit=all
set ttymouse=xterm2
set pastetoggle=<Ins>
set mouse+=r

"-------------------------------------------------------------------------------
" vim options - status line (to check)
"-------------------------------------------------------------------------------
"set magic
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=(%{GitBranch()}%*)
set statusline+=\               " file format
set statusline+=%{Filename()}\                          " file name
set statusline+=%h%m%r%w                     " flags


set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format

set statusline+=\               " file format
"set statusline+=-(%{WindowNumber()})-        " window number
set statusline+=%=                           " right align
set statusline+=%#perlInfo#%{CurrentFunction()}%*
set statusline+=\ \ \  	      
set statusline+=0x%B/%-8b\                      " current char
set statusline+=(%v)
set statusline+=%(%l/%L%)

"set statusline+=%-14.(%l/%L%)
"set statusline+=%-14.(%l,%c%V%)\ %<%L


"-----------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for Perl
"-----------------------------------------------------------------------------
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format = 1
let tlist_perl_settings  = 'perl;p:package;s:methods;a:attributes;c:constants;l:plugins;t:typedefs;e:extends;l:labels'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_SingleClick = 1
let winManagerWindowLayout = 'TagList|BufExplorer'
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Close_On_Select = 1

" tagbar.vim
"let g:tagbar_usearrows = 1


"
"-------------------------------------------------------------------------------
" Filename completion
"
"   wildmenu : command-line completion operates in an enhanced mode
" wildignore : A file that matches with one of these
"              patterns is ignored when completing file or directory names.
"              - on the status bar --
"-------------------------------------------------------------------------------
set wildmenu
"set wildmode=list:longest
set wildignore=*.bak,*.o,*.e,*~
set wildignore+=*.sw?

"-------------------------------------------------------------------------------
" syntax highlighting
"-------------------------------------------------------------------------------
syntax on

au BufRead,BufNewFile *.yapp           setfiletype eyapp
au BufRead,BufNewFile *.yp           setfiletype eyapp
au BufRead,BufNewFile *.eyp         setfiletype eyapp 

"---------------------------------------
" Highlight current window
"---------------------------------------
augroup NrHighlight
    autocmd!
    hi StatusLine   ctermfg=Green  guifg=#ffffff ctermbg=0 guibg=#000000 cterm=bold gui=bold
    hi StatusLineNC ctermfg=White guifg=#000000 ctermbg=0 guibg=#ffffff cterm=none gui=none
augroup END

"-------------------------------------------------------------------------
" perldoc
"-------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.p? compiler perl
autocmd BufNewFile,BufRead *.p? setf perl
autocmd BufNewFile,BufRead *.p? let g:perldoc_program="/home/neo/perl5/perlbrew/perls/perl-5.12.5/bin/perldoc"

"------------------------------------------------------------------------
" APos Auto ACR
"------------------------------------------------------------------------
if (filereadable($HOME."/.vim/macros/perl/Perl_ACR_write.vim") == 1) 
   au  BufWritePre *.p[lm]  so ~/.vim/macros/perl/Perl_ACR_write.vim
   au  BufWritePre *.f\?cgi  so ~/.vim/macros/perl/Perl_ACR_write.vim
   au  BufWritePre *.t  so ~/.vim/macros/perl/Perl_ACR_write.vim
endif

"----------------------------------------------------------------
" maps
"----------------------------------------------------------------
" word under the cursor zyiw:exe "h ".@z"".. in command line
autocmd BufNewFile,BufRead .vimrc nmap <F1> "zyiw:exe "h ".@z.""<CR>
autocmd BufNewFile,BufRead *.p? nmap <F1> :Perldoc<CR>
autocmd BufNewFile,BufRead *.p? nmap <F2> :call RollUp()<CR>
autocmd BufNewFile,BufRead *.t nmap <F2> :call RollUp()<CR>
autocmd BufNewFile,BufRead *.p? nmap <F2> :call RollUp()<CR>
autocmd BufNewFile,BufRead *.t nmap <F2> :call RollUp()<CR>
" --- smart F12
autocmd BufNewFile,BufRead *.xml nmap <F12> :%!xmllint --format -<CR>:set ro<CR>
autocmd BufNewFile,BufRead *.txt nmap <F12> :call RecordDumper()<CR>
autocmd BufNewFile,BufRead *.csv nmap <F12> :call RecordDumper()<CR>
autocmd BufNewFile,BufRead *.pm nmap <F12> :call OpenBrother()<CR>
autocmd BufNewFile,BufRead *.t nmap <F12> :call OpenBrother()<CR>

map <F3> :TlistToggle<CR>

"---- leader based
"inoremap <Leader>J <C-R>=JiraRefLink()<CR>
"
" ------------------ PERL
" run
map <F5> <Leader>rr
" syntax check
map <F6> <Leader>rs

imap ~d <ESC>^iwarn Data::Dumper->Dump([\<ESC>llyw$a], ['<ESC>pa']);<ESC>
imap ~v <ESC>v?><CR>ly?\$<CR>imy $o_<ESC>pa = <ESC>$a;<CR>
imap ~c <ESC>lvbdimy $o_<ESC>pi = $self-><ESC>pi;<CR>

" ---- nice tabs
vmap <tab>      >gv
vmap <bs>       <gv
nmap <tab>      I<tab><esc>
nmap <bs>    ^i<bs><esc>

"-----------------------------------------------------------
"abbreviations
"-----------------------------------------------------------
iab xfo <ESC>:call Perl_InsertTemplate("statements.foreach")<CR>
iab xif <ESC>:call Perl_InsertTemplate("statements.if")<CR>
iab xel <ESC>:call Perl_InsertTemplate("statements.else")<CR>
iab xei <ESC>:call Perl_InsertTemplate("statements.elsif")<CR>
iab xie <ESC>:call Perl_InsertTemplate("statements.if-else")<CR>
iab xwh <ESC>:call Perl_InsertTemplate("statements.while")<CR>
iab xdw <ESC>:call Perl_InsertTemplate("statements.do-while")<CR>
iab xew <ESC>:call Perl_InsertTemplate("statements.each-while")<CR>
iab __@_;  my $self = __@_;<ESC>o
iab sss  $self->


"--------------------------------------------------------
" completion options
"--------------------------------------------------------
"Completion
let g:cpan_user_defined_sources = '~/perl5/perlbrew/perls/perl-5.12.5/'

inoremap <expr> -> MayComplete('->')
func MayComplete(str)
    return a:str."\<C-X>\<C-O>\<C-P>"
endfunc

inoremap <C-Tab> <C-X><C-O>
abbr Please_Redisplay <ESC>:call Redisplay()<CR>
func Redisplay()
    let s:startln = line('.')
    :s/|/\r/g              
    let s:endln = line('.')
    :exe s:startln.','.s:endln '!perltidy -ce --continuation-indentation=4 -cti=0 -cpi=0 -l=350 --line-up-parentheses -pt=0 -sbt=1 -bt=0 -bbt=0 -nsbl -vt=0 -vtc=0 -sot -isbc -nolq -msc=4 -hsc -csc -csci=1 -cscp="+ end of:" -cscb -fsb="\#\<notidy" -fse="\#notidy\>" -bbs' 
endfunc

"inoremap <expr> if IfComplete('if',4)
"inoremap <expr> elsif IfComplete('elsif',7)
"func IfComplete(str,ct)
"    return a:str." () {\<CR>}\<Up>\<ESC>".a:ct."li"
"endfunc
"inoremap <expr> else ElseComplete('else')
"func IfComplete(str)
"    return a:str." () {\<CR>}O\<Tab>"
"endfunc

let g:SuperTabCompletionContexts = [ 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc']
let g:SuperTabContextDiscoverDiscovery = [ "&omnifunc:<c-x><c-o>"]

"let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabSetDefaultCompletionType("<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-n>") |
\ endif
let g:SuperTabNoCompleteAfter = ['^', '\s',';']
set completeopt=preview,menuone

"------------------------------------------
" Window switching
"-------------------------------------------
noremap <c-LEFT> <C-W><LEFT> :vertical resize<CR>^
noremap <c-RIGHT> <C-W><RIGHT> :vertical resize<CR>^
noremap <c-DOWN> <C-W><DOWN> :resize<CR>^
noremap <c-UP> <C-W><UP> :resize<CR>^
source $HOME/.vimrc-user
"
"------------------------------------------
" FuzzyFinder
"-------------------------------------------
let g:fuf_coveragefile_globPatterns = [ '~/workspace/Liban/lib/**/*.p[lm]', '~/workspace/APos/APos/**/*.p[lm]', '~/.vim/**/*.vim', '~/.vim/**/*.p[lm]' ]
nmap \f :FufCoverageFile<CR>
nmap \o :FufMruFile<CR>
nmap \c :FufChangeList<CR>
nmap \l :FufLine<CR>
nmap \b :FufBuffer<CR>


