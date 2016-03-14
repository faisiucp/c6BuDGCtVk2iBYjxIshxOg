//
//  Tracking.m
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "Tracking.h"
#import "Checkpoint.h"

@implementation Tracking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"createdAt": @"created_at",
             @"updatedAt": @"updated_at",
             @"trackingId": @"id",
             @"trackingPostalCode": @"tracking_postal_code",
             @"trackingShipDate": @"tracking_ship_date",
             @"trackingAccountNumber": @"tracking_account_number",
             @"trackingKey": @"tracking_key",
             @"trackingDestinationCountry": @"tracking_destination_country",
             @"slug": @"slug",
             @"trackingNumber": @"tracking_number",
             @"active": @"active",
             @"android": @"android",
             @"customFields": @"custom_fields",
             @"customerName": @"customer_name",
             @"deliveryTime": @"delivery_time",
             @"destinationCountryISO3": @"destination_country_iso3",
             @"emails": @"emails",
             @"expectedDelivery": @"expected_delivery",
             @"ios": @"ios",
             @"orderId": @"order_id",
             @"orderIdPath": @"order_id_path",
             @"originCountryISO3": @"origin_country_iso3",
             @"uniqueToken": @"unique_token",
             @"shipmentPackageCount": @"shipment_package_count",
             @"shipmentType": @"shipment_type",
             @"shipmentWeight": @"shipment_weight",
             @"shipmentWeightUnit": @"shipment_weight_unit",
             @"signedBy": @"signed_by",
             @"smses": @"smses",
             @"source": @"source",
             @"tag": @"tag",
             @"title": @"title",
             @"trackedCount": @"tracked_count",
             @"checkpoints": @"checkpoints"
             };
}

+ (NSValueTransformer *)checkpointsJSONTransformer  {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Checkpoint class]];
}

+ (instancetype)trackingWithTrackingNumber:(NSString *)number  {
    return [[Tracking alloc] initWithTrackingNumber:number];
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

- (NSString *)description {
    NSError *error;
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:self error:&error];
    NSError *jsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&jsonError];
    if (!jsonData) {
        return error.localizedDescription;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
