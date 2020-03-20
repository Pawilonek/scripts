#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallKeybdHook
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Below based on HP Pavilion Wireless Keyboard 600

; F1 | Mute 
VOLUME_MUTE::F1
F1::VOLUME_MUTE

; F2 | Volume Down 
VOLUME_DOWN::F2
F2::VOLUME_DOWN

; F3 | Volume Up
VOLUME_UP::F3
F3::VOLUME_UP

; F4 | Last Song
MEDIA_PREV::F4
F4::MEDIA_PREV

; F5 | Play/Pause
MEDIA_PLAY_PAUSE::F5
F5::MEDIA_PLAY_PAUSE

; F6 | Next song
MEDIA_NEXT::F6
F6::MEDIA_NEXT

; F7 | Brightness Down


; F8 | Brightness Up


; F9 | Search
BROWSER_SEARCH::F9
F9::BROWSER_SEARCH

; F10 | Toggle display mode for multi-screen
<#Tab::
SendInput {F10}
Return
				
; F11 | ???
<^<#F21::
SendInput {F11}
Return

; F12 | System Settings
<#F21::
SendInput {F12}
Return
