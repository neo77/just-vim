
"echo "APos: checking ACR..."
let fn = expand("%:t")
if ((fn != 'ACR_check.pm') && (fn != 'ACR_check.pl')) 
let dict = winsaveview()
:%s/\s\+$//e
:%!$APOS_TOPDIR/APos/tools/ACR_check.pl  
let path = expand("%:p")


if (search('Owner: Pawel Guspiel') || search('Owner: Neo') || search('neo@cpan.org'))
    call TidyIt()
endif


call winrestview(dict)
endif

