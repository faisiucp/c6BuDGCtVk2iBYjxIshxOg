//
//  AftershipTests.m
//  AftershipTests
//
//  Created by Cp CHING on 10/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Aftership.h"

@interface AftershipTests : XCTestCase

@end

@implementation AftershipTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    AftershipManager *manager = [AftershipManager sharedManager];
    [manager registerWithApiKey:@" ===== API KEY ===== "
              rateLimitHandling:^(int resetTime, int limit, int remaining) {
                  NSLog(@"Reset time: %i", resetTime);
                  NSLog(@"Limit: %i", limit);
                  NSLog(@"Remaining: %i", remaining);
                  
                  //  Rate limit handling
    }];
    
    NSLog(@"URL: %@", manager.apiUrl);
    NSLog(@"KEY: %@", manager.apiKey);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGetTrackWithSlug  {
    
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    
    [[AftershipManager sharedManager] getTrackingWithSlug:@" ===== Slug ===== "
                                           trackingNumber:@" ===== Tracking Number ===== "
                                                   params:nil
                                               completion:^(AftershipRequest *request, AftershipResponse *response, Tracking *tracking, AftershipError *error) {
                                                   
                                                   NSLog(@"Tracking: %@", tracking.description);
                                                   [expectation fulfill];
                                               }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
}

- (void)testGetTrackWithId  {
    
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    
//    AftershipGetTrackingParams *params = [AftershipGetTrackingParams paramsWithFields:@[@"title", @"tag"] lang:nil];
    [[AftershipManager sharedManager] getTrackingWithTrackingId:@" ===== Tracking ID ===== "
                                                   params:nil
                                               completion:^(AftershipRequest *request, AftershipResponse *response, Tracking *tracking, AftershipError *error) {
                                                   
                                                   NSLog(@"Tracking: %@", tracking.description);
                                                   [expectation fulfill];
                                               }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testCreateTrack  {
    
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    
    AftershipCreateTrackingParams *params = [AftershipCreateTrackingParams paramsWithTrackingNumber:@" ===== Tracking Number ===== "];
    [params setTitle:@"Testing"];
    [params setCustomFields:@{@"111": @"111", @"222": @"222"}];
    [[AftershipManager sharedManager] createTrackingWithParams:params
                                                    completion:^(AftershipRequest *request, AftershipResponse *response, Tracking *tracking, AftershipError *error) {
                                                        
                                                        NSLog(@"Tracking: %@", tracking.description);
                                                        NSLog(@"Error: %@", error.userInfo);
                                                        [expectation fulfill];
                                                    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
}

@end
