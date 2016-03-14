//
//  NSMutableDictionary+aftership.m
//  Aftership
//
//  Created by Cp CHING on 15/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "NSMutableDictionary+aftership.h"

@implementation NSMutableDictionary (aftership)

- (void)removeNullObjects:(BOOL)recursive  {
    for (NSString *originalKey in self.allKeys) {
        id value = [self valueForKey:originalKey];

        if ([value isEqual:[NSNull null]]) {
            [self removeObjectForKey:originalKey];
            continue;
        }
        
        if (recursive)  {
            if ([value isKindOfClass:[NSDictionary class]])  {
                NSMutableDictionary *mutableCopy = [value mutableCopy];
                [mutableCopy removeNullObjects:recursive];
                [self setObject:mutableCopy forKey:originalKey];
            }
        }
    }
}

@end
