BasicUpstart2(entry)

    #import "consts.asm"

entry:

    Screen_Update(0)
    Border_update(0)

    jsr CLEAR

    lda #<THESAINT    // Grab Lo Byte of Hello World Location
    ldy #>THESAINT    // Grab Hi Byte of Hello World Location
    jsr PRINT_LINE      // Print The Line


    ldx #$08
    ldy #$00
colour:
    inx
    iny
    stx Name
    sty Name + 1
    stx Name + 2
    sty Name + 3
    stx Name + 4
    sty Name + 5
    stx Name + 6
    sty Name + 7
    stx Name + 8
    sty Name + 9 
    stx Name + 10
    inx
    
    jmp colour 

THESAINT:
    .text "STACY BATES"    // the string to print
    .byte 00               // The terminator character
    rts