// LABELS for the program
    .const CLEAR            = $e544
    .const SCREENPOSITION   = $0400
    .const COLUR_RAM        = $d800 
    .const CHROUT           = $ffd2
    .const RND_Basic        = $e097
    .const INKS             = $0286        


// MACROS 
    .macro Border_Screen(COL1) {
        lda #COL1 
        sta $d020
        sta $d021
    }

    .macro Cursor_Color(ink) {
    lda #ink
    sta INKS
    }

BasicUpstart2(enter)

    *= $c000 "Code Start"       //sys 49152

enter:
    jsr CLEAR 
    Border_Screen(2)
    Cursor_Color(0)

LOOP:

		jsr RND_Basic
		lda $8c    //$8b - $8f
		and #%00000001
		tax
		lda ASCII,x
		jsr CHROUT
		jmp LOOP

ASCII: .byte $cd,$ce        // Ascii 205 & 206