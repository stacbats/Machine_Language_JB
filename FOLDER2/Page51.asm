//

    #import "consts.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"  // 49152 

enter:
    Cursor_Color(1)         //  The Below are
    Border_update(0)        //                  Macro Routines to change
    Screen_Update(0)        //                                          Screen/Border and ink
    
    jsr CLEAR           // Lets clear the screen

    jsr RUNSTOP         // Is run stop being pressed?
KEY:                    // Our loop to make the program work
    jsr GETIN           // Kernal routine for getting key press
    beq KEY             // Branch back if nothing pressed
    cmp #$30            // Compare what was pressed? Looking for keys 0 to 9 ($30 to $39)
    bcc KEY             // Branch only if carry Clear
    cmp #$3a            // COmpare within range 0-9 ($30 to $39) Decimal 48 to 57
    bcs KEY             // Only branch on set
    jsr CHROUT          // input to screen
    and #$0f            // Uthat we printed the character first, and then converted to binary; the character must be ASCII to print correctly.

RS: 
    rts