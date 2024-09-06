; audio commands

; \1 = note constant
MACRO note
	db \1
ENDM

	const_def $10
	const AUDIOCMD_BREAK ; $10

	const_def $20

	const AUDIOCMD_PITCH_SHIFT ; $20
MACRO pitch_shift
ASSERT \1 >= -8 && \1 <= 7
IF \1 >= 0
	db \1 | AUDIOCMD_PITCH_SHIFT
ELSE
	db ($10 + \1) | AUDIOCMD_PITCH_SHIFT
ENDC
ENDM

	const_def $40

	const AUDIOCMD_VOLUME ; $40
MACRO volume
ASSERT \1 <= 15
	db \1 | AUDIOCMD_VOLUME
ENDM

MACRO volume_b
ASSERT \1 <= 15
	db \1 | AUDIOCMD_VOLUME | AUDIOCMD_BREAK
ENDM

	const_def $60

	const AUDIOCMD_VOLUME_SHIFT ; $60
MACRO volume_shift
ASSERT \1 >= -8 && \1 <= 7
IF \1 >= 0
	db \1 | AUDIOCMD_VOLUME_SHIFT
ELSE
	db ($10 + \1) | AUDIOCMD_VOLUME_SHIFT
ENDC
ENDM

MACRO volume_shift_b
ASSERT \1 >= -8 && \1 <= 7
IF \1 >= 0
	db \1 | AUDIOCMD_VOLUME_SHIFT | AUDIOCMD_BREAK
ELSE
	db ($10 + \1) | AUDIOCMD_VOLUME_SHIFT | AUDIOCMD_BREAK
ENDC
ENDM

	const_def $80

	const AUDIOCMD_WAVE ; $80
MACRO wave
ASSERT \1 <= $f
	db \1 | AUDIOCMD_WAVE
ENDM

	const_def $c0

	const AUDIOCMD_WAIT ; $c0
MACRO audio_wait
	db AUDIOCMD_WAIT
	db \1 ; duration
ENDM

	const_def $e0

DEF AUDIO_COMMANDS_BEGIN EQU const_value

	const AUDIOCMD_E0 ; $e0

	const AUDIOCMD_E1 ; $e1
MACRO audio_e1
	db AUDIOCMD_E1
	db \1 ; ?
ENDM

	const AUDIOCMD_SET_FREQUENCY ; $e2
MACRO set_frequency
	db AUDIOCMD_SET_FREQUENCY
	dw \1 ; ?
ENDM

	const AUDIOCMD_PITCH ; $e3
MACRO pitch
	db AUDIOCMD_PITCH
	db \1 ; ?
ENDM

	const AUDIOCMD_E4 ; $e4

	const AUDIOCMD_E5 ; $e5

	const AUDIOCMD_E6 ; $e6

	const AUDIOCMD_E7 ; $e7

	const AUDIOCMD_E8 ; $e8

	const AUDIOCMD_E9 ; $e9

	const AUDIOCMD_EA ; $ea

	const AUDIOCMD_EB ; $eb

	const AUDIOCMD_EC ; $ec

	const AUDIOCMD_ED ; $ed

	const AUDIOCMD_EE ; $ee

	const AUDIOCMD_EF ; $ef

	const AUDIOCMD_F0 ; $f0
MACRO audio_f0
	db AUDIOCMD_F0
	db \1 ; ?
ENDM

	const AUDIOCMD_F1 ; $f1
MACRO audio_f1
	db AUDIOCMD_F1
	db \1 ; ?
ENDM

	const AUDIOCMD_SET_TEMPO_MODE ; $f2
MACRO tempo_mode
	db AUDIOCMD_SET_TEMPO_MODE
	db \1 ; ?
ENDM

	const AUDIOCMD_F3 ; $f3
MACRO audio_f3
	db AUDIOCMD_F3
	db \1 ; ?
ENDM

	const AUDIOCMD_F4 ; $f4
MACRO audio_f4
	db AUDIOCMD_F4
	db \1 ; ?
ENDM

	const AUDIOCMD_SET_BASE_NOTE ; $f5
MACRO base_note
	db AUDIOCMD_SET_BASE_NOTE
	db \1 ; ?
ENDM

	const AUDIOCMD_SET_INSTRUMENT ; $f6
MACRO instrument
	db AUDIOCMD_SET_INSTRUMENT
	db \1 ; ?
ENDM

	const AUDIOCMD_F7 ; $f7
MACRO audio_f7
	db AUDIOCMD_F7
	db \1 ; ?
ENDM

	const AUDIOCMD_JUMP ; $f8
MACRO audio_jump
	db AUDIOCMD_JUMP
	dw \1 ; address
ENDM

	const AUDIOCMD_F9 ; $f9

	const AUDIOCMD_CALL ; $fa
MACRO audio_call
	db AUDIOCMD_CALL
	dw \1 ; address
ENDM

	const AUDIOCMD_RET ; $fb
MACRO audio_ret
	db AUDIOCMD_RET
ENDM

	const AUDIOCMD_REPEAT ; $fc
MACRO audio_repeat
	db AUDIOCMD_REPEAT
	db \1 ; number of repetitions
ENDM

	const AUDIOCMD_REPEAT_END ; $fd
MACRO audio_repeat_end
	db AUDIOCMD_REPEAT_END
ENDM

	const AUDIOCMD_SET_PAN ; $fe
MACRO pan
	db AUDIOCMD_SET_PAN
	db \1 ; PAN_* constant
ENDM

	const AUDIOCMD_FF ; $ff
MACRO audio_ff
	db AUDIOCMD_FF
ENDM
