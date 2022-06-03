
//  *****       Subtraction     *****

    #import "consts.asm"

BasicUpstart2(enter)

    * = $c000 "Our_Code_here"       // 49152 

enter:
    Cursor_Color(1)             //  The Below are
    Border_update(0)            //                  Macro Routines to change
    Screen_Update(0)            // 

    lda #2              // Load A with 2
    sta $0381           // Store it at address

    sec                         // Set Carry 
    lda #5                      // Load A with 5
    sbc $0381                   // Subtract what was stored at address with whats in A
    sta $0382                   // Store it at address  -   Print Peek(898) to see value

// *************************************************************************************
//          Change the values to see what is found when Print Peeking 898
// *************************************************************************************
    
    rts