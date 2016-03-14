//
//  AftershipRequest.m
//  Aftership
//
//  Created by Cp CHING on 10/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipRequest.h"
#import "AftershipResponse.h"

@implementation AftershipRequest

static NSString *const RESPONSE_HEADER_RATELIMIT_RESET = @"X-RateLimit-Reset";
static NSString *const RESPONSE_HEADER_RATELIMIT_LIMIT = @"X-RateLimit-Limit";
static NSString *const RESPONSE_HEADER_RATELIMIT_REMAINING = @"X-RateLimit-Remaining";

- (void)executeWithHTTPManager:(AFHTTPSessionManager *)manager host:(NSString *)host {

}

- (NSDictionary *)requestParameters  {
    if (self.params == nil)  {return nil;}
    
    NSError *error;
    NSDictionary *dictionary = [MTLJSONAdapter JSONDictionaryFromModel:self.params error:&error];
        
    //  Remove null values
    NSMutableDictionary *modifiedDictionary = [dictionary mutableCopy];
    [modifiedDictionary removeNullObjects:YES];
    
    return [modifiedDictionary copy];
}

- (AftershipResponse *)responseMapping:(id)responseObject  {
    return [[AftershipResponse alloc] init];
}

- (void)handleRateLimit:(NSURLSessionDataTask *)task {
    
    id response = task.response;
    if ([response respondsToSelector:@selector(allHeaderFields)])  {

        NSDictionary *headers = [response allHeaderFields];
        
//        NSLog(@"Response Headers : %@", headers);
        
        NSNumber *resetTime = [headers objectForKey:RESPONSE_HEADER_RATELIMIT_RESET];
        NSNumber *limit = [headers objectForKey:RESPONSE_HEADER_RATELIMIT_LIMIT];
        NSNumber *remaining = [headers objectForKey:RESPONSE_HEADER_RATELIMIT_REMAINING];
        if (!resetTime || !limit || !remaining)  {
            return;
        }
        
        if (self.rateLimitHandling)  {
            self.rateLimitHandling(resetTime.intValue, limit.intValue, remaining.intValue);
        }
    }
}

@end
