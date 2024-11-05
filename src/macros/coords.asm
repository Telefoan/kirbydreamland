DEF hlbgcoord EQUS "bgcoord hl,"
DEF bcbgcoord EQUS "bgcoord bc,"
DEF debgcoord EQUS "bgcoord de,"

MACRO bgcoord
; register, x, y[, origin]
IF _NARG < 4
	ld \1, (\3) * SCRN_VX_B + (\2) + vBGMap0
ELSE
	ld \1, (\3) * SCRN_VX_B + (\2) + \4
ENDC
ENDM

MACRO ldbgcoord
; x, y[, origin]
IF _NARG < 3
	ld [(\2) * SCRN_VX_B + (\1) + vBGMap0], a
ELSE
	ld [(\2) * SCRN_VX_B + (\1) + \3], a
ENDC
ENDM
