//
//  AftershipError.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipError.h"
#import "Meta.h"

@implementation AftershipError

+ (AftershipError *)errorWithMeta:(Meta *)meta  {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Type: %@, Message: %@",
                                                           meta.type, meta.message]
                               };
    AftershipError *error = [AftershipError errorWithDomain:@"aftership-sdk" code:meta.code.intValue userInfo:userInfo];
    return error;
}

+ (AftershipError *)errorWithCode:(int)code message:(NSString *)message  {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: message
                               };
    AftershipError *error = [AftershipError errorWithDomain:@"aftership-sdk" code:code userInfo:userInfo];
    return error;
}

@end
