//
//  Checkpoint.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "Checkpoint.h"

@implementation Checkpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"createdAt": @"created_at",
             @"slug": @"slug",
             @"checkpointTime": @"checkpoint_time",
             @"city": @"city",
             @"coordinates": @"coordinates",
             @"countryISO3": @"country_iso3",
             @"countryName": @"country_name",
             @"message": @"message",
             @"state": @"state",
             @"tag": @"tag",
             @"zip": @"zip"
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error  {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    
    
    return self;
}

- (NSString *)description {
    NSError *error;
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:self error:&error];
    NSError *jsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&jsonError];
    if (!jsonData) {
        return error.localizedDescription;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
