//
//  AttributesDescription.m
//  LS-objc
//
//  Created by Мирошниченко Марина on 10.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttributesDescription.h"

@implementation AttributesDescription
- (NSString *)description {
    NSString *dateString = @"Unknown date";
    if (creationDate != NULL) {
        dateString = [creationDate description];
    }
    
    NSString *sizeString = @"Unknown size";
    if (fileSize != NULL) {
        sizeString = [NSString stringWithFormat: @"%@", fileSize];
    }
    
    return [NSString stringWithFormat: @"%@     %@", dateString, sizeString];
}

- (id)init:(NSDictionary *)attributes {
    self = [super init];
    
    fileSize = [attributes objectForKey:NSFileSize];
    creationDate = [attributes objectForKey:NSFileCreationDate];
    
    return self;
}

@synthesize creationDate;
@synthesize fileSize;
@end
