//

    #import "consts.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        // 


    clc
    lda $0380
    adc $0381
    sta $0382               // Print Peek(898)

    rts