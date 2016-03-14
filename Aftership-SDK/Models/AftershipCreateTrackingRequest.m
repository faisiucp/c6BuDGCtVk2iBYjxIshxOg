//
//  AftershipCreateTrackingRequest.m
//  Aftership
//
//  Created by Cp CHING on 14/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipCreateTrackingRequest.h"
#import "AftershipCreateTrackingParams.h"
#import "AftershipCreateTrackingResponse.h"
#import "AftershipError.h"

@implementation AftershipCreateTrackingRequest

+ (AftershipCreateTrackingRequest *)requestWithParams:(AftershipCreateTrackingParams *)params
                                           completion:(RequestCompletionBlock)completion  {
    return [[AftershipCreateTrackingRequest alloc] initWithParams:params completion:completion];
}

- (instancetype)initWithParams:(AftershipCreateTrackingParams *)params
                    completion:(RequestCompletionBlock)completion  {
    self = [super init];
    if (self == nil)  {return self;}
    
    self.urlPath = @"/trackings";
    self.params = params;
    self.completionBlock = completion;
    
    return self;
}

- (void)executeWithHTTPManager:(AFHTTPSessionManager *)manager host:(NSString *)host  {
    __block AftershipRequest *blockSelf = self;

    NSString *requestUrl = [host stringByAppendingPathComponent:self.urlPath];
    
    [manager POST:requestUrl parameters:self.requestParameters progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             //  Rate limit handling, if needed
             [blockSelf handleRateLimit:task];

             //  Handle response
             AftershipCreateTrackingResponse *response = (AftershipCreateTrackingResponse *)[blockSelf responseMapping:responseObject];
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
                     AftershipError *error = [AftershipError errorWithCode:AFTER_SHIP_PARSE_ERROR_CODE message:@"Create tracking response error. Please try again"];
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
    AftershipCreateTrackingResponse *response = [MTLJSONAdapter modelOfClass:[AftershipCreateTrackingResponse class] fromJSONDictionary:responseObject error:&error];
    if (error == nil)  {return response;}
    
    return nil;
}

@end
