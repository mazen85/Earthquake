//
//  EarthquakeAPIManager.m
//  EarthquakeAPIManager
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "EarthquakeAPIManager.h"
#import "RestkitConfigurator.h"
#import "EarthquakeMapper.h"
#import "Quake.h"

@implementation EarthquakeAPIManager

+ (void)GETquakesWithQuery:(NSString *)query completionHandler:(void (^)(Earthquake *result, NSError *error))completionHandler {
    
    RKObjectManager *objectManager = [RestkitConfigurator getObjectManager];
    RKResponseDescriptor *responseDescriptor = [EarthquakeMapper getResponseDescriptor:RKRequestMethodGET];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager getObjectsAtPath:query
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                completionHandler([[mappingResult array] firstObject], nil);
                                
                            } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                completionHandler(nil, error);
                            }];
}

@end
