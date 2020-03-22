//
//  NSFileManager+Files.h
//  LS-objc
//
//  Created by Мирошниченко Марина on 11.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Files)
- (NSArray *) urlsForDirectory: (NSString *) directory skipsHiddenFiles: (BOOL) skipsHiddenFiles;
- (NSDictionary *) fileAttributesForPath: (NSString *) path;
@end

NS_ASSUME_NONNULL_END
