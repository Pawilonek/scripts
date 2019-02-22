; Close Command Prompt when pressing Ctrl+D
#If WinActive("cmd ahk_class VirtualConsoleClass") || WinActive("ahk_class ConsoleWindowClass")
  ^d::
    ; First send ESC, in case we're in select mode.
    Send {Esc}{Esc}exit{Enter}
	; WinGetTitle, Title, A
	; MsgBox, The active window is "%Title%"
	Return

#IfWinActive


; Get details about active window 
F1::
	WinGet, aI, ID, A
	WinGetClass, aC,  A ;i know active class
	WinGetTitle, aT, A ;i even know active window title!
	MsgBox ID: %aI% `nClass: %aC% `nTitle: %aT%
Return

; Switch PhpStorm
F8::
	if !WinExist("ahk_class SunAwtFrame")
		Run C:\Users\pawel.kaminski\AppData\Local\JetBrains\Toolbox\apps\PhpStorm\ch-0\183.4588.67\bin\phpstorm64.exe
	else if !WinActive("ahk_class SunAwtFrame")
		WinActivate ahk_class SunAwtFrame
	else	
		WinGet, Array, List, ahk_class SunAwtFrame
		Loop, %Array%
		   WinActivate, % "ahk_id " . Array%A_Index%
Return


; Print {Spce} even if pressed with alt
<^>!Space::
	Send {Space}
Return

; Caps Lock acts as Shift
Capslock::Shift
Return

; Open console
F9::
^!t::
	if !WinExist("ahk_class VirtualConsoleClass")
		Run C:\Program Files\ConEmu\ConEmu64.exe /dir "E:\Projects"
	WinActivate ahk_class VirtualConsoleClass
Return

; Open Notepad++
F10::
	if !WinExist("ahk_class Notepad++")-
		Run C:\Program Files\Notepad++\notepad++.exe
	WinActivate ahk_class Notepad++
Return


; Press middle mouse button to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
	~MButton::Send !{Up} 
	Return
#IfWinActive

; Custom volume buttons
+NumpadAdd:: Send {Volume_Up} ;shift + numpad plus
+NumpadSub:: Send {Volume_Down} ;shift + numpad minus
;break::Send {Volume_Mute} ; Break key mutes
break::Send {Media_Play_Pause} 
return



;^+g::			; Control+Shift+G: Google Search from Anywhere
F3::
InputBox, SearchTerm, Searh in Google, , Width, Height,  120, 200
if ErrorLevel
	Send, ^	; I don't like seeing the Message Box if I cancel, so I sent the CTRL key because nothing happens, which is what I want.
else
    Run https://www.google.com/search?q=%SearchTerm%
return

;;;;
; In progrgess
;;;;

; i3
^+g::			; Control+Shift+G
	Run, C:\bin\i3.vbs
	WinWait, ahk_class VcXsrv/x
	WinActivate
	WinMove A,, A_ScreenWidth+50, 10, A_ScreenWidth-20, A_ScreenHeight-20
	WinMove A,, 0, 0, A_ScreenWidth/2, A_ScreenHeight
return
