//
//  EarthquakeMapper.h
//  Earthquake
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EarthquakeMapper : NSObject

+ (RKResponseDescriptor*)getResponseDescriptor:(RKRequestMethod)method;

@end
