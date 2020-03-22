//
//  CommandLineIOHelper.m
//  LS-objc
//
//  Created by Мирошниченко Марина on 06.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandLineIOHelper.h"

@implementation CommandLineIOHelper

- (NSArray *)input {
    NSArray *arguments = [[NSProcessInfo processInfo] arguments];
    return arguments;
}

- (void)help {
    NSString *helpMessage = @"   To use command \"ls\", enter the following characters:\n\
    \"-h\" shows help information\n;\
    \"-a\" shows files in current directory including hidden files;\n\
    \"-l\" shows files additional information; ";
    printf("%s", [helpMessage cStringUsingEncoding: NSUTF8StringEncoding]);
}

- (void)output:(NSString *)outputText outputType:(enum OutputType)type {
    switch (type) {
        case message:
            printf("%s", [outputText cStringUsingEncoding: NSUTF8StringEncoding]);
            break;
        case error:
            NSLog(@"%@", outputText);
            break;
        default:
            break;
    }
}
@end
