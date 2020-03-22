//
//  CommandLineIOHelper.h
//  LS-objc
//
//  Created by Мирошниченко Марина on 06.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#ifndef CommandLineIOHelper_h
#define CommandLineIOHelper_h

enum OutputType {message, error};

enum  LsArguments {h, a, l};

@interface CommandLineIOHelper : NSObject
- (NSArray *) input;
- (void) output: (NSString *)outputText outputType: (enum OutputType) type;
- (void) help;
@end

#endif /* CommandLineIOHelper_h */
