//
//  main.swift
//  Palindromes
//
//  Created by Мирошниченко Марина on 19.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

let clHelper = CommandLineIOHelper()
var userArguments = clHelper.input()

if userArguments.count < 2 {
    clHelper.output(outputText: "parameter is not defined, open help with parameter \"h\"", outputType: .error)
    exit(0)
}

switch userArguments[1] {
case "h":
    clHelper.help()
case "p" where !userArguments[2].isEmpty:
    let palindromeFinder = PalindromeFinder()
    let palindromes = palindromeFinder.findPalindromes(inText: userArguments[2])
    if palindromes.isEmpty {
        clHelper.output(outputText: "There are no palindromes", outputType: .message)
    }
    for p in palindromes {
        clHelper.output(outputText: p, outputType: .message)
    }
default:
    clHelper.output(outputText: "parameter is not defined, open help with parameter \"h\"", outputType: .error)
}
