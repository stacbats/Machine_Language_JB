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
    cpx #$0e                // #13
    bne L1

L2: lda Colours,y           // Load Value from the Label below (Move on to next in next loop)
    sta $d8f0,y             // Store value at address (adding one to the address per loop) //55536
    iny                     // Increase Y by 1
    cpy #$0f                // Is Y >= 6 ?
    bne L2                  // if not keep looping


KEY:                    // Our loop to make the program work
    jsr RUNSTOP         // Is run stop being pressed?
    beq RS

    jsr GETIN           // Kernal routine for getting key press
    cmp #$30            // IMMEDIATE MODE   Compare to value #48

    bcc KEY             // Branch only if carry Clear
    cmp #$3a            // COmpare within range 0-9 ($30 to $39) Decimal 48 to 57

    bcs KEY             // Only branch on set

    jsr CHROUT          // input to screen
    and #$0f            // Uthat we printed the character first, and then converted to binary; the character must be ASCII to print correctly.

RS: 
    rts

Message:   .byte $20, $10, $09, $03, $0b, $20, $01, $20, $0e, $15, $0d, $02,$05,$12
Colours:   .byte $02, $01, $01, $01,$01, $01,$02,  $07, $07, $07, $07, $07, $07,$07