//
//  FlickrAPIClient.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrAPIClientImports.h"

@interface FlickrAPIClient : NSObject

+ (instancetype)sharedInstance;

- (NSURLSessionDataTask *)request:(FlickrAPIRequest *)request
                          success:(void (^)(NSURLSessionDataTask *task, id response))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
