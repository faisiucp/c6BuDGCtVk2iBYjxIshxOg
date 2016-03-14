//
//  Meta.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "Meta.h"

@implementation Meta

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code": @"code",
             @"message": @"message",
             @"type": @"type"
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error  {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    
    
    return self;
}

@end
