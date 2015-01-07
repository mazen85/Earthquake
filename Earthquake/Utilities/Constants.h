//
//  Constants.h
//  Earthquake
//
//  Created by Mazen Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#ifndef Earthquake_Constants_h
#define Earthquake_Constants_h

#define kBaseUrl @"http://www.seismi.org/api/eqs"

typedef enum {
    kAll        = 0,
    kWeak       = 1,
    kLight      = 2,
    kModerate   = 3,
    kStrong     = 4,
    kSevere     = 5
}IntensityType;

#define GRAY_COLOR      [UIColor colorWithRed:(float)224 / 255.0 green:(float)224 / 255.0 blue:(float)224 / 255.0 alpha:0.5]
#define BLUE_COLOR      [UIColor colorWithRed:(float)153 / 255.0 green:(float)255 / 255.0 blue:(float)204 / 255.0 alpha:1.0]
#define GREEN_COLOR      [UIColor colorWithRed:(float)204 / 255.0 green:(float)255 / 255.0 blue:(float)153 / 255.0 alpha:1.0]
#define YELLOW_COLOR      [UIColor colorWithRed:(float)255 / 255.0 green:(float)247 / 255.0 blue:(float)153 / 255.0 alpha:1.0]
#define ORANGE_COLOR      [UIColor colorWithRed:(float)255 / 255.0 green:(float)204 / 255.0 blue:(float)153 / 255.0 alpha:1.0]
#define RED_COLOR      [UIColor colorWithRed:(float)255 / 255.0 green:(float)153 / 255.0 blue:(float)153 / 255.0 alpha:1.0]

#define All            @"All"
#define Weak           @"Weak+"
#define Light          @"Light+"
#define Moderate       @"Moderate+"
#define Strong         @"Strong+"
#define Severe         @"Severe"

#define kAllRange       @"?min_magnitude=1"
#define kWeakRange      @"?min_magnitude=3"
#define kLightRange     @"?min_magnitude=4"
#define kModerateRange  @"?min_magnitude=5"
#define kStrongRange    @"?min_magnitude=6"
#define kSevereRange    @"?min_magnitude=7"

#define kColour    @"colour"
#define kIntensity @"intensity"

#endif
