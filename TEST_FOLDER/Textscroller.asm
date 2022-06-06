//      **********************************************************************
//      Character Scroller originally created by Phaze101. Recoded for VSCode.  
//      **********************************************************************

BasicUpstart2(Main)

//      *********************************************************************
//      Constants Defenitions
    .const Screen           = $0400+480     //middle of screen 40*12
    .const StartColor       = $d9e0          
    .const SCREENPOSITION   = $0590   
    .const COLOUR_RAM       = $d990 
    .const BORDER           = $d020  
    .const SCREEN           = $d021 
//*********************************************************************
// MACROS - just the one to help me remember the process (It would have been easier to just change it without lol)
.macro Screen_Update(colorA) {
    lda #colorA
    sta SCREEN
    sta BORDER
}

*       =       $C000 "Starting Code"

Main:
//*********************************************************************
//  Code for Screen Tidy, clear screen and add some colour
        lda     #147            // Clear Screen Screen Code
        jsr     $ffd2           // Kernal routine to print a charater

        Screen_Update(5)        // Refer to Macro, change the number for colour- Have chosen Green


COLOURCHANGE:
L1:     lda #00                 // Load A with 0 (black)
        sta StartColor,y        // Store in label and refer to Y register for increment
        cmp #$28                // compare to 40 (whole line of text-probably get away with less)
        iny                     // increment Y
        bne L1                  // branch until complete
//*********************************************************************
    ldy #$00                            // Load Y with 0 (clear it)
BAR:                                    // Our Label for the loop
    lda #$a0                            // Load A with 160 (a solid block, try 81)
    sta SCREENPOSITION,y                // Store 160 at address, increment (by 1 each pass)
    lda #$0d                            // Load #$07 into A (Yellow)
    sta COLOUR_RAM,y                    // Store 7 at address, increment (by 1 each pass)           
    iny                                 // increment by 1
    cpy #$28                            // Compare if 40, if not keep doing it
    bne BAR                             // branch until 0
    
    ldy #$00                            // Load Y with 0 (clear it)
BAR2:                                   // Our Label for the loop
    lda #$a0                            // Load A with 160 (a solid block, try 81)
    sta $0630,y                         // Store 160 at address, increment (by 1 each pass) 55856 1584
    lda #$07                            // Load #$07 into A (Yellow)
    sta $da30,y                         // 55696 Store 7 at address, increment (by 1 each pass)           
    iny                                 // increment by 1
    cpy #$28                            // Compare if 40, if not keep doing it
    bne BAR2                            // branch until 0
//*********************************************************************
StartScroll:
        lda     #<Scroll_text       // low byte
        sta     $fb                 // zero page 1
        lda     #>Scroll_text       // high byte
        sta     $fc                 // zero page 2
//*********************************************************************
// Fill In chars
FillChar:
        lda     #5
        sta     Frames

        ldy     #$00
        lda     ($fb),y
        beq     StartScroll
        sta     Screen+39
        
        clc
        lda     $fb
        adc     #$01
        sta     $fb
        lda     $fc
        adc     #$00
        sta     $fc

//      *********************************************************************
//      We will wait for scanline 250 to minimise flicker
ScanLine:
        lda     $d012
        cmp     #$fa
        bne     ScanLine

//      Check if we are still on raster line 250
SameScanLine:
        lda     $d012
        cmp     #$fa
        beq     SameScanLine
//      *********************************************************************
//      Delay using Screen Refresh Frames, there are 50 frames per second on a PAL System
//      Hence if the Number is 5 that means that ever 10 Frames we Scroll
        dec     Frames
        bne     ScanLine
//      *********************************************************************
//      Scrolls by one character the whole line
        ldx     #$00
ScrollLine:
        lda     Screen+1,x
        sta     Screen,x
        inx
        cpx     #$27
        bne     ScrollLine
 
        jmp     FillChar

exit:
        rts

//      *********************************************************************
//      The message to read :)

Scroll_text:
        .text    "hello, welcome to the start of this scrolling message.  "
        .text    "             starting to learn 6502 assembly and little "
        .text    "projects like this help. hopefully i will one day be good enough to "
        .text    "make a game worthy enough for cascade 50 :) " 
        .text    " with any luck maybe better. "
        .text    " any help or tips always welcome, peace out and " 
        .text    " enjoy your journey.            "
        .text    "i have ported this over from phaze101 code on github "
        .text    "please check out his page and also his videos on yt "
        .text    "                             "
        .byte    0

Frames:
        .byte    0