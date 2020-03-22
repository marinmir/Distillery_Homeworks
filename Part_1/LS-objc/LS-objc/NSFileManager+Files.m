//
//  NSFileManager+Files.m
//  LS-objc
//
//  Created by Мирошниченко Марина on 11.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#import "NSFileManager+Files.h"

#import <AppKit/AppKit.h>

@implementation NSFileManager (Files)

- (NSArray *)urlsForDirectory:(NSString *)directory skipsHiddenFiles:(BOOL)skipsHiddenFiles {
    NSError *error = nil;
    NSURL* url = [[NSURL alloc] initFileURLWithPath:directory];
    
    return [self contentsOfDirectoryAtURL:url includingPropertiesForKeys:NULL options: (skipsHiddenFiles ? NSDirectoryEnumerationSkipsHiddenFiles : 0) error:&error];
}

- (NSDictionary *)fileAttributesForPath:(NSString *)path {
    NSError *error = nil;
    NSDictionary* result = [self attributesOfItemAtPath:path error:&error];
    if (error != nil) {
        NSLog(@"%@", [error description]);
    }
    return result;
}
@end
