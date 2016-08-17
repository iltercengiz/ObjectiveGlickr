//
//  RecentPhotosRouter.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "RecentPhotosRouter.h"

@implementation RecentPhotosRouter

+ (void)fetchRecentPhotos:(NSNumber *)page success:(void (^)(PhotosResponse *response))success failure:(void (^)(NSError *error))failure {
    RecentPhotosRequest *request = [RecentPhotosRequest new];
    request.page = page;
    [[FlickrAPIClient sharedInstance] request:request success:^(NSURLSessionDataTask *task, id response) {
        PhotosResponse *responseObject = [FEMDeserializer objectFromRepresentation:response mapping:[PhotosResponse mapping]];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
