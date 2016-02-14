--0   GPIO16
--1   GPIO5
--2   GPIO4
--3   GPIO0
--4   GPIO2
--5   GPIO14
--6   GPIO12 
--7   GPIO13
--8   GPIO15   
--9   GPIO3
--10  GPIO1
--11  GPIO9   
--12  GPIO10

wifi.setmode(wifi.STATION)
wifi.sta.config("FRITZ!Box Fon WLAN 7270","")   ---   SSID and Password for your LAN DHCP here
wifi.sta.connect()
  print("System Info:  ")
    majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
    print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
    print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
     -- get file system info
    remaining, used, total=file.fsinfo()
    print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes\n")
    function ip()
   -- print(wifi.sta.config())
    print("IP: "..wifi.sta.getip())
    --print(wifi.sta.getip())
    print("\nReady")
    --dofile("tcp2uart.lua")
    stat(1)
    end
    tmr.alarm(1, 4000, 0, ip)

mem = true
telnet = true  

gpio.mode(1,gpio.INPUT, gpio.PULLUP)
gpio.mode(6,gpio.OUTPUT)
gpio.mode(7,gpio.OUTPUT)

gpio.write(6, gpio.LOW)
gpio.write(7, gpio.LOW)

function stat(s)
    if s == 0 then
    gpio.write(6, gpio.LOW)
    gpio.write(7, gpio.LOW)

        elseif s == 1 then
        gpio.write(6, gpio.HIGH)
        gpio.write(7, gpio.LOW)

            elseif s == 2 then
            gpio.write(6, gpio.LOW)
            gpio.write(7, gpio.HIGH)

    end
end


function clik()
    if gpio.read(1) == 1 then
        elseif gpio.read(1) == 0 then
        select()
    end
end

function select()
mem = not mem
    if mem == false then
    mem = not mem
    server()
    end
end

function server()
telnet = not telnet 
    if telnet == true then
    dofile("tcp2uart.lua")
    stat(1)
    else
    dofile("web.lua")
    stat(2)
    end
end

tmr.alarm(0, 5000, 1, clik)



