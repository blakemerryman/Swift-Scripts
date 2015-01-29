#!/usr/bin/env xcrun swift

let groupName  = Process.arguments[1]
let attendence = Process.arguments[2]

println("Hello, \(groupName)! There are \(attendence) people here.")
