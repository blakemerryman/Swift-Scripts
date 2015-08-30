#!/usr/bin/env xcrun swift -F /Library/Frameworks

let userInput = Process.arguments

if userInput.count > 1 {

    let flag = userInput[1]

    if flag == "--print" {
        print("Printing Args: \(Process.arguments)")
    }

    if flag == "--help" {
        print("You're going to need alot of that...")
    }

    // Handle other flags...

}
