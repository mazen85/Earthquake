//
//  AddressAnnotation.h
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface AddressAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *mTitle;
}

@property (nonatomic, retain) NSString *mTitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c;

@end
