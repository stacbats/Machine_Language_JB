//

    #import "constants.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:

    lda #$58
    jsr CHROUT 

    rts
    