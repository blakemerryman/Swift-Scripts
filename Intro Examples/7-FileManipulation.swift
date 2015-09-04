#!/usr/bin/env xcrun swift -F /Library/Frameworks

import Foundation

let ddFolderPath = NSHomeDirectoryForUser(NSUserName())! + "/Library/Developer/Xcode/DerivedData")

let fileManager = NSFileManager.defaultManager()

if fileManager.fileExistsAtPath(ddFolderPath) {

    do {
        try fileManager.removeItemAtPath( ddFolderPath )
        print("Swift is happy again!")
    } catch let error as NSError {
        print("Error \(error)")
    }
}
