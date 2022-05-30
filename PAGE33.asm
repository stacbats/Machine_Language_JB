//

    #import "constants.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        //                                          Screen/Border and ink
    

    ldx #$00                // Clearing the x register first
    ldy #$00
L1: lda Message,x           // Load value from Label (Move on to next in next loop)
    sta $05f1,x             // store value at address  (adding one to the address per loop)
    inx                     // X+
    cpx #$05                // Is X >= to 5?
    bne L1                  // If not X >= 5 then loop again

//      *****  AS ABOVE, we now work on the colours     

L2: lda Colours,y           // Load Value from the Label below (Move on to next in next loop)
    sta $d9f1,y             // Store value at address (adding one to the address per loop)
    iny                     // Increase Y by 1
    cpy #$06                // Is Y >= 6 ?
    bne L2                  // if not keep looping

    rts

Message:    .byte $08, $05 ,$0c, $0c, $0f
Colours:    .byte $02, $01,$02, $01,$02, $01
    