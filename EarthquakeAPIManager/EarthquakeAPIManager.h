//
//  EarthquakeAPIManager.h
//  EarthquakeAPIManager
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Earthquake.h"

@interface EarthquakeAPIManager : NSObject

+ (void)GETquakesWithQuery:(NSString *)query completionHandler:(void (^)(Earthquake *result, NSError *error))completionHandler;

@end
