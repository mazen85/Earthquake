//
//  RestkitConfigurator.m
//  Earthquake
//
//  Created by Marwan Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "RestkitConfigurator.h"



// Use a class extension to expose access to MagicalRecord's private setter methods
@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end


@implementation RestkitConfigurator

+ (void)configureRestKitWithCoreDataStack {
    
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Earthquake" ofType:@"momd"]];
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"Earthquake.sqlite"];
    NSError *error = nil;
    [managedObjectStore addSQLitePersistentStoreAtPath:storePath
                                fromSeedDatabaseAtPath:nil
                                     withConfiguration:nil
                                               options:@{
                                                         NSInferMappingModelAutomaticallyOption: @YES,
                                                         NSMigratePersistentStoresAutomaticallyOption: @YES
                                                         }
                                                 error:&error];
    [managedObjectStore createManagedObjectContexts];
    
    // Configure MagicalRecord to use RestKit's Core Data stack
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:managedObjectStore.persistentStoreCoordinator];
    [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
    [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];
    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
    [NSManagedObjectContext MR_contextForCurrentThread];
}

+(RKObjectManager*)getObjectManager {
    
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    [objectManager.HTTPClient setDefaultHeader:@"Accept" value:@"application/json"];
    objectManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    return objectManager;
}


@end
