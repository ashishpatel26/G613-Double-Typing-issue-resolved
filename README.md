# G613 Keyboard Fix

## What does this script do?
It's a workaround for broken G613 Logitech keyboards (possibly other keyboards too) whereby some keys occasionally register multiple keystrokes for one kkkkkeypress.
The key bug appears because keyboard registers multiple keystrokes in a very short timespan even though you pressed the key only once. 
This script makes it so the subsequent keystrokes registered in a very short timespan are ignored thus outputing the key only for the first stroke.
## How to use this fix?
You need install AutoHotkey (Windows only). https://www.autohotkey.com/. A software to hijack keystrokes and assign them different functions.
Then download the **G613 Keyboard Fix.ahk** file above, change the configuration in it, save and then double click it. 
You can add this file to Windows autostart if needed.

## Configuration
There are two variables that affect the script. The first one **brokenKeys** is mandatory to be set to fit your scenario. The second one **fixOffset** is optional:

`Line 8: brokenKeys`
Set this variable so in the quotes there are only your broken keys listed.

`Line 16: fixOffset`
You can leave as is or just to fit your requirements for auto repeat requirements (read comments in code).

## Links
Problem with this keyboard is discussed on various forums.
https://www.reddit.com/r/LogitechG/comments/b8pqj9/g910_double_typing/
https://www.reddit.com/r/LogitechG/comments/fstryp/g910_keyboard_keys_double_typing/
https://www.reddit.com/r/LogitechG/comments/cu1uaa/ghub_causing_random_keypresses_or_ghostkey/

#### Other possible solutions
Above links suggest also other possible solutions (none worked for me, hence the script above).
- Take your keys out and clean you keybard connections, 
- Change USB socket to which the keyboard is connected
- Type your broken key like crazy for several minute until it fixes itself (some folks suggested it cleans the rust)
- Quit or uninstall G-Hub
- Go to Control Panel > Keyboard and change Repeat delay to longer one. Also can try to change slower Repeat rate.