#!/usr/bin/env xcrun swift -F /Library/Frameworks

import Foundation

let ddFolderPath = NSHomeDirectoryForUser(NSUserName()).stringByAppendingPathComponent("Library/Developer/Xcode/DerivedData") 

let fileManager = NSFileManager.defaultManager()

if fileManager.fileExistsAtPath(ddFolderPath) {

    var error: NSError? = nil 
    let removedSuccessfully = fileManager.removeItemAtPath(ddFolderPath, error: &error)

    if error != nil {
        println("Error: \(error)")
    } 
    else {
        if removedSuccessfully {
            println("Swift is happy again!")
        }
    }
}



