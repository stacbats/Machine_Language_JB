//

    #import "consts.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        //                                          Screen/Border and ink
    
    jsr CLEAR           // Lets clear the screen

    ldx #$00                // Clearing the x register first
    ldy #$00
L1: lda Message,x           // Load value from Label (Move on to next in next loop)
    sta $04f0,x             // From screen position 1264
    inx
    cpx #$13                // #13
    bne L1

L2: lda Colours,y           // Load Value from the Label below (Move on to next in next loop)
    sta $d8f0,y             // Store value at address (adding one to the address per loop) //55536
    iny                     // Increase Y by 1
    cpy #$13                // Is Y >= 6 ?
    bne L2                  // if not keep looping

// Number Press part

PRESSED:                // Need a label to branch back on
    jsr RUNSTOP         // First we look for Runstop press? No? Carry on
    beq RS
                 
    jsr GETIN
    cmp #$30            // IMMEDIATE MODE   Compare to value #48
    bcc PRESSED         // Branch if carry clear, Is it LOWER than our compare ???
    cmp #$3a            // IMMEDIATE MODE   Compare to value #58
    bcs PRESSED         // Branch if carry Set, is it GREATER than our Compare ???

    jsr CHROUT          // If its met then print to Screen!!!!!
//    and #$0f            // Convert to binary knocking off high bits using AND

RS: rts 

// Message part

Message:   .byte $20, $10, $09, $03, $0b, $20, $01, $20, $0e, $15, $0d, $02,$05,$12, $20,$20, $30,$2d, $39
Colours:   .byte $02, $0d, $0d, $0d,$0d, $0d,$02,  $07, $07, $07, $07, $07, $07,$07,$02 ,$02,$02,$02,$02