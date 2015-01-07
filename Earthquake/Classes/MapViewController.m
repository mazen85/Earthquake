//
//  MapViewController.m
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "MapViewController.h"
#import "TTTTimeIntervalFormatter.h"
#import "AddressAnnotation.h"

@interface MapViewController () {
    
    __weak IBOutlet MKMapView *mMapView;
    __weak IBOutlet UILabel *depthLabel;
    __weak IBOutlet UILabel *magnitudeLabel;
    __weak IBOutlet UILabel *regionLabel;
    __weak IBOutlet UILabel *nzdtLabel;
    __weak IBOutlet UILabel *datetimeLabel;
    __weak IBOutlet UILabel *intensityLabel;
}

@end

@implementation MapViewController

@synthesize selectedQuake;


static TTTTimeIntervalFormatter *timeFormatter;
static NSDateFormatter *dateFormatter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDateFormatters];
    [self setQuakeDetails:self.selectedQuake];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [mMapView release];
    [depthLabel release];
    [magnitudeLabel release];
    [regionLabel release];
    [nzdtLabel release];
    [datetimeLabel release];
    [intensityLabel release];
    [super dealloc];
}

- (void)initDateFormatters {
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

- (void)setQuakeDetails:(Quake *)quake {
    
    [depthLabel setText:[NSString stringWithFormat:@"%@ km", quake.depth.stringValue]];
    [magnitudeLabel setText:quake.magnitude.stringValue];
    [regionLabel setText:quake.region];
    [nzdtLabel setText:[dateFormatter stringFromDate:quake.timedate]];
    [intensityLabel setText:[Utilities intensityOfEarthquake:quake.magnitudeValue]];
    [datetimeLabel setText:[timeFormatter stringForTimeIntervalFromDate:[NSDate date] toDate:quake.timedate]];
    [self dropPinOnMapWithRegion:quake.region lat:quake.lat lon:quake.lon];
}

- (void)dropPinOnMapWithRegion:(NSString *)location lat:(NSDecimalNumber *)lat lon:(NSDecimalNumber *)lon {
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = lat.floatValue;
    coordinate.longitude = lon.floatValue;
    
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = MKCoordinateSpanMake(1.0, 1.0);
    [mMapView setRegion:region animated: YES];
    
    AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:coordinate];
    addAnnotation.mTitle = location;
    [mMapView addAnnotation:addAnnotation];
    [mMapView selectAnnotation:addAnnotation animated:YES];
    [addAnnotation release];
}

# pragma mark - MKAnnotationView

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
    
    if([annotation isMemberOfClass:[MKUserLocation class]])
        return nil;
    
    MKPinAnnotationView *annView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pins"];
    
    if (annView == nil) {
        annView =[[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                 reuseIdentifier:@"pins"];
    }
    
    annView.tintColor = [UIColor colorWithRed:92/255.0 green:36/255.0 blue:123/255.0 alpha:1];
    annView.animatesDrop=YES;
    annView.canShowCallout = YES;
    
    return annView;
}

/*
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
