Set objArgs = WScript.Arguments
text = objArgs(0)
title = objArgs(1)

text = Replace(text, "\n", vbCrLf)

text = text & vbCrLf & vbCrLf & "Choose Ignore to exit this alert."

Do Until MsgBox(text,vbAbortRetryIgnore,title)=vbIgnore
	' Dummy
Loop
