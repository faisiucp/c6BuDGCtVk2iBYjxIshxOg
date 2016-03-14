//
//  AftershipRequest.h
//  Aftership
//
//  Created by Cp CHING on 10/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AftershipRequest;
@class AftershipResponse;
@class AftershipError;

typedef void (^RequestCompletionBlock) (AftershipRequest *request,
                                        AftershipResponse *response,
                                        id result,
                                        AftershipError *error);

typedef void (^RateLimitHandlingBlock) (int resetTime,
                                        int limit,
                                        int remaining);

@interface AftershipRequest : NSObject

@property (nonatomic, copy) NSString *urlPath;
@property (nonatomic, copy) MTLModel <MTLJSONSerializing> *params;
@property (nonatomic, copy) RequestCompletionBlock completionBlock;
@property (nonatomic, copy) RateLimitHandlingBlock rateLimitHandling;

- (void)executeWithHTTPManager:(AFHTTPSessionManager *)manager host:(NSString *)host;

- (NSDictionary *)requestParameters;
- (AftershipResponse *)responseMapping:(id)responseObject;

- (void)handleRateLimit:(NSURLSessionDataTask *)task;

@end
