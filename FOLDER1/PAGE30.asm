//

    #import "constants.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)
    Border_update(0)
    Screen_Update(0)
    

    lda #$48
    jsr CHROUT
    lda #$49
    jsr CHROUT

    Cursor_Color(14)
    rts
    