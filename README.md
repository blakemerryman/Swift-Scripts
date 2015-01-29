Swift-Scripts
=============

This is a quick primer on using Swift for scripting. This repository also contains a number of example scripts. For more information, see the [wiki](https://github.com/blakemerryman/Swift-Scripts/wiki). 

> If you have suggestions or improvements, feel free to submit a pull request or contact me on Twitter [@blakemerryman](https://twitter.com/blakemerryman) or email me at <blake.merryman@gmail.com>


## Suggested System Configuration

These are the settings on the machine I used while developing these script examples.

- Mac OS X Yosemite (v10.10.1)
- Xcode 6.1.1 set as default development environment

You can create and use Swift scripts without these exact settings but some of the calls into the Swift environment maybe be different.


## Quick Start Guide

To make any Swift file into a script, all it takes are four basic steps:

1. **Shebang**  
    Add this single line of code to the very first line of your script:  
    `#!/usr/bin/env xcrun swift`  

    This is what invokes the Swift environment and passes our script to it for execution.

2. **Make Executable**
    Next, we need to make our script executable so that we can call it directly by filename. Simple change the file permissions with:    
    `chmod +x /path/to/file/.../SomeCoolScript.swift` 

3. **Run the Script**
    Now, we can run the script by directly invoking the filename (along with the path to the file):  
    `$ /path/to/file/.../SomeCoolScript.swift`

4. **Handle User Input** (optional)
    This is an optional (though extremely useful) step. All arguments are passed into a Swift script via `Process.arguments` which is an array of strings populated from the user's input.

    For example, if the user calls the following command (with trailing arguments) from the terminal:
    `$ ./SomeCoolScript.swift firstArg secondArg thirdArg`

    This is what you that looks like in the Swift script:  
    
    ```swift
    let arguments: [Strings] = Process.arguments
    // [ "./SomeCoolScript.swift", "firstArg", "secondArg", "thirdArg" ]
    ```

    Notice the first argument is the executed script. Keep in mind that arguments are delimited by spaces *except* when enclosed in quotes or escaped, like in the following examples:

    - `$ ./SomeCoolScript.swift "one two three"` - where `"one two three"` is treated as a single argument
    - `$ ./SomeCoolScript.swift one\ two\ three` - where `one\ two\ three` is treated as a single argument



<br>
--------------------------------------------------
Once you get to this point, you can now start developing your own Swift Scripts and the possibilities are basically endless. With a simple `import ...` statement, you have the full power of the various Mac SDK libraries such as Foundation and AppKit. With a slight modification to your script's shebang line, you can even import third party frameworks like [AlamoFire][] to handle networking or my own [BMParse][] to handle your script's commandline option flags.

> When I originally present *Scripting with Swift* at CocoaHeads of Nashville, BMParse was presented under the title CLParse. I later found out that there are [a lot][] of "CLParse" on Github and subsequently changed the name.

[alamofire]: https://github.com/Alamofire/Alamofire
[bmparse]:   https://github.com/blakemerryman/BMParse/tree/master
[a-lot]:     https://github.com/search?utf8=✓&q=clparse&type=Repositories&ref=searchresults



## Tips & Tricks

- *Third Party Frameworks*
    Change your shebang line to be `#!/usr/bin/env xcrun swift -F /Library/Frameworks` to enable your script to search the Frameworks directory for any module-enabled, third-party frameworks you have stored there.

- *Alias Scripts for Convenient Access*  
    Open your `~/.bash_profile` file and add the following line to it:  
    `alias coolScript="/path/to/file/.../SomeCoolScript.swift"`  

    Now you can call your script from anywhere with `$ coolScript` instead of `$ /path/to/file/.../SomeCoolScript.swift`

- Here's a list of Apple Frameworks to keep in mind when developing your scripts:
    + [NSFileHandle][] - handling dynamic user input from the console
    + [NSFileManager][] - handling any and all types of file system interaction
    + [NSTask][] & [NSPipe][] - interacting with terminal commands and creating pipelines from within your script
    + [JavaScriptCore][] - calling JavaScript from within your script
    + [NSAppleScript][] - calling AppleScript from within your script

[nsfilehandle]:   https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSFileHandle_Class/index.html    
[nsfilemanager]:  https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSFileManager_Class/index.html
[nstask]:         https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSTask_Class/
[nspipe]:         https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSPipe_Class/
[javascriptcore]: https://developer.apple.com/library/mac/documentation/Carbon/Reference/WebKit_JavaScriptCore_Ref/_index.html
[nsapplescript]:  https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSAppleScript_Class/



## Gotchas

- All code execution starts at top level code.
- Compilation of a script file is top-down, so you can't use something before you have defined it in the script file.
- Third party frameworks must have modules enabled or they will not work with Swift. 




