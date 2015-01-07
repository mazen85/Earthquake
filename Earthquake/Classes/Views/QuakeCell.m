//
//  QuakeCell.m
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "QuakeCell.h"
#import "TTTTimeIntervalFormatter.h"

@implementation QuakeCell
@synthesize quake = _quake;
@synthesize intensityColour = _intensityColour;

static TTTTimeIntervalFormatter *timeFormatter;
static NSDateFormatter *dateFormatter;

- (void)awakeFromNib {
    // Initialization code
    if (!timeFormatter) {
        timeFormatter = [[TTTTimeIntervalFormatter alloc] init];
    }
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:@"EEE, d MMM yyyy, h:mm:ss a"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }
}

- (void)dealloc {
    [_quake release];
    [_intensityColour release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Setter method of Quake
- (void)setQuake:(Quake *)quake {
    _quake = quake;
    [self setQuakeDetails:_quake];
}

- (void)setQuakeDetails:(Quake *)quake {
    
    [depthLabel setText:[NSString stringWithFormat:@"%@ km", quake.depth.stringValue]];
    [magnitudeLabel setText:quake.magnitude.stringValue];
    [regionLabel setText:quake.region];
    [nzdtLabel setText:[dateFormatter stringFromDate:quake.timedate]];
    [intensityLabel setText:[Utilities intensityOfEarthquake:quake.magnitudeValue]];
    [_intensityColour setBackgroundColor:[Utilities colourIntensityOfEarthquake:quake.magnitudeValue]];
    [datetimeLabel setText:[timeFormatter stringForTimeIntervalFromDate:[NSDate date] toDate:quake.timedate]];
}

@end
