//
//  AftershipCreateTrackingRequest.h
//  Aftership
//
//  Created by Cp CHING on 14/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipRequest.h"

@class AftershipCreateTrackingParams;

@interface AftershipCreateTrackingRequest : AftershipRequest

@property (nonatomic, copy) NSString *trackingNumber;

+ (AftershipCreateTrackingRequest *)requestWithParams:(AftershipCreateTrackingParams *)params
                                           completion:(RequestCompletionBlock)completion;
- (instancetype)initWithParams:(AftershipCreateTrackingParams *)params
                    completion:(RequestCompletionBlock)completion;

@end
