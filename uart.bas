$Regfile="m32def.dat"
$Crystal=4000000
$hwstack=40
$swstack=16
$framesize=32

Dim b_IsCharWaiting As Byte
Dim s_Received As String * 32
Dim c_end As String * 1

c_end = chr(69)

Open "Com1:" For Binary As #1

Do
    b_IsCharWaiting = Ischarwaiting(#1)
    If b_IsCharWaiting = 1 Then
        Input #1 , s_Received
        If Instr(s_Received , c_end) > 0 Then
            Print "Received: " ; s_Received
        End If
    End If

Loop

Close #1
