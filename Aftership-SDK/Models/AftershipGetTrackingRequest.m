//
//  AftershipGetTrackingRequest.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipGetTrackingRequest.h"
#import "AftershipGetTrackingParams.h"
#import "AftershipGetTrackingResponse.h"
#import "AftershipError.h"

@implementation AftershipGetTrackingRequest

+ (AftershipGetTrackingRequest *)requestWithSlug:(NSString *)slug trackingNumber:(NSString *)number
                            params:(AftershipGetTrackingParams *)params
                                      completion:(RequestCompletionBlock)completion {
    return [[AftershipGetTrackingRequest alloc] initWithSlug:slug trackingNumber:number
                                                  trackingId:nil
                                                      params:params
                                                  completion:completion];
}

+ (AftershipGetTrackingRequest *)requestWithTrackingId:(NSString *)trackingId
                            params:(AftershipGetTrackingParams *)params
                                            completion:(RequestCompletionBlock)completion {
    return [[AftershipGetTrackingRequest alloc] initWithSlug:nil trackingNumber:nil
                                                  trackingId:trackingId
                                                      params:params
                                                  completion:completion];
}

- (instancetype)initWithSlug:(NSString *)slug trackingNumber:(NSString *)number
                  trackingId:(NSString *)trackingId
                      params:(AftershipGetTrackingParams *)params
                  completion:(RequestCompletionBlock)completion {
    self = [super init];
    if (self == nil)  {return self;}
    
    if (trackingId == nil)  {
        self.urlPath = [NSString stringWithFormat:@"/trackings/%@/%@", slug, number];
    }  else  {
        self.urlPath = [NSString stringWithFormat:@"/trackings/%@", trackingId];
    }
    
    self.params = params;
    self.completionBlock = completion;
    
    return self;
}

- (void)executeWithHTTPManager:(AFHTTPSessionManager *)manager host:(NSString *)host  {
    __block AftershipRequest *blockSelf = self;
    
    NSString *requestUrl = [host stringByAppendingPathComponent:self.urlPath];
    
    [manager GET:requestUrl parameters:self.requestParameters progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              //  Rate limit handling, if needed
              [blockSelf handleRateLimit:task];
              
              //  Handle response
              AftershipGetTrackingResponse *response = (AftershipGetTrackingResponse *)[blockSelf responseMapping:responseObject];
              if (self.completionBlock)  {
                  
                  if (response)  {
                      //  When response can be parsed
                      if (response.success)  {
                          self.completionBlock(blockSelf, response, response.tracking, nil);
                      }  else  {
                          AftershipError *error = [AftershipError errorWithMeta:response.meta];
                          self.completionBlock(blockSelf, response, nil, error);
                      }
                      
                  }  else  {
              
                      //  If response cannot be parsed
                      AftershipError *error = [AftershipError errorWithCode:AFTER_SHIP_PARSE_ERROR_CODE message:@"Get tracking response error. Please try again"];
                      self.completionBlock(blockSelf, nil, nil, error);
                  }

                  
              }
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
              
              if (self.completionBlock)  {
                  self.completionBlock(blockSelf, nil, nil, (AftershipError *)error);
              }
          }];
}

- (AftershipResponse *)responseMapping:(id)responseObject  {
    NSError *error;
    AftershipGetTrackingResponse *response = [MTLJSONAdapter modelOfClass:[AftershipGetTrackingResponse class] fromJSONDictionary:responseObject error:&error];
    if (error == nil)  {return response;}
    
    return nil;
}

@end
