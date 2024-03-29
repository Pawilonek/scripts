#SingleInstance force

; ^ ctrl
; + shitf
; ! alt
; # windows

^#r::Reload ; ctrl + win + r


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

; Text–only paste from ClipBoard (do not use in PhpStorm)
#If Not WinActive("cmd ahk_class SunAwtFrame")
	^+v::                            
	   Clip0 = %ClipBoardAll%
	   ClipBoard = %ClipBoard%       ; Convert to text
	   Send ^v                       ; For best compatibility: SendPlay
	   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
	   ClipBoard = %Clip0%           ; Restore original ClipBoard
	   VarSetCapacity(Clip0, 0)      ; Free memory
	Return
#IfWinActive


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



; Custom volume buttons
+NumpadAdd:: Send {Volume_Up} ;shift + numpad plus
+NumpadSub:: Send {Volume_Down} ;shift + numpad minus
;break::Send {Volume_Mute} ; Break key mutes
break::Send {Media_Play_Pause} 
return


;Search for ppl in company
^+F12:: ; Control+Shift+12
<#f:: ; Left WinKey + F
>#f:: ; Right WinKey + F
InputBox, SearchTerm, Searh PPL in comapny, , Width, Height,  120, 200
if ErrorLevel
	Send, ^	; I don't like seeing the Message Box if I cancel, so I sent the CTRL key because nothing happens, which is what I want.
else
    Run https://g2ahub.sharepoint.com/search/Strony/peopleresults.aspx?k=%SearchTerm%
return


; Send text in clipboard to haste
<#h:: ; Left WinKey + h
>#h:: ; Right WinKey + h
	Send, ^c
	Run C:\bin\haste.bat
return



; Quick notes (todo list)
;<#`:: ; Left WinKey + `
;>#`:: ; Right WinKey + `
;	if !WinExist("QuickNotes") {
;		WinShow QuickNotes ; May by already hidden by this script
;		Run, "code" %A_WorkingDir%\todo.code-workspace %A_WorkingDir%\tmp\notes.todo, %A_WorkingDir%, Hide
;		; Workspace configuration has set title to: QuickNotes
;		WinWait, QuickNotes
;		WinActivate, QuickNotes
;	} else if !WinActive("QuickNotes") {
;		WinShow QuickNotes
;		WinActivate QuickNotes
;	} else {
;		WinHide QuickNotes
;	}
;return


; Quick notes - Open Typora with notes
; Windows + `
#`:: ; Left WinKey + `
	Run "C:\Program Files\Typora\Typora.exe" "C:\Users\pawel.kaminski\OneDrive - Tech Sp. z o.o\notes.txt"
Return

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

; Open console
^!t:: ; crtl + alt + t
	if !WinExist("ahk_class VcXsrv/x") {
		Run, %A_scriptDir%\i3\i3.vbs
	} else {
		WinActivate ahk_class VcXsrv/x
	}
return


; Send Meh 😒
^m:: ; ctrl + m
	Send, Meh {U+1F612} {enter}
return



;;;;
; In progrgess
;;;;
