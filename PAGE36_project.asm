//

    #import "constants.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        //                                          Screen/Border and ink
    
    jsr CLEAR

    ldx #$00                // Clearing the x register first
    ldy #$00
L1: lda Message,x           // Load value from Label (Move on to next in next loop)
    sta $0400,x
    inx
    cpx #$06
    bne L1

L2: lda Colours,y           // Load Value from the Label below (Move on to next in next loop)
    sta $d800,y             // Store value at address (adding one to the address per loop)
    iny                     // Increase Y by 1
    cpy #$06                // Is Y >= 6 ?
    bne L2                  // if not keep looping
    rts
    
Message:    .byte $08, $0f,$08, $0f,$08, $0f
Colours:    .byte $01,$02, $01,$02, $01,$02