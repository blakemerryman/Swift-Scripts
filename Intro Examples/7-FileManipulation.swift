#!/usr/bin/env xcrun swift -F /Library/Frameworks

import Foundation

let ddFolderPath = NSHomeDirectoryForUser(NSUserName())! + "/Library/Developer/Xcode/DerivedData")

let fileManager = NSFileManager.defaultManager()

if fileManager.fileExistsAtPath(ddFolderPath) {

    var success = true

    do {
        try fileManager.removeItemAtPath( ddFolderPath )
    } catch let error as NSError {
        print("Error \(error)")
        success = false
    }

    if success == true {
        print("Swift is happy again!")
    }
}
