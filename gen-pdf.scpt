if application "System Events" is not running then
   log "System events wasn't running"
   launch application "System Events"
   delay 0.5
end if
    
if application "System Events" is not running then
    repeat 10 times
        if application "System Events" is not running then
            log "Not running yet"
            delay 1
        else
            log "Now is running"
            exit repeat
        end if
    end repeat
else
    log "Now is running"
end if

tell application "Safari" to activate
tell application "System Events"
	tell process "Safari"
		open location "http://localhost:8080"
		delay 2
		keystroke "p" using {command down} --print
		repeat until exists sheet 1 of window 1
			delay 0.2
		end repeat

		perform action "AXShowMenu" of menu button 1 of group 2 of splitter group 1 of sheet 1 of window 1
		click menu item 2 of menu 1 of menu button 1 of group 2 of splitter group 1 of sheet 1 of window 1
		delay 1
		keystroke "d" using {command down, shift down}
		keystroke "slides"
		delay 0.5
		key code 36 -- Presses the "Save" button
		delay 2 -- Wait for the save operation to complete
		quit
	end tell
end tell
