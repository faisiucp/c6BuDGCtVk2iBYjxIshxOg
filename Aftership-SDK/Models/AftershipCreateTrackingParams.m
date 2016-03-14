//
//  AftershipCreateTrackingParams.m
//  Aftership
//
//  Created by Cp CHING on 14/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipCreateTrackingParams.h"
#import "Tracking.h"

@implementation AftershipCreateTrackingParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey  {
    return @{
             @"trackingNumber": @"tracking.tracking_number",
             @"slug": @"tracking.slug",
             @"trackingPostalCode": @"tracking.tracking_postal_code",
             @"trackingShipDate": @"tracking.tracking_ship_date",
             @"trackingAccountNumber": @"tracking.tracking_account_number",
             @"trackingKey": @"tracking.tracking_key",
             @"trackingDestinationCountry": @"tracking.tracking_destination_country",
             @"android": @"tracking.android",
             @"ios": @"tracking.ios",
             @"emails": @"tracking.emails",
             @"smses": @"tracking.smses",
             @"title": @"tracking.title",
             @"customerName": @"tracking.customer_name",
             @"destinationCountryISO3": @"tracking.destination_country_iso3",
             @"orderId": @"tracking.order_id",
             @"orderIdPath": @"tracking.order_id_path",
             @"customFields": @"tracking.custom_fields"
             };
}

+ (AftershipCreateTrackingParams *)paramsWithTrackingNumber:(NSString *)number  {
    return [[AftershipCreateTrackingParams alloc] initWithTrackingNumber:number];
}

+ (NSValueTransformer *)trackingJSONTransformer  {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Tracking class]];
}

- (instancetype)initWithTrackingNumber:(NSString *)number  {
    self = [super init];
    if (self == nil) return nil;
    
    self.trackingNumber = number;
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error  {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    
    return self;
}

@end
