//
//  AftershipError.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Foundation/Foundation.h>

static int const AFTER_SHIP_PARSE_ERROR_CODE = 999;

@class Meta;

@interface AftershipError : NSError

+ (AftershipError *)errorWithMeta:(Meta *)meta;
+ (AftershipError *)errorWithCode:(int)code message:(NSString *)message;

@end
