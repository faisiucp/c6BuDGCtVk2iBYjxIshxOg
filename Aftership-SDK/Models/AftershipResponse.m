//
//  AftershipResponse.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipResponse.h"
#import "Meta.h"

@implementation AftershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey  {
    return @{
             @"meta": @"meta"
             };
}

- (BOOL)success  {
    return (self.meta.code.intValue < 400);
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
