//
//  AftershipGetTrackingParams.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

@interface AftershipGetTrackingParams : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *fields;
@property (nonatomic, copy) NSString *lang;

+ (instancetype)paramsWithFields:(NSArray *)fields lang:(NSString *)lang;

@end
