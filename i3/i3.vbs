' Confiuration
VcXsrv="C:\Program Files\VcXsrv\xlaunch.exe"


' Get directory of this script
Set objShell = CreateObject("Wscript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(Wscript.ScriptFullName)
scriptDirectory = objFSO.GetParentFolderName(objFile) 


Set WshShell = CreateObject("WScript.Shell") 
' Run X server with config.xml
WshShell.Run Chr(34) & VcXsrv & Chr(34) & " -run " & Chr(34) & scriptDirectory & "/config.xml" & Chr(34), 3, True
' Use bash to load .bashrc file with proper DISPLAY configuration
WshShell.Run "wsl ~ bash -i -c i3", 0
