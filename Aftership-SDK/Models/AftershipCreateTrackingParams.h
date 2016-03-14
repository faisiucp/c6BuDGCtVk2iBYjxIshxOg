//
//  AftershipCreateTrackingParams.h
//  Aftership
//
//  Created by Cp CHING on 14/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tracking;

@interface AftershipCreateTrackingParams : MTLModel <MTLJSONSerializing>

//  Required
@property (nonatomic, copy) NSString *trackingNumber;

//  Optional
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *trackingPostalCode;
@property (nonatomic, copy) NSString *trackingShipDate;
@property (nonatomic, copy) NSString *trackingAccountNumber;
@property (nonatomic, copy) NSString *trackingKey;
@property (nonatomic, copy) NSString *trackingDestinationCountry;
@property (nonatomic, copy) NSArray *android;
@property (nonatomic, copy) NSArray *ios;
@property (nonatomic, copy) NSArray *emails;
@property (nonatomic, copy) NSArray *smses;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *customerName;
@property (nonatomic, copy) NSString *destinationCountryISO3;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderIdPath;
@property (nonatomic, copy) NSDictionary *customFields;

+ (AftershipCreateTrackingParams *)paramsWithTrackingNumber:(NSString *)number;

@end
