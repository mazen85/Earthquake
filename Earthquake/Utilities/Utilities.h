//
//  Utilities.h
//  Earthquake
//
//  Created by Mazen Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+ (void)hideCustomHUD:(UIView *)view afterDelay:(float)delay;
+ (NSString *)intensityOfEarthquake:(float)magnitude;
+ (UIColor *)colourIntensityOfEarthquake:(float)magnitude;

@end
