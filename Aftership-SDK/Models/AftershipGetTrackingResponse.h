//
//  AftershipGetTrackingResponse.h
//  Aftership
//
//  Created by Cp CHING on 13/3/16.
//  Copyright © 2016 Cp CHING. All rights reserved.
//

#import "AftershipResponse.h"

@class Tracking;

@interface AftershipGetTrackingResponse : AftershipResponse

@property (nonatomic, strong) Tracking *tracking;

@end
