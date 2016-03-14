//
//  Tracking.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Tracking : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *trackingId;
@property (nonatomic, copy) NSString *trackingPostalCode;
@property (nonatomic, copy) NSString *trackingShipDate;
@property (nonatomic, copy) NSString *trackingAccountNumber;
@property (nonatomic, copy) NSString *trackingKey;
@property (nonatomic, copy) NSString *trackingDestinationCountry;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *trackingNumber;
@property (nonatomic, copy) NSNumber *active;
@property (nonatomic, strong) NSArray *android;
@property (nonatomic, strong) NSDictionary *customFields;
@property (nonatomic, copy) NSString *customerName;
@property (nonatomic, copy) NSNumber *deliveryTime;
@property (nonatomic, copy) NSString *destinationCountryISO3;
@property (nonatomic, strong) NSArray *emails;
@property (nonatomic, copy) NSString *expectedDelivery;
@property (nonatomic, strong) NSArray *ios;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderIdPath;
@property (nonatomic, copy) NSString *originCountryISO3;
@property (nonatomic, copy) NSString *uniqueToken;
@property (nonatomic, copy) NSNumber *shipmentPackageCount;
@property (nonatomic, copy) NSString *shipmentType;
@property (nonatomic, copy) NSString *shipmentWeight;
@property (nonatomic, copy) NSString *shipmentWeightUnit;
@property (nonatomic, copy) NSString *signedBy;
@property (nonatomic, strong) NSArray *smses;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *trackedCount;
@property (nonatomic, copy) NSArray *checkpoints;

+ (instancetype)trackingWithTrackingNumber:(NSString *)number;

@end
