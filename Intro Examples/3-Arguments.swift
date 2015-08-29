#!/usr/bin/env xcrun swift

for (index, argument) in enumerate(Process.arguments) {
    println("\(index) - \(argument)")
}

// Notes:
// - enumerate(...) allows indexing within a for..in.. loop.
// - The tuple at the beginning contains the argument & corresponding index.
