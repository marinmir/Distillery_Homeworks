//
//  CommandLineIOHelper.swift
//  Palindromes
//
//  Created by Мирошниченко Марина on 26.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

enum OutputType {
    case message
    case error
}

class CommandLineIOHelper {
        
    func input() -> [String] {
        return CommandLine.arguments
    }
    
    func output(outputText text: String, outputType type: OutputType) {
        switch type {
        case .message:
            print(text)
        case .error:
            fputs(text, stderr)
        }
    }
    
    func help() -> Void {
        print("""

        To use this command, enter the following characters:
        h - request for assistance;
        p “someString” - search for palindromes in the specified string.
        """)
    }
}
