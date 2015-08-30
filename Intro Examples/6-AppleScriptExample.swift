#!/usr/bin/env xcrun swift

import Foundation

enum Options: String {
    case ShutDown = "--off"
    case Restart  = "--restart"
    case Sleep    = "--sleep"
    case Lock     = "--lock"
}

if Process.arguments.count > 1 {

    let flag = Process.arguments[1]
    let userInput = Options(rawValue: flag)
    var scriptToPerform: NSAppleScript?

    // WARNING - Needs much better error handling here ( non-Options from user == CRASH!!! )
    // Also,

    switch userInput! {

    case .ShutDown:
        let shutDownSource = "tell app \"loginwindow\" to «event aevtrsdn»"
        scriptToPerform = NSAppleScript(source:shutDownSource)

    case .Restart:
        let restartSource = "tell app \"loginwindow\" to «event aevtrrst»"
        scriptToPerform = NSAppleScript(source:restartSource)

    case .Sleep:
        let sleepSource = "tell app \"System Events\" to sleep"
        scriptToPerform = NSAppleScript(source: sleepSource)

    case .Lock:
        let lockSource = "tell application \"System Events\" to tell process \"SystemUIServer\" to click (first menu item of menu 1 of ((click (first menu bar item whose description is \"Keychain menu extra\")) of menu bar 1) whose title is \"Lock Screen\")"
        scriptToPerform = NSAppleScript(source:lockSource)
    }

    if let script = scriptToPerform {

        var possibleError: NSDictionary?
        print("Performing some script... \(userInput!.rawValue)")
        //script.executeAndReturnError(&possibleError)

        if let error = possibleError {
            print("ERROR: \(error)")
        }
    }

}
