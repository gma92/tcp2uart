if srv then srv:close() srv=nil end

uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 0)
srv=net.createServer(net.TCP, 60)
global_c = nil
srv:listen(9999, function(c)
    if global_c~=nil then
        global_c:close()
    end
    global_c=c
    c:on("receive",function(sck,pl) uart.write(0,pl) end)
end)

uart.on("data",4, function(data)
    if global_c~=nil then
        global_c:send(data)
    end
end, 0)
print("tcp2uart started\n")
