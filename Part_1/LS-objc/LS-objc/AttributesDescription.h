//
//  AttributesDescription.h
//  LS-objc
//
//  Created by Мирошниченко Марина on 10.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

#ifndef AttributesDescription_h
#define AttributesDescription_h

@interface AttributesDescription : NSObject
- (NSString *)description;
- (id) init: (NSDictionary *) attributes;
@property (weak, nonatomic) NSDate *creationDate;
@property (weak, nonatomic) NSNumber *fileSize;
@end

#endif /* AttributesDescription_h */
