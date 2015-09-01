#!/usr/bin/env xcrun swift

/*
 lock-screen.swift
 Created by Blake Merryman on 2015-08-29.
 See https://github.com/blakemerryman/Swift-Scripts for documentation.
 */

 import Foundation

// TODO: This should be improved to not rely on the SystemUIServer if possible.
// Would break if user was running a utility like Bartender or if Keychain extra was not in menu bar.

 let appleScript = NSAppleScript(source: "tell application \"System Events\" to tell process \"SystemUIServer\" to click (first menu item of menu 1 of ((click (first menu bar item whose description is \"Keychain menu extra\")) of menu bar 1) whose title is \"Lock Screen\")")

 var possibleError: NSDictionary?
 appleScript?.executeAndReturnError(&possibleError)

 if let error = possibleError {
     print("ERROR: \(error)")
 }
