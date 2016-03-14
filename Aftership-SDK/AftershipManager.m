//
//  AftershipManager.m
//  Aftership
//
//  Created by Cp CHING on 10/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipManager.h"
#import "AftershipGetTrackingParams.h"
#import "AftershipGetTrackingRequest.h"
#import "AftershipCreateTrackingParams.h"
#import "AftershipCreateTrackingRequest.h"
#import "Tracking.h"

@implementation AftershipManager

static NSString * const AFTERSHIP_API_ENDPOINT = @"https://api.aftership.com/";
static int const AFTERSHIP_API_VERSION = 4;

static NSString * const AFTERSHIP_HEADER_API_KEY = @"aftership-api-key";
static NSString * const AFTERSHIP_HEADER_USER_AGENT = @"aftership-user-agent";

static NSString * const AFTERSHIP_SDK_USER_AGENT = @"aftership-ios-sdk 1.0.0";

#pragma mark - Singleton functions
+ (instancetype)sharedManager {
    static AftershipManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Setup functions
- (void)registerWithApiKey:(NSString *)apiKey  {
    [self registerWithApiKey:apiKey apiEndpoint:AFTERSHIP_API_ENDPOINT apiVersion:AFTERSHIP_API_VERSION];
}

- (void)registerWithApiKey:(NSString *)apiKey rateLimitHandling:(RateLimitHandlingBlock)rateLimitHandling {
    [self registerWithApiKey:apiKey
                 apiEndpoint:AFTERSHIP_API_ENDPOINT
                  apiVersion:AFTERSHIP_API_VERSION
           rateLimitHandling:rateLimitHandling];
}

- (void)registerWithApiKey:(NSString *)apiKey apiEndpoint:(NSString *)apiEndpoint apiVersion:(int)version  {
    self.apiKey = apiKey;
    self.apiUrl = [NSString stringWithFormat:@"%@v%i", apiEndpoint, version];
}

- (void)registerWithApiKey:(NSString *)apiKey apiEndpoint:(NSString *)apiEndpoint apiVersion:(int)version
         rateLimitHandling:(RateLimitHandlingBlock)rateLimitHandling  {
    self.apiKey = apiKey;
    self.apiUrl = [NSString stringWithFormat:@"%@v%i", apiEndpoint, version];
    self.rateLimitHandling = rateLimitHandling;
}

#pragma mark - Custom functions
- (AFHTTPSessionManager *)newHttpManager  {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.requestSerializer setValue:self.apiKey forHTTPHeaderField:AFTERSHIP_HEADER_API_KEY];
    [manager.requestSerializer setValue:AFTERSHIP_SDK_USER_AGENT forHTTPHeaderField:AFTERSHIP_HEADER_USER_AGENT];
    
    return manager;
}

#pragma mark - Request functions
- (void)getTrackingWithSlug:(NSString *)slug trackingNumber:(NSString *)number
                     params:(AftershipGetTrackingParams *)params
                 completion:(RequestCompletionBlock)completion  {
    AftershipGetTrackingRequest *request = [AftershipGetTrackingRequest requestWithSlug:slug
                                                                         trackingNumber:number
                                                                                 params:params
                                                                             completion:completion];
    //  Attach rate limit handling if we have one
    if (self.rateLimitHandling)  {request.rateLimitHandling = self.rateLimitHandling;}
    [request executeWithHTTPManager:self.newHttpManager host:self.apiUrl];
}

- (void)getTrackingWithTrackingId:(NSString *)trackingId
                           params:(AftershipGetTrackingParams *)params
                       completion:(RequestCompletionBlock)completion  {
    AftershipGetTrackingRequest *request = [AftershipGetTrackingRequest requestWithTrackingId:trackingId
                                                                                       params:params
                                                                                   completion:completion];
    //  Attach rate limit handling if we have one
    if (self.rateLimitHandling)  {request.rateLimitHandling = self.rateLimitHandling;}
    [request executeWithHTTPManager:self.newHttpManager host:self.apiUrl];
}

- (void)createTrackingWithParams:(AftershipCreateTrackingParams *)params
                      completion:(RequestCompletionBlock)completion  {
    AftershipCreateTrackingRequest *request = [AftershipCreateTrackingRequest requestWithParams:params
                                                                                     completion:completion];
    //  Attach rate limit handling if we have one
    if (self.rateLimitHandling)  {request.rateLimitHandling = self.rateLimitHandling;}
    [request executeWithHTTPManager:self.newHttpManager host:self.apiUrl];
}

@end
