#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleinstance force

SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

Gui, Show, x400 y20 w520 h55
Gui, Add, Text, x5 y20 w30 h30 vTText, %timerm%:%timers%
Gui, Add, Button, x35 y2 w120 h50 vStart_Pause, Start_Pause
Gui, Add, Button, x155 y2 w120 h50 vReset, Reset
Gui, Add, Button, x275 y2 w120 h50 vSom_Guia, Som_Guia
Gui, Add, Button, x395 y2 w120 h50 vParar_Som, Parar_Som
Count := 0



#IfWinActive WH.ahk
SPACE::
Sleep, 50
return
/*
#IfWinActive WH.ahk
^SPACE::
ControlClick, Button1,, Start_Pause
ControlClick, Button2,, Reset
; Count := Count*0
; GuiControl,,Count, %Count% times.
return

#IfWinActive WH.ahk
Numpad0::
ControlClick, Button1,, Start_Pause
ControlClick, Button2,, Reset
Count := Count*0
GuiControl,,Count, %Count% times.
return
*/




;Stopwatch.ahk


timerm := "00"
timers := "00"
stopped := "0"


Settimer, Stopwatch, 1000
Return

Stopwatch:
timers += 1
if(timers > 59)
{
	timerm += 1
	timers := "0"
	GuiControl, , TText ,  %timerm%:%timers%
}
if(timers < 10)
{
	GuiControl, , TText ,  %timerm%:0%timers%
}
else
{
	GuiControl, , TText ,  %timerm%:%timers%
}
return

ButtonStart_Pause:
if(stopped = 0)
{
	Settimer, Stopwatch, off
	stopped = 1
}
else
{
	Settimer, Stopwatch, 999
	stopped = 0
}
return

ButtonReset:
timerm := "00"
timers := "00"
GuiControl, , TText ,  %timerm%:%timers%
return

ButtonSom_Guia:
/*
Loop, 40{
ToolTip, %A_Index%/40 (2:40), 2, 2,
*/
SoundPlay, %A_ScriptDir%\72_bpm.mp3, 
/*
Sleep, 2000 ; 2500 tbm e um tempo bom, mas 2000 tbm
SoundPlay, %A_ScriptDir%\s.mp3, 
Sleep, 1500 ; 2500 tbm e um tempo bom, mas 2000 tbm
}
SoundPlay, %A_ScriptDir%\u_p.mp3, 1
Sleep, 2000
SoundPlay, %A_ScriptDir%\u_s.mp3, 1
Sleep, 500
SoundBeep, 400, 150
SoundBeep, 400, 150
*/
return

ButtonParar_Som:
SoundPlay, %A_ScriptDir%\parar_som.mp3, 
return

GuiClose:
GuiEscape:
ExitApp
return

