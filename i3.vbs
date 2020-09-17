display=0

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set tempfolder = objFSO.GetSpecialFolder(2) 

tempname = objFSO.GetTempName 

Set objFile = tempfolder.CreateTextFile(tempname)

objFile.Write "<?xml version=" & Chr(34) & "1.0" & Chr(34) & " encoding=" & Chr(34) & "UTF-8" & Chr(34) & "?>" & Chr(13) & Chr(10) &_
"<XLaunch WindowMode=" & Chr(34) & "Windowed" & Chr(34) & " ClientMode=" & Chr(34) & "NoClient" & Chr(34) & " LocalClient=" & Chr(34) & "False" & Chr(34) & " Display=" & Chr(34) & display & Chr(34) & " LocalProgram=" & Chr(34) & "xcalc" & Chr(34) & " RemoteProgram=" & Chr(34) & "xterm" & Chr(34) & " RemotePassword=" & Chr(34) & "" & Chr(34) & " PrivateKey=" & Chr(34) & "" & Chr(34) & " RemoteHost=" & Chr(34) & "" & Chr(34) & " RemoteUser=" & Chr(34) & "" & Chr(34) & " XDMCPHost=" & Chr(34) & "" & Chr(34) & " XDMCPBroadcast=" & Chr(34) & "False" & Chr(34) & " XDMCPIndirect=" & Chr(34) & "False" & Chr(34) & " Clipboard=" & Chr(34) & "True" & Chr(34) & " ClipboardPrimary=" & Chr(34) & "True" & Chr(34) & " ExtraParams=" & Chr(34) & "" & Chr(34) & " Wgl=" & Chr(34) & "True" & Chr(34) & " DisableAC=" & Chr(34) & "True" & Chr(34) & " XDMCPTerminate=" & Chr(34) & "False" & Chr(34) & "/>"

objFile.Close

Set WshShell = CreateObject("WScript.Shell") 

WshShell.Run Chr(34) & "C:\Program Files\VcXsrv\xlaunch.exe" & Chr(34) & " -run " & Chr(34) & tempfolder.Path & "\" & tempname & Chr(34), 3, True

WshShell.Run "wsl DISPLAY=172.27.112.1:" & display &  " i3", 0
