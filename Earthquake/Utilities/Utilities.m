//
//  Utilities.m
//  Earthquake
//
//  Created by Mazen Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "Utilities.h"



@implementation Utilities



+ (void)hideCustomHUD:(UIView *)view afterDelay:(float)delay {
    
    [NSThread sleepForTimeInterval:delay];
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

+ (NSString *)intensityOfEarthquake:(float)magnitude {
    
    NSString *intensity;
    
    if (magnitude < 3.0 && magnitude >= 1.0) {
        intensity = @"Unnoticeable";
    }
    else if (magnitude < 4.0 && magnitude >= 3.0) {
        intensity = @"Weak";
    }
    else if (magnitude < 5.0 && magnitude >= 4.0) {
        intensity = @"Light";
    }
    else if (magnitude < 6.0 && magnitude >= 5.0) {
        intensity = @"Moderate";
    }
    else if (magnitude < 7.0 && magnitude >= 6.0) {
        intensity = @"Strong";
    }
    else if (magnitude >= 7.0) {
        intensity = @"Severe";
    }
    
    return intensity;
}

+ (UIColor *)colourIntensityOfEarthquake:(float)magnitude {
    
    UIColor *colourIntensity;
    
    if (magnitude < 3.0 && magnitude >= 1.0) {
        colourIntensity = GRAY_COLOR;
    }
    else if (magnitude < 4.0 && magnitude >= 3.0) {
        colourIntensity = BLUE_COLOR;
    }
    else if (magnitude < 5.0 && magnitude >= 4.0) {
        colourIntensity = GREEN_COLOR;
    }
    else if (magnitude < 6.0 && magnitude >= 5.0) {
        colourIntensity = YELLOW_COLOR;
    }
    else if (magnitude < 7.0 && magnitude >= 6.0) {
        colourIntensity = ORANGE_COLOR;
    }
    else if (magnitude > 7.0) {
        colourIntensity = RED_COLOR;
    }
    
    return colourIntensity;
}


@end
