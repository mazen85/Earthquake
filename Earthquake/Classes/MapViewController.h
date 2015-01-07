//
//  MapViewController.h
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quake.h"
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) Quake *selectedQuake;

@end
