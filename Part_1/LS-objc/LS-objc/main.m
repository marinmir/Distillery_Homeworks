//
//  main.m
//  LS-objc
//
//  Created by Мирошниченко Марина on 06.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandLineIOHelper.h"
#import "AttributesDescription.h"
#import "NSFileManager+Files.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
         CommandLineIOHelper *clhelper = [[CommandLineIOHelper alloc] init];

        NSArray *userArguments = [clhelper input];
        
        if ([userArguments count] < 2) {
            [clhelper output:@"parameter is not defined, open help with parameter \"-h\"" outputType: error];
            return 0;
        }
        
        BOOL shouldCallHelp = [userArguments containsObject:@"-h"];
        if (shouldCallHelp) {
            [clhelper help];
            return 0;
        }

        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString *currentDirectoryPath = [fileManager currentDirectoryPath];
        
        BOOL shouldShowAdditionalInformation = [userArguments containsObject:@"-l"];
        BOOL shouldSkipsHiddenFiles = ![userArguments containsObject:@"-a"];
        NSArray *urls = [fileManager urlsForDirectory:currentDirectoryPath skipsHiddenFiles:shouldSkipsHiddenFiles];

        for (int i = 0; i < [urls count]; i++) {
            NSURL *url = urls[i];
            
            AttributesDescription *attributes = [[AttributesDescription alloc] init:[fileManager fileAttributesForPath:[url path]]];
            
            NSString *str;
            
            if (shouldShowAdditionalInformation) {
                 str = [NSString stringWithFormat:@"%@    %@", [attributes description], [url relativePath]];
            } else {
                str = [NSString stringWithFormat:@"%@", [url relativePath]];
            }
            
             [clhelper output: str outputType: message];
        }
    }
    return 0;
}
