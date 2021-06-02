switch = false
openConfig = ""
xArray = {0}
yArray = {0}
count = 0
total = 4
function OnEvent(event, arg)
    --OutputLogMessage("Event: "..event.." Arg: "..arg.."\n")
EnablePrimaryMouseButtonEvents(true)
    OutputLogMessage("event = %s, key= %s\n", event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
       --Mp7()
	--Sa58() 
	Vss()
    end
	if(event == "PROFILE_ACTIVATED") then
		Vss()
	end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
    -- Mouse Button 6 has been pressed

    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 6) then
    -- Mouse Button 6 has been released
    end 
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
        -- Mouse Button 8 has been pressed
        count = count - 1
        switchConfig()
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 9) then
        -- Mouse Button 9 has been pressed
        count = count + 1
        switchConfig()
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 3) then
        -- Mouse Button 3 has been pressed
        switch = true
    end
    if (event == "MOUSE_BUTTON_PRESSED" and (arg == 4 or arg == 5)) then
        -- Mouse Button 4 or 5 has been pressed
        switch = false
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then

        -- Mouse Button 1 has been pressed
	   isNumLock = IsKeyLockOn("numlock")
	   OutputLogMessage("isNumLock = %s\n", isNumLock)
        if (isNumLock and switch) then
            Looper()
        end
    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
        -- Mouse Button  has been released
    end
end

function Looper() 
    def_x,def_y = GetMousePosition()
	OutputLogMessage("Mouse first is at x:%d, y:%d\n",def_x,def_y)
	Sleep(1)
    looper_time = 0
    local count = 1
    OutputLogMessage("switch is %s\n",IsMouseButtonPressed(1))
    OutputLogMessage("config is %s\n",openConfig)
    local count_x,count_y
    while(IsMouseButtonPressed(1))
    do
		if (openConfig == "ash") then
			PressMouseButton(1)
			MoveMouseRelative(0,1)
			looper_time = looper_time + 50
			Sleep(10)
       		OutputLogMessage("Mouse looper time is :%d  count:%d\n", looper_time,count)
			count = count + 1
		else
			x,y = GetMousePosition()
			OutputLogMessage("Mouse is at x:%d, y:%d\n",x,y)
			count_x,count_y = #xArray,#yArray
			OutputLogMessage("Array is at x:%d, y:%d\n",count_x,count_y)
         		if (count_x > count and count_y > count) then
          -- MoveMouseTo(def_x,def_y)
			yc = 0
			xc = 0
				if(yArray[count] == nil) then
					yc = 0
				else 
					yc = yArray[count]
				end
				if(xArray[count] == nil) then
					xc = 0
				else 
					xc = xArray[count]
				end
			OutputLogMessage("Mouse move is at x:%d, y:%d\n",xc,yc)
			MoveMouseRelative(xc,yc)
         		end
			--MoveMouseRelative(100,0)
        		looper_time = looper_time + 50
			Sleep(50)
       		OutputLogMessage("Mouse looper time is :%d  count:%d\n", looper_time,count)
			count = count + 1
		end

	end
end

function switchConfig() 
    z = getPosition(count)
    if (z == 0) then
        Mp7()
    end
    if (z == 1) then
        Sa58()
    end
    
    if(z == 2) then
        Vss()
    end
	if(z == 3) then
		Ash()
	end
    OutputLogMessage("switch config is %s\n",openConfig)
end

function getPosition(num) 
    return num%total;
end

function Mp7() 
    -- if (openConfig ~= "") then
    --     openConfig = ""
	-- 	xArray = {0}
    --     yArray = {0}
    -- else
        openConfig = "Mp7"
        xArray = {0,0,0,0,2,1,-2,2,-2,0,3,-2,1,0,-2}
        yArray = {0,10,13,9,-2,-1,-1,-2,0,-1,-1,0,-1,-1,-1}
    -- end
end

function Vss() 
	   
        openConfig = "VSS"
        xArray = {0,0,0,0,2,1,-2,2,-2,0,3,-2,1,0,-2}
        yArray = {0,10,13,9,-2,-1,-1,-2,0,-1,-1,0,-1,-1,-1}
    -- end
end

function Sa58() 
    	openConfig = "SA58"
        xArray = {0,0,-1,-2,0,-1,-2,2,0,0,1,0,1,0,0}
        yArray = {0,15,13,19,3,2,1,-2,-3,-1,-1,-4,-3,-2,-1}
end

function Ash()
	openConfig = "ash"
	xArray = {0,0,0}
	yArray = {0,0,0}
end
