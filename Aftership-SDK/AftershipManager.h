//
//  AftershipManager.h
//  Aftership
//
//  Created by Cp CHING on 10/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipRequest.h"

@class AftershipGetTrackingParams;
@class AftershipCreateTrackingParams;

@interface AftershipManager : NSObject

@property (nonatomic, copy) NSString *apiUrl;
@property (nonatomic, copy) NSString *apiKey;

/*
 When you want a rate limit handling
 */
@property (nonatomic, copy) RateLimitHandlingBlock rateLimitHandling;

+ (AftershipManager *)sharedManager;

#pragma mark - Setup functions
/**
 * Register manager with API Key
 @method registerWithApiKey:
 @param apiKey The Aftership developer api key.
 */
- (void)registerWithApiKey:(NSString *)apiKey;

/**
 * Register manager with API Key and rate limit handling callback
 @method registerWithApiKey:
 @param apiKey The Aftership developer api key.
 @param rateLimitHandling The completion callback for rate limit checking
 */
- (void)registerWithApiKey:(NSString *)apiKey rateLimitHandling:(RateLimitHandlingBlock)rateLimitHandling;

/**
 * Register manager with API Key, API Endpoint and API Version
 @method registerWithApiKey:apiEndpoint:apiVersion:
 @param apiKey The Aftership developer api key.
 @param apiEndpoint The server url
 @param apiVersion The API version
 */
- (void)registerWithApiKey:(NSString *)apiKey apiEndpoint:(NSString *)apiEndpoint apiVersion:(int)version;

/**
 * Register manager with API Key, API Endpoint, API Version and also rate limit handling callback
 @method registerWithApiKey:apiEndpoint:apiVersion:
 @param apiKey The Aftership developer api key.
 @param apiEndpoint The server url
 @param apiVersion The API version
 @param rateLimitHandling The completion callback for rate limit checking
 */
- (void)registerWithApiKey:(NSString *)apiKey apiEndpoint:(NSString *)apiEndpoint apiVersion:(int)version
         rateLimitHandling:(RateLimitHandlingBlock)rateLimitHandling;

#pragma mark - Custom functions
- (AFHTTPSessionManager *)newHttpManager;

#pragma mark - Request functions
/**
 * Get single tracking with slug and tracking number
 @method getTrackingWithSlug:trackingNumber:params:completion:
 @param slug The slug for the tracking
 @param number The tracking number for the tracking
 @param completion The completion callback
 */
- (void)getTrackingWithSlug:(NSString *)slug trackingNumber:(NSString *)number
                     params:(AftershipGetTrackingParams *)params
                 completion:(RequestCompletionBlock)completion;

/**
 * Get single tracking with tracking ID
 @method getTrackingWithTrackingId:params:completion:
 @param trackingId The tracking ID for the tracking
 @param completion The completion callback
 */
- (void)getTrackingWithTrackingId:(NSString *)trackingId
                           params:(AftershipGetTrackingParams *)params
                       completion:(RequestCompletionBlock)completion;

/**
 * Create a tracking with tracking number
 @method createTrackingWithTrackingNumber:params:completion:
 @param params The tracking parameters
 @param completion The completion callback
 */
- (void)createTrackingWithParams:(AftershipCreateTrackingParams *)params
                      completion:(RequestCompletionBlock)completion;

@end
