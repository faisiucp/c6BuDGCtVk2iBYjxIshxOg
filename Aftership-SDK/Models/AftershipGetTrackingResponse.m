//
//  AftershipGetTrackingResponse.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipGetTrackingResponse.h"
#import "Meta.h"
#import "Tracking.h"

@implementation AftershipGetTrackingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"meta": @"meta",
             @"tracking": @"data.tracking"
             };
}

+ (NSValueTransformer *)metaJSONTransformer  {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Meta class]];
}

+ (NSValueTransformer *)trackingJSONTransformer  {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Tracking class]];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error  {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    
    
    return self;
}

@end
