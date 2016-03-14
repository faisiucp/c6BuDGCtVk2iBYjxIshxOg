//
//  AftershipResponse.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Meta;

@interface AftershipResponse : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) Meta *meta;

- (BOOL)success;

@end
