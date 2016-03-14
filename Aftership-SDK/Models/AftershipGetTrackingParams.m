//
//  AftershipGetTrackingParams.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipGetTrackingParams.h"

@implementation AftershipGetTrackingParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey  {
    return @{
             @"fields": @"fields",
             @"lang": @"lang"
             };
}

+ (instancetype)paramsWithFields:(NSArray *)fields lang:(NSString *)lang  {
    return [[AftershipGetTrackingParams alloc] initWithFields:fields lang:lang];
}

- (instancetype)initWithFields:(NSArray *)fields lang:(NSString *)lang  {
    self = [super init];
    if (self == nil) return nil;
    
    self.fields = [fields componentsJoinedByString:@","];
    self.lang = lang;
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error  {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    
    return self;
}

@end
