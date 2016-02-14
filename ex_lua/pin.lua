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



gpio.mode(1,gpio.INPUT, gpio.PULLUP)



function pin()
print(gpio.read(1))
end
--tmr.alarm(2, 10, 1, pin)




gpio.mode(6,gpio.OUTPUT)
gpio.mode(7,gpio.OUTPUT)

gpio.write(6, gpio.LOW)
gpio.write(7, gpio.LOW)

function stat(s)
if s == 0 then
gpio.write(6, gpio.LOW)
gpio.write(7, gpio.LOW)
print("LED is OFF")
elseif s == 1 then
gpio.write(6, gpio.HIGH)
gpio.write(7, gpio.LOW)
print("LED is GREEN")
elseif s == 2 then
gpio.write(6, gpio.LOW)
gpio.write(7, gpio.HIGH)
print("LED is RED")
end
end
