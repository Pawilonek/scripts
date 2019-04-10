#SingleInstance force

; ^ ctrl
; + shitf
; ! alt

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

^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
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


; Bogdan screenshot
^PrintScreen:: ; ctrl + PrintScreen
	Run C:\bin\bogdan-screen.bat
return

; Quick notes (todo list)
<#`:: ; Left WinKey + `
>#`:: ; Right WinKey + `
	if !WinExist("QuickNotes") {
		WinShow QuickNotes ; May by already hidden by this script
		Run, "code" %A_WorkingDir%\todo.code-workspace %A_WorkingDir%\tmp\notes.todo, %A_WorkingDir%, Hide
		; Workspace configuration has set title to: QuickNotes
		WinWait, QuickNotes
		WinActivate, QuickNotes
	} else if !WinActive("QuickNotes") {
		WinShow QuickNotes
		WinActivate QuickNotes
	} else {
		WinHide QuickNotes
	}
return

; Open Notepad++
<#1:: ; Left WinKey + 1
>#1:: ; Right WinKey + 1
	if !WinExist("ahk_class Notepad++") {
		Run C:\Program Files\Notepad++\notepad++.exe
	} else if !WinActive("ahk_class Notepad++") {
		WinActivate ahk_class Notepad++
	} else {
		Send, ^{Tab}
	}
Return

; Chrome
<#2:: ; Left WinKey + 2
>#2:: ; Right WinKey + 2
	if !WinExist("ahk_class Chrome_WidgetWin_1")
		Run chrome
	else if !WinActive("ahk_class Chrome_WidgetWin_1")
		WinActivate ahk_class Chrome_WidgetWin_1
	else
		Send, ^{Tab}
return

; i3 
<#3:: ; Left WinKey + 3
>#3:: ; Right WinKey + 3
	if !WinExist("ahk_class VcXsrv/x") {
		Run, %A_scriptDir%\i3.vbs
		WinWait, ahk_class VcXsrv/x
		WinActivate
		Send, {LWin Down}{LShift Down}{LEFT}{LShift Up}{LWin Up}
		WinMaximize, ahk_class VcXsrv/x
		WinMinimize, ahk_class VcXsrv/x
		Send, !{Tab}
	} else {
		WinActivate ahk_class VcXsrv/x
	}
return


;;;;
; In progrgess
;;;;
