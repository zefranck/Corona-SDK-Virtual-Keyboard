require("onScreenKeyboard") -- include the onScreenKeyboard.lua file

--create a textfield for the content created with the keyoard

local options = 
{
    text = "",     
    x = 0,
    y = 280,
    width = display.contentWidth,     --required for multi-line and alignment
    font = native.systemFontBold,   
    fontSize = 40,
    align = "center"  --new alignment parameter
}

local textField = display.newText( options )
textField:setTextColor(1,1,1)
textField.anchorX = 0
textField.anchorY = 0

--create an instance of the onScreenKeyboard class without any parameters. This creates a keyboard
--with the default values. You can manipulate the visual representation of the keyboard by passing a table to the new() function.
--Read more about this in the section "customizing the keyboard style"
local keyboard = onScreenKeyboard:new()

--create a listener function that receives the events of the keyboard
local listener = function(event)
    if(event.phase == "ended")  then
        textField.text=keyboard:getText() --update the textfield with the current text of the keyboard
        textField.x = 0
        textField.y = 30

        --check whether the user finished writing with the keyboard. The inputCompleted
        --flag of  the keyboard is set to true when the user touched its "OK" button
        if(event.target.inputCompleted == true) then
            print("Input of data complete...")
            keyboard:destroy()
        end
    end
end

--let the onScreenKeyboard know about the listener
keyboard:setListener(  listener  )

--show a keyboard with small printed letters as default. Read more about the possible values for keyboard types in the section "possible keyboard types"
keyboard:drawKeyBoard(keyboard.keyBoardMode.letters_small)