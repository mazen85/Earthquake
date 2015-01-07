//
//  QuakeCell.h
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quake.h"

@interface QuakeCell : UITableViewCell {
    
    IBOutlet UILabel *depthLabel;
    IBOutlet UILabel *magnitudeLabel;
    IBOutlet UILabel *regionLabel;
    IBOutlet UILabel *nzdtLabel;
    IBOutlet UILabel *datetimeLabel;
    IBOutlet UILabel *intensityLabel;
}

@property (nonatomic, retain) Quake *quake;
@property (nonatomic, retain) IBOutlet UIView *intensityColour;


@end
