//
//  AddressAnnotation.m
//  Earthquake
//
//  Created by Marwan Wadea on 9/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "AddressAnnotation.h"


@implementation AddressAnnotation

@synthesize coordinate, mTitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c {
	coordinate = c;
	return self;
}

- (NSString *)title{
	return mTitle;
}

- (void)dealloc {
    [mTitle release];
    [super dealloc];
}


@end
