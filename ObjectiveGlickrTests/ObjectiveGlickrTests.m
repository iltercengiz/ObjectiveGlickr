//
//  ObjectiveGlickrTests.m
//  ObjectiveGlickrTests
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlickrAPIClient.h"
#import "RecentPhotosRouter.h"

@interface ObjectiveGlickrTests : XCTestCase

@end

@implementation ObjectiveGlickrTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRecentPhotos {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Recent photos"];
    
    [RecentPhotosRouter fetchRecentPhotosWithSuccess:^(PhotosResponse *response) {
        NSLog(@"Response: %@", response);
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
        [expectation fulfill];
    }];
    
//    RecentPhotosRequest *request = [RecentPhotosRequest new];
//    [[FlickrAPIClient sharedInstance] request:request success:^(NSURLSessionDataTask *task, id response) {
//        NSLog(@"Response: %@", response);
//        [expectation fulfill];
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"Error: %@", error);
//        [expectation fulfill];
//    }];
    
    [self waitForExpectationsWithTimeout:60 handler:^(NSError * _Nullable error) {
        NSLog(@"Recent photos failed!");
    }];
}

@end
