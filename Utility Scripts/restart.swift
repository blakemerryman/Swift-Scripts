#!/usr/bin/env xcrun swift

/*
 restart.swift
 Created by Blake Merryman on 2015-08-29.
 See https://github.com/blakemerryman/Swift-Scripts for documentation.
 */

 import Foundation

 let appleScript = NSAppleScript(source: "tell app \"loginwindow\" to «event aevtrrst»")

 var possibleError: NSDictionary?
 appleScript?.executeAndReturnError(&possibleError)

 if let error = possibleError {
     print("ERROR: \(error)")
 }
