//
//  Checkpoint.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Checkpoint : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *checkpointTime;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, strong) NSArray *coordinates;
@property (nonatomic, copy) NSString *countryISO3;
@property (nonatomic, copy) NSString *countryName;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *zip;

@end
