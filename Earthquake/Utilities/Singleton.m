//
//  Singleton.m
//  Earthquake
//
//  Created by Marwan Wadea on 2/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (id)sharedInstance {
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

@end
