//
//  EarthquakeTests.m
//  EarthquakeTests
//
//  Created by Mazen Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EarthquakeAPIManager.h"
#import "RestkitConfigurator.h"

@interface EarthquakeTests : XCTestCase

@end

@implementation EarthquakeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [RestkitConfigurator configureRestKitWithCoreDataStack];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetEarthquakes {
    // This is an example of a functional test case.
    [EarthquakeAPIManager GETquakesWithQuery:kAllRange completionHandler:^(Earthquake *result, NSError *error) {
        if (error) {
            XCTFail(@"%@",[error localizedDescription]);
        } else {
            NSArray *quakes = [result.earthquakes allObjects];
            XCTAssertNotNil(result, @"Response should not be nil.");
            XCTAssertNotNil(quakes, @"Earthquakes should not be nil.");
            XCTAssert([quakes isKindOfClass:[NSArray class]], @"Should be array.");
        }
    }];
}


@end
