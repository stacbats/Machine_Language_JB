//

    #import "constants.asm"

BasicUpstart2(enter)
 
    * = $033c "Our_Code_here"  // 49152 
enter:

    lda #$48
    jsr CHROUT
    lda #$49
    jsr CHROUT

    rts
    