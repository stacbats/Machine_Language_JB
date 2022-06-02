// MACROS

.macro Screen_Update(colorA) {
    lda #colorA
    sta SCREEN
}

.macro Border_update(colorB) {
    lda #colorB
    sta BORDER
    
}


.macro Cursor_Color(ink) {
    lda #ink
    sta INKS
}

// CONSTANTS

    .label PRINT_LINE       = $AB1E
    .label Name             = $d800
    .const CLEAR    = $e544         // Kernal routine to clear screen
    .const SCREEN   = $d021         // Screen Colour Poke 53281
    .const BORDER   = $d020         // Border Colour Poke 53280
    .const OUTPUT   = $e716         // Output to screen
    .const RETURN   = $e891         // Perform Return
    .const SCNKEY   = $ff9f         // Scan Keyboard
    .const CHRIN    = $ffcf         // Get input from Keyboard
    .const CHROUT   = $ffd2         // Output a character
    .const GETIN    = $ffe4         // Get a character- from keyboard
    .const RUNSTOP  = $ffe1
    .const PLOT     = $fff0         // Plot set cursor location
    .const HOME     = $e566         // Home Cursor
    .const SCROLL   = $e8e7         // Scroll Screen
    .const CLRSCRL  = $e9ff         // Clear Screen Line
    .const CURSCOL  = $0286         // change cursor colour
    .const INKS     = $0286         // change colour for text


//  *****   ADDRESSING MODES    *****
// LDA      Absolute mode (standard)    IE lda 83 (using the value stored @83)
// LDA#     Immediate mode              IE lda #83 (taking the value and load/store/compare)
// TXA      Implied (standard)
// BNE      Relative mode (standard)
// LDA-Z    Zero page mode
// (JMP)    Indirect
// LDA-X    Indexed
// (LDA-X)  Indexed indirect
// (LDA-Y)  Indirect indexed

// IMPLIED MODE. Uses single byte and no operand.
// IMMEDIATE MODE. Uses actual value in operand, either decimal or hexadecimal, and uses two bytes.
// ABSOLUTE MODE. Uses value in the address in operand.
// Three bytes of memory are used; one for the opcode, and one
// apiece for the low and high bytes of the address.
