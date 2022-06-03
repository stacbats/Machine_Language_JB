//  Addition

    #import "consts.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        // 

    lda #5              // Load A with 5
    sta $0381           // Store it at address

    clc                     // Clear Carry
    lda #2                  // Load A with 2
    adc $0381               // Add A to whats at address
    sta $0382               // Store it at address  -   Print Peek(898) to see value

    rts