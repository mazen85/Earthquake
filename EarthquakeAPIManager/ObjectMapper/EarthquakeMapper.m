//
//  EarthquakeMapper.m
//  Earthquake
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "EarthquakeMapper.h"

@implementation EarthquakeMapper

+ (NSArray *)quakeMappings {
    
    NSArray *quakeAttributeMappings = @[@"src",
                                       @"eqid",
                                       @"timedate",
                                       @"lat",
                                       @"lon",
                                       @"magnitude",
                                       @"depth",
                                       @"region"];
    return quakeAttributeMappings;
}


+(RKEntityMapping*)getObjectMapping:(RKRequestMethod)method {
    
    RKEntityMapping *earthquakesMappings = [RKEntityMapping mappingForEntityForName:@"Earthquake"
                                                               inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    RKEntityMapping *objectMapping = [RKEntityMapping mappingForEntityForName:@"Quake"
                                                         inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    NSArray *attributeMappings = [self quakeMappings];
    [objectMapping addAttributeMappingsFromArray:attributeMappings];
    [earthquakesMappings addAttributeMappingsFromArray:@[@"count"]];
    [earthquakesMappings addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"earthquakes"
                                                                                        toKeyPath:@"earthquakes"
                                                                                      withMapping:objectMapping]];
    
    return earthquakesMappings;
}


+(RKResponseDescriptor*)getResponseDescriptor:(RKRequestMethod)method {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self getObjectMapping:method]
                                                                                            method:method
                                                                                       pathPattern:nil
                                                                                           keyPath:nil
                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return responseDescriptor;
}

@end
