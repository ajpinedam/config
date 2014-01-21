; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; Ctrl-CapsLock to toggle caps
; CapsLock alone or with any other modifiers triggers a remap to ESC with said modifiers
^Capslock::Capslock
CapsLock::Esc

; Redefine only when the active window is a console window 
#IfWinActive ahk_class ConsoleWindowClass

; Close Command Window with Ctrl+w
$^w::
WinGetTitle sTitle
If (InStr(sTitle, "-")=0) { 
	Send EXIT{Enter}
} else {
	Send ^w
}

return 


; Ctrl+up / Down to scroll command window back and forward
^Up::
Send {WheelUp}
return

^Down::
Send {WheelDown}
return


; Paste in command window
^V::
; Spanish menu (Editar->Pegar, I suppose English version is the same, Edit->Paste)
Send !{Space}ep
return

#IfWinActive