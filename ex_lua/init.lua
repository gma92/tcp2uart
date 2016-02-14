

wifi.setmode(wifi.STATION)
wifi.sta.config("FRITZ!Box Fon WLAN 7270","")   ---   SSID and Password for your LAN DHCP here
wifi.sta.connect()
  print("System Info:  ")
    majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
    print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
    print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
     -- get file system info
    remaining, used, total=file.fsinfo()
    print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes")
    function ip()
    print("\nIP: "..wifi.sta.getip())
    --print(wifi.sta.getip())
    print("\nReady")
    end
    tmr.alarm(1, 4000, 0, ip)
--    dofile("servernode.lua")