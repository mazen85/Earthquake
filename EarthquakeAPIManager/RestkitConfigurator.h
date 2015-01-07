//
//  RestkitConfigurator.h
//  Earthquake
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectManager.h"

@interface RestkitConfigurator : NSObject

+(void)configureRestKitWithCoreDataStack;
+(RKObjectManager*)getObjectManager;

@end
