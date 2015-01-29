#!/usr/bin/env xcrun swift -F /Library/Frameworks

let userInput = Process.arguments

if userInput.count > 1 {

    let flag = userInput[1]
    
    if flag == "--print" {
        println("Printing Args: \(Process.arguments)")
    }

    if flag == "--help" {
        println("You're going to need alot of that...")
    }

    // Handle other flags...

}