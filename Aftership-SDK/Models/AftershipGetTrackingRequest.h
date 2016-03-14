//
//  AftershipGetTrackingRequest.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipRequest.h"

@class AftershipGetTrackingParams;

@interface AftershipGetTrackingRequest : AftershipRequest

+ (AftershipGetTrackingRequest *)requestWithSlug:(NSString *)slug trackingNumber:(NSString *)number
                                          params:(AftershipGetTrackingParams *)params
                                      completion:(RequestCompletionBlock)completion;
+ (AftershipGetTrackingRequest *)requestWithTrackingId:(NSString *)trackingId
                                                params:(AftershipGetTrackingParams *)params
                                            completion:(RequestCompletionBlock)completion;

@end
