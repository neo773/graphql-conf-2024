tell application "Safari" to activate
tell application "System Events"
    tell process "Safari"
        open location "http://localhost:8080"
        delay 2
        keystroke "p" using {command down} --print
        repeat until exists sheet 1 of window 1
            delay 0.2
        end repeat
        
        -- Navigate to the orientation options
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke space -- Selects the "Layout" tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke tab
        delay 0.5
        keystroke space -- Selects "Landscape" orientation
        delay 0.5
        
        perform action "AXShowMenu" of menu button 1 of group 2 of splitter group 1 of sheet 1 of window 1
        click menu item 2 of menu 1 of menu button 1 of group 2 of splitter group 1 of sheet 1 of window 1
        delay 1
        keystroke "slides.pdf"
        delay 0.5
        key code 36 -- Presses the "Save" button
    end tell
end tell