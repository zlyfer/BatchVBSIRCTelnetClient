set object1 = WScript.CreateObject("WScript.Shell")
object1.run "QPP.exe"
object1.run "telnet",1
dim server, nickname, channel, message, pongreply
nickname=inputbox ("Type your nickname:","Nickame","")
if nickname="exit" then
object1.run "tskill telnet",0
WScript.quit
end if
server=inputbox ("Insert the IRC-Server. HOSTNAME PORT","IRC-Server","irc..net 6667")
if server="exit" then
object1.run "tskill telnet",0
WScript.quit
end if
object1.sendkeys "set logfile QPP\QPP0.txt{Enter}"
object1.sendkeys "open "
object1.sendkeys server
object1.sendkeys "{ENTER}"
WScript.sleep 2000
object1.sendkeys "NICK "
object1.sendkeys nickname
object1.sendkeys "{ENTER}"
WScript.sleep 1000
'inputbox "Press Enter when you see 'PING NUMBER' in the telnet window.","PING PONG","Press ENTER/OK."
QPP0="QPP\QPP2.txt"
const ForReading = 1
set QPP1 = CreateObject("Scripting.FileSystemObject")
set QPP2 = QPP1.GetFile(QPP0)
set QPP3 = QPP1.OpenTextFile(QPP0, ForReading)
QPP4 = QPP3.ReadAll
WScript.sleep 1500
object1.sendkeys QPP4
object1.sendkeys "{Enter}"
QPP3.Close
object1.run "tskill qpp",0
WScript.sleep 5000
object1.sendkeys "USER "
object1.sendkeys nickname
object1.sendkeys " 8 * :VBSIRCTelnet{ENTER}"
WScript.sleep 5000
channel=inputbox ("Type in the channel you want to join. Don't miss the '#' !","Channel","#")
if channel="exit" then
object1.run "tskill telnet",0
WScript.quit
end if
object1.sendkeys "JOIN "
object1.sendkeys channel
object1.sendkeys "{Enter}"
message=Message
do
message=inputbox ("Type in the message you want to send to the channel. Type 'exit' to quit telnet.","New message",message)
if message="exit" then
object1.run "tskill telnet",0
WScript.quit
else
object1.sendkeys "PRIVMSG "
object1.sendkeys channel
object1.sendkeys " :"
object1.sendkeys message
object1.sendkeys "{ENTER}"
end if
loop